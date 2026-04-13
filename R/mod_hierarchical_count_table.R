EC <- poc( # nolint
  ID = poc(
    TABLE = "table",
    DROP_MENU = "drop_menu",
    HIERARCHY = "hierarchy",
    GRP = "group",
    MIN_PERCENT = "min_percent",
    TOTAL_FLAG = "total",
    EVENT_GROUP = "event_group",
    RISK_FLAG = "time_at_risk",
    EVENT_DATE = "event_date",
    ORIGIN_DATE = "origin_date",
    CENSOR_DATE = "censor_date",
    EVENT_DATE_LBL = "event_date_label",
    ORIGIN_DATE_LBL = "origin_date_label",
    CENSOR_DATE_LBL = "censor_date_label",
    TAB_DOWNLOAD = "table_download",
    RENDER_COMPLETION_CALLBACK = "render_completion_callback"
  ),
  LBL = poc(
    DROP_MENU = "Options",
    HIERARCHY = "Event count by",
    GRP = "Group by",
    MIN_PERCENT = "Minimum %",
    TOTAL_FLAG = "Total",
    EVENT_GROUP = "Event group by",
    RISK_FLAG = "Time at Risk",
    EVENT_DATE = "Event Date",
    ORIGIN_DATE = "Origin Date",
    CENSOR_DATE = "Censor Date",
    TAB_DOWNLOAD = "table_download"
  ),
  INFO = poc(
    HIERARCHY = "Up to 2 selections allowed",
    EVENT_GROUP = "Selection from event data",
    EVENT_DATE = "Events with missing dates will be dropped",
    ORIGIN_DATE = "Events occurring before origin date will be dropped",
    CENSOR_DATE = "Events occurring after censor date will be dropped",
    RISK_FLAG = paste("Event date, origin date and censor date must be provided; data with",
                      "missing dates will be excluded from time at risk analysis.", sep = "\n")
  ),
  WARN = poc(
    REQ_TIME_AT_RISK = "Required for Time at Risk"
  ),
  MSG = poc(
    VALIDATE = poc(
      NO_GRP = "No group selected",
      NO_HIERARCHY = "No hierarchy selected",
      NO_MIN_PERCENT = "No minimum percent selected",
      NO_TABLE_ROWS = "Table dataset has 0 rows",
      NO_POP_ROWS = "Population dataset has 0 rows",
      GRP_CLASH = "Group selection cannot be used in hierarchy",
      ORIG_AFTER_CENSOR = "One or more origin dates are after non-missing censor date",
      EVENT_ORIG_CLASH = "Event date must not be the same as origin date",
      EVENT_CENSOR_CLASH = "Event date must not be the same as censor date",
      ORIG_CENSOR_CLASH = "Origin date must not be the same as censor date",
      NO_EVENT_DATE = "No event date selected",
      NO_ORIGIN_DATE = "No origin date selected",
      NO_CENSOR_DATE = "No censor date selected"
    )
  ),
  VAL = poc(
    SPECIAL_CHAR = "\u001D" # For naming and processing hierarchy levels
  )
)

#' Perform count and time at risk analysis on hierarchical data
#'
#' @param event_df `data.frame`
#' A data frame containing the event data. It should have columns corresponding to subjects,
#' hierarchy levels, and group variables.
#'
#' @param pop_df `data.frame`
#' A data frame containing the population data. It must have columns corresponding to subjects and group variables.
#'
#' @param hierarchy `character(1|2)`
#' A character vector of column names from `event_df` to use as the hierarchy. Can be one or two levels.
#'
#' @param group_var `character(1)`
#' A string representing the column name in `pop_df` used for grouping the population data.
#'
#' @param subjid_var `character(1)`
#' A string representing the subject identifier column name. This column must be present in both `event_df` and
#' `pop_df`.
#'
#' @param event_group_var `character(1)`
#' A string representing the column name in `event_df` used for grouping the event data.
#'
#' @param origin_date_var `character(1)`
#' A string representing the column name in `pop_df` holding the origin date.
#'
#' @param censor_date_var `character(1)`
#' A string representing the column name in `pop_df` holding the censor date.
#'
#' @param event_date_var `character(1)`
#' A string representing the column name in `event_df` holding the event date.
#'
#' @return A data frame loosely based on ADaM ADTTE format, with count and time at risk analysis for all hierarchy
#' levels.
#'
#' @keywords internal
create_adtte <- function(event_df,
                         pop_df,
                         hierarchy = character(),
                         group_var,
                         subjid_var,
                         event_group_var,
                         origin_date_var,
                         censor_date_var,
                         event_date_var) {

  # Flag when event group has been specified
  has_event_group <- !is.null(event_group_var) && length(event_group_var) > 0

  # Flags when time at risk dates are specified for population and event data frames
  has_origin_dt <- !is.null(origin_date_var) && length(origin_date_var) > 0
  has_censor_dt <- !is.null(censor_date_var) && length(censor_date_var) > 0
  has_event_dt <- !is.null(event_date_var) && length(event_date_var) > 0

  # Define column names for columns creating in function
  hier_lvl_col <- paste0(EC$VAL$SPECIAL_CHAR, "lvl")
  time_at_risk_col <- paste0(EC$VAL$SPECIAL_CHAR, "time_at_risk")
  censor_col <- paste0(EC$VAL$SPECIAL_CHAR, "censor")
  evt_cens_date_col <- paste0(EC$VAL$SPECIAL_CHAR, "evt_cens_date")

  # Expand population data with event group if specified
  if (has_event_group) {
    evt_grp_levels <- levels(event_df[[event_group_var]])
    evt_grp_df <- stats::setNames(as.data.frame(as.factor(evt_grp_levels)), event_group_var)
    pop_df <- merge(pop_df, evt_grp_df, by = NULL)

    # Merge corrupts factor level order, so need to reapply it!
    pop_df[[event_group_var]] <- factor(pop_df[[event_group_var]], levels = evt_grp_levels)
  }

  # Initialise data frame to hold results from different hierarchy levels
  bind_adtte <- NULL

  # Loop over hierarchy levels, including totals dealt with as level 0
  for (hierarchy_level in 0:length(hierarchy)) {

    hierarchy_cols <- hierarchy[0:hierarchy_level]

    # Remove rows where hierarchy value is NA in any processed hierarchy columns
    subset_event_df <- event_df[stats::complete.cases(event_df[, hierarchy_cols]), ]

    # For each hierarchy group, only keep first event occurrence
    if (has_event_dt && nrow(event_df) > 0) {
      subset_event_df <- subset_event_df |>
        dplyr::group_by(dplyr::across(dplyr::all_of(c(subjid_var, hierarchy_cols, event_group_var)))) |>
        dplyr::summarise(!!event_date_var := min(.data[[event_date_var]]), .groups = "drop")
    } else {
      subset_event_df <- subset_event_df |>
        dplyr::group_by(dplyr::across(dplyr::all_of(c(subjid_var, hierarchy_cols, event_group_var)))) |>
        dplyr::slice(1) |>
        dplyr::ungroup()
    }

    # Identify records with events before merging onto all hierarchy combinations
    subset_event_df[[censor_col]] <- FALSE

    # Expand population data using grid of hierarchy combinations to create base records for ADTTE ----

    if (hierarchy_level != 0) {
      hierarchy_grid <- unique(subset_event_df[, hierarchy_cols, drop = FALSE])
      adtte <- dplyr::cross_join(pop_df, hierarchy_grid)
    } else {
      adtte <- pop_df
    }

    # Merge event dates onto base records of ADTTE ----

    adtte <- dplyr::left_join(adtte, subset_event_df, by = c(subjid_var, hierarchy_cols, event_group_var))

    # Derive time at risk variables ----

    if (has_event_dt && has_censor_dt && has_origin_dt) {
      adtte[[evt_cens_date_col]] <- pmin(adtte[[event_date_var]], adtte[[censor_date_var]], na.rm = TRUE)
      adtte[[time_at_risk_col]] <- as.numeric(adtte[[evt_cens_date_col]] - adtte[[origin_date_var]] + 1)
    }

    adtte[[censor_col]][is.na(adtte[[censor_col]])] <- TRUE

    # Some ADTTE variables are not required for purpose of app, so only keep necessary ones
    adtte <- adtte |>
      dplyr::select(dplyr::any_of(c(subjid_var, event_group_var, hierarchy_cols, group_var,
                                    time_at_risk_col, censor_col)))

    # Add hierarchy level to data
    adtte[[hier_lvl_col]] <- hierarchy_level

    bind_adtte <- dplyr::bind_rows(bind_adtte, adtte)
  }

  # Return from function ----

  return(bind_adtte)
}

#' Computes an event table with subject counts and percentages
#'
#' @param event_df `data.frame`
#' A data frame containing the event data. It should have columns corresponding to subjects,
#' hierarchy levels, and group variables.
#'
#' @param pop_df `data.frame`
#' A data frame containing the population data. It must have columns corresponding to subjects and group variables.
#'
#' @param hierarchy `character(1|2)`
#' A character vector of column names from `event_df` to use as the hierarchy. Can be one or two levels.
#'
#' @param group_var `character(1)`
#' A string representing the column name in `pop_df` used for grouping the population data.
#'
#' @param subjid_var `character(1)`
#' A string representing the subject identifier column name. This column must be present in both `event_df` and
#' `pop_df`.
#'
#' @param event_group_var `character(1)`
#' A string representing the column name in `event_df` used for grouping the event data.
#'
#' @param origin_date_var `character(1)`
#' A string representing the column name in `pop_df` holding the origin date (optional).
#'
#' @param censor_date_var `character(1)`
#' A string representing the column name in `pop_df` holding the censor date (optional).
#'
#' @param event_date_var `character(1)`
#' A string representing the column name in `event_df` holding the event date.
#'
#' @param total `logical(1)`
#' A logical indicating whether to add a total group column.
#'
#' @param total_group_val `character(0|1)`
#' A string representing the value to assign to the `group_var` column for totals.
#'
#' @param compute_risk `logical(1)`
#' A logical indicating whether to calculate time at risk and incidence rate.
#'
#' @return A list containing:
#' - `df`: A data frame with the processed event data, including counts and percentages.
#' - `meta`: A list containing metadata related to the hierarchy, group variable, and subject counts.
#'
#' @keywords internal
compute_events_table <- function(event_df,
                                 pop_df,
                                 hierarchy = NULL,
                                 group_var = NULL,
                                 subjid_var = NULL,
                                 event_group_var = NULL,
                                 origin_date_var = NULL,
                                 censor_date_var = NULL,
                                 event_date_var = NULL,
                                 total = TRUE,
                                 total_group_val = "Total",
                                 compute_risk = FALSE) {

  checkmate::assert_data_frame(event_df, min.rows = 1)
  checkmate::assert_data_frame(pop_df, min.rows = 1)
  checkmate::assert_character(hierarchy, min.chars = 1, min.len = 1)
  checkmate::assert_string(group_var, min.chars = 1)
  checkmate::assert_factor(pop_df[[group_var]])
  lapply(hierarchy, function(h) checkmate::assert_factor(event_df[[h]]))
  checkmate::assert_factor(event_df[[subjid_var]])
  checkmate::assert_factor(pop_df[[subjid_var]])
  checkmate::assert_character(event_group_var, min.chars = 1, max.len = 1, null.ok = TRUE)

  checkmate::assert_subset(hierarchy, names(event_df))
  checkmate::assert_subset(group_var, names(pop_df))
  checkmate::assert_string(subjid_var, min.chars = 1)
  checkmate::assert_subset(event_group_var, names(event_df))

  # Time at risk dates, if specified, must be on population and event data frames
  checkmate::assert_names(names(pop_df), must.include = c(origin_date_var, censor_date_var))
  checkmate::assert_names(names(event_df), must.include = event_date_var)

  # If total group column requested then check that `total_group_val` is a string
  if (total) checkmate::assert_string(total_group_val)

  # Flag when event group has been specified
  has_event_group <- !is.null(event_group_var) && length(event_group_var) > 0

  # Flags when time at risk dates are specified for population and event data frames
  has_origin_dt <- !is.null(origin_date_var) && length(origin_date_var) > 0
  has_censor_dt <- !is.null(censor_date_var) && length(censor_date_var) > 0
  has_event_dt <- !is.null(event_date_var) && length(event_date_var) > 0

  # Define column names for columns used in function
  hier_lvl_col <- paste0(EC$VAL$SPECIAL_CHAR, "lvl")
  time_at_risk_col <- paste0(EC$VAL$SPECIAL_CHAR, "time_at_risk")
  censor_col <- paste0(EC$VAL$SPECIAL_CHAR, "censor")

  # Prepare population data ----

  subset_pop_df <- pop_df[, c(subjid_var, group_var, origin_date_var, censor_date_var)]

  # Replace NA values in group var factor with "<NA>" and add associated level
  subset_pop_df[[group_var]] <- add_na_factor_level(subset_pop_df[[group_var]])

  # Prepare event data ----

  subset_event_df <- event_df[, c(subjid_var, hierarchy, event_group_var, event_date_var)]

  # Determine the set of event group values
  if (has_event_group) {
    # Replace NA values in event group var factor with "<NA>" and add associated level
    subset_event_df[[event_group_var]] <- add_na_factor_level(subset_event_df[[event_group_var]])
    event_group_vals <- levels(subset_event_df[[event_group_var]])
  } else {
    event_group_vals <- character()
  }

  # Raise warning when origin date is after non-missing censor date (bad data!)
  warning_message <- NULL
  if (has_origin_dt && has_censor_dt) {
    bad_rows <- !is.na(subset_pop_df[[origin_date_var]]) & !is.na(subset_pop_df[[censor_date_var]]) &
      subset_pop_df[[origin_date_var]] > subset_pop_df[[censor_date_var]]
    if (any(bad_rows)) {
      warning_message <- EC$MSG$VALIDATE$ORIG_AFTER_CENSOR
      subset_event_df <- subset_event_df[0, ]
    }
  }

  # Remove rows with missing event dates
  if (has_event_dt) subset_event_df <- subset_event_df[!is.na(subset_event_df[[event_date_var]]), ]

  # Remove events that occur before origin date (implicitly when origin date is missing)
  if (has_origin_dt && has_event_dt) {
    subset_event_df <- subset_event_df |>
      dplyr::left_join(subset_pop_df[, c(subjid_var, origin_date_var)], by = subjid_var) |>
      dplyr::filter(.data[[event_date_var]] >= .data[[origin_date_var]]) |>
      dplyr::select(-dplyr::all_of(origin_date_var))
  }

  # Remove events that occur after non-missing censor date
  if (has_censor_dt && has_event_dt) {
    subset_event_df <- subset_event_df |>
      dplyr::left_join(subset_pop_df[, c(subjid_var, censor_date_var)], by = subjid_var) |>
      dplyr::filter(is.na(.data[[censor_date_var]]) | .data[[event_date_var]] <= .data[[censor_date_var]]) |>
      dplyr::select(-dplyr::all_of(censor_date_var))
  }

  # Prepare subject level analysis data ----

  adtte <- create_adtte(event_df = subset_event_df,
                        pop_df = subset_pop_df,
                        hierarchy = hierarchy,
                        group_var = group_var,
                        subjid_var = subjid_var,
                        event_group_var = event_group_var,
                        origin_date_var = origin_date_var,
                        censor_date_var = censor_date_var,
                        event_date_var = event_date_var)

  # Report the subjects for which time at risk could not be determined
  if (compute_risk) {
    invalid_rows <- which(is.na(adtte[[time_at_risk_col]]))
    if (length(invalid_rows) > 0) {
      invalid_subjects <- unique(adtte[[subjid_var]][invalid_rows])
      log_inform(paste("Time at risk could not be determined for the following subjects:",
                       paste0('"', invalid_subjects, '"', collapse = ", ")), level = "inform")
    }
  }

  # Add group totals ----

  if (total) {
    adtte_totals <- adtte
    adtte_totals[[group_var]] <- total_group_val

    adtte <- rbind(adtte, adtte_totals)
  } else {
    # No group total requested so clear the total group value
    total_group_val <- character()
  }

  # Calculate statistics ----

  calc_stats <- adtte |>
    dplyr::mutate(dplyr::across(dplyr::all_of(hierarchy),
                                ~ as.factor(replace(as.character(.), is.na(.), EC$VAL$SPECIAL_CHAR)))) |>

    dplyr::group_by(dplyr::across(dplyr::all_of(c(hierarchy, group_var, event_group_var, hier_lvl_col))))

  if (compute_risk) {
    # Time-to-event data

    table_type <- "time_at_risk"

    calc_stats <- calc_stats |>

      # Calculate summary stats including time at risk
      dplyr::summarise(N = sum(!is.na(.data[[time_at_risk_col]])),
                       n = sum(!.data[[censor_col]]),
                       subjid = list(.data[[subjid_var]][.data[[censor_col]] == 0]),
                       time_at_risk = sum(.data[[time_at_risk_col]], na.rm = TRUE) / 365.25,
                       .groups = "drop") |>

      # Calculate incidence rate and percent
      dplyr::mutate(incidence_rate = 100 * .data[["n"]] / .data[["time_at_risk"]],
                    pct = dplyr::if_else(.data[["N"]] == 0, -Inf, 100 * .data[["n"]] / .data[["N"]]))
  } else {
    # Basic frequency data

    table_type <- "frequency"

    calc_stats <- calc_stats |>

      # Calculate summary stats
      dplyr::summarise(N = dplyr::n(),
                       n = sum(.data[[censor_col]] == 0),
                       subjid = list(.data[[subjid_var]][.data[[censor_col]] == 0]),
                       .groups = "drop") |>

      # Calculate percent
      dplyr::mutate(pct = 100 * .data[["n"]] / .data[["N"]])
  }

  # Identify any population groups that are completely missing from the event data
  missing_groups <- setdiff(levels(calc_stats[[group_var]]),
                            unique(calc_stats[[group_var]]))

  # Create extra rows for these missing groups
  if (length(missing_groups) > 0L) {
    missing_groups_df <- stats::setNames(as.data.frame(as.factor(missing_groups)), group_var)
    template_groups_df <- unique(calc_stats[, c(hierarchy, event_group_var, hier_lvl_col)])

    missing_rows_df <- merge(template_groups_df, missing_groups_df, by = NULL)
    missing_rows_df[["N"]] <- 0L
    missing_rows_df[["n"]] <- 0L
    missing_rows_df[["subjid"]] <- replicate(nrow(missing_rows_df), character(), simplify = FALSE)
    missing_rows_df[["pct"]] <- 0L

    if (compute_risk) {
      missing_rows_df[["time_at_risk"]] <- NA_real_
      missing_rows_df[["incidence_rate"]] <- NA_real_
    }

    calc_stats <- rbind(calc_stats, missing_rows_df)
  }

  # Extract the denominators for the grouping variable into a named vector
  denom_df <- unique(calc_stats[calc_stats[[hier_lvl_col]] == 0L, c("N", group_var)])
  n_denominator <- stats::setNames(denom_df[["N"]], denom_df[[group_var]])

  # Re-order based on factor levels
  n_denominator <- n_denominator[levels(calc_stats[[group_var]])]

  # Return from function ----

  res <- list(
    df = calc_stats,
    meta = list(
      hierarchy = hierarchy,
      hier_lvl_col = hier_lvl_col,
      group_var = group_var,
      event_group_var = event_group_var,
      event_group_vals = event_group_vals,
      total_group_val = total_group_val,
      n_denominator = n_denominator,
      table_type = table_type,
      warning_message = warning_message
    )
  )

  res
}

#' Provide hierarchy ordering based on descending counts and alphabetical values
#'
#' @param d `list`
#' A list returned from `compute_events_table()` containing the event data and metadata.
#'
#' @return A data frame with the event data sorted by subject counts within each hierarchy level.
#'
#' @keywords internal
compute_order_events_table <- function(d) {

  checkmate::assert_data_frame(d[["df"]])
  checkmate::assert_list(d[["meta"]])

  hierarchy <- d[["meta"]][["hierarchy"]]
  group_var <- d[["meta"]][["group_var"]]
  total_group_val <- d[["meta"]][["total_group_val"]]

  results_df <- d[["df"]]

  # Exclude total group
  order_groups <- setdiff(unique(results_df[[group_var]]), total_group_val)

  hier_lvl_col <- paste0(EC$VAL$SPECIAL_CHAR, "lvl")
  count_col_prefix <- paste0(EC$VAL$SPECIAL_CHAR, "count")

  hierarchy_grid <- unique(results_df[, c(hierarchy, hier_lvl_col), drop = FALSE])

  # Sum the number of events for values in each hierarchy level
  for (hierarchy_level in seq_along(hierarchy)) {
    # Group by all hierarchy levels up to this one
    group_cols <- hierarchy[1:hierarchy_level]

    across_group_counts <- results_df |>
      dplyr::filter(.data[[group_var]] %in% order_groups,
                    .data[[hier_lvl_col]] == hierarchy_level) |>
      dplyr::group_by(dplyr::across(dplyr::all_of(group_cols))) |>
      dplyr::summarise(!!paste0(count_col_prefix, hierarchy_level) := sum(.data[["n"]]), .groups = "drop")

    hierarchy_grid <- hierarchy_grid |>
      dplyr::left_join(across_group_counts, by = group_cols)
  }

  # Convert NA to Inf as these summary levels should have the highest value for descending order
  hierarchy_grid <- hierarchy_grid |>
    dplyr::mutate(dplyr::across(dplyr::starts_with(count_col_prefix),
                                ~ replace(., is.na(.), Inf)))

  # Sort on descending counts and (when counts are the same) alphabetically on hierarchy values
  order_args <- list()
  for (hierarchy_level in seq_along(hierarchy)) {
    order_args <- c(order_args, list(-xtfrm(hierarchy_grid[[paste0(count_col_prefix, hierarchy_level)]]),
                                     as.character(hierarchy_grid[[hierarchy[hierarchy_level]]])))
  }
  hierarchy_grid <- hierarchy_grid[do.call(order, order_args), ]

  # Assign rank column with values from 1 to the number of rows
  hierarchy_grid[[paste0(EC$VAL$SPECIAL_CHAR, "rank")]] <- seq_len(nrow(hierarchy_grid))

  # Save the order groups as an attribute
  attr(hierarchy_grid, "order_groups") <- order_groups

  return(hierarchy_grid)
}

#' Converts the event table to wide format
#'
#' @param d `list`
#' A list returned from `compute_events_table()` containing the event data and metadata.
#'
#' @param min_percent `numeric`
#' The minimum percentage threshold for filtering events. Rows where the percentage of subjects is below this threshold
#' will be removed from the output.
#'
#' @return A list containing:
#' - `df`: A wide-format data frame with the event counts and percentages for each group and hierarchy level.
#' - `meta`: A list of metadata related to the event table.
#'
#' @keywords internal
pivot_wide_format_events_table <- function(d, min_percent = 0) {
  checkmate::assert_data_frame(d[["df"]]) # DP
  checkmate::assert_list(d[["meta"]]) # DP

  hierarchy <- d[["meta"]][["hierarchy"]]
  group_var <- d[["meta"]][["group_var"]]
  event_group_var <- d[["meta"]][["event_group_var"]]
  table_type <- d[["meta"]][["table_type"]]
  df <- d[["df"]]

  # Flag when event group has been specified
  has_event_group <- !is.null(event_group_var) && length(event_group_var) > 0

  cell_col <- paste0(EC$VAL$SPECIAL_CHAR, "cell")

  count <- ifelse(df[["pct"]] > min_percent,
                  sprintf("%d ( %.2f %%)", df[["n"]], df[["pct"]]),
                  "\u2014")
  subjid <- purrr::map(df[["subjid"]], as.character)

  if (table_type == "time_at_risk") {
    time_at_risk <- ifelse(df[["pct"]] > min_percent,
                           sprintf("%.2f", df[["time_at_risk"]]),
                           "\u2014")
    incidence_rate <- ifelse(df[["pct"]] > min_percent,
                             sprintf("%.2f", df[["incidence_rate"]]),
                             "\u2014")

    df[[cell_col]] <- purrr::pmap(list(count = count,
                                       subjid = subjid,
                                       time_at_risk = time_at_risk,
                                       incidence_rate = incidence_rate),
                                  ~ list(count = ..1,
                                         subjid = ..2,
                                         time_at_risk = ..3,
                                         incidence_rate = ..4))
  } else {
    df[[cell_col]] <- purrr::map2(count, subjid, ~ list(count = .x, subjid = .y))
  }

  # Keep only the necessary columns
  df <- df[, c(hierarchy, group_var, event_group_var, cell_col)]

  if (has_event_group) {
    df <- df |>
      dplyr::group_by(dplyr::across(dplyr::all_of(c(hierarchy, group_var)))) |>
      dplyr::summarise(!!cell_col := list(stats::setNames(.data[[cell_col]], .data[[event_group_var]])),
                       .groups = "drop")
  }

  wide_event <- tidyr::pivot_wider(
    df,
    id_cols = dplyr::all_of(hierarchy),
    names_from = dplyr::all_of(group_var),
    names_expand = TRUE,
    values_from = dplyr::all_of(cell_col),
    values_fill = list(EC$VAL$SPECIAL_CHAR)
  )

  res <- list(df = wide_event, meta = d[["meta"]])
  res
}

#' Sorts the wide-format event table by the overall subject count ranking
#'
#' @param event_d `list`
#' A list returned from `pivot_wide_format_events_table()` containing the wide-format event data and metadata.
#'
#' @param sort_df `data.frame`
#' A data frame returned from `compute_order_events_table()` containing the sorted event data by subject counts.
#'
#' @return A list containing:
#' - `df`: A sorted wide-format data frame of event counts and percentages.
#' - `meta`: Metadata updated with the ranking information.
#'
#' @keywords internal
sort_wider_formatter_events_table <- function(event_d, sort_df) { # nolint
  checkmate::assert_data_frame(event_d[["df"]]) # DP
  checkmate::assert_list(event_d[["meta"]]) # DP
  checkmate::assert_data_frame(sort_df) # DP

  hierarchy <- event_d[["meta"]][["hierarchy"]]
  hier_lvl_col <- event_d[["meta"]][["hier_lvl_col"]]
  event_df <- event_d[["df"]]

  rank_col <- paste0(EC$VAL$SPECIAL_CHAR, "rank")

  sort_event_df <- sort_df[, c(hierarchy, hier_lvl_col, rank_col)] |>
    dplyr::inner_join(event_df, by = hierarchy)

  res <- list(
    df = sort_event_df,
    meta = c(event_d[["meta"]], list(rank_col = rank_col))
  )

  res
}

#' Renders the wide-format event table as an HTML table
#'
#' @param d `list`
#' A list returned from `sort_wider_formatter_events_table()` containing the sorted wide-format event data and metadata.
#'
#' @param on_cell_click `character(0)`
#' A JavaScript callback function to be executed when a table cell is clicked. Default is `NULL`.
#'
#' @return An HTML table generated using `shiny::tags` and formatted for interactive display.
#'
#' @keywords internal
sort_wide_format_event_table_to_HTML <- function(d, on_cell_click = NULL) { # nolint
  checkmate::assert_data_frame(d[["df"]]) # DP
  checkmate::assert_list(d[["meta"]]) # DP

  hierarchy <- d[["meta"]][["hierarchy"]]
  hier_lvl_col <- d[["meta"]][["hier_lvl_col"]]
  event_group_var <- d[["meta"]][["event_group_var"]]
  event_group_vals <- d[["meta"]][["event_group_vals"]]
  n_denominator <- d[["meta"]][["n_denominator"]]
  table_type <- d[["meta"]][["table_type"]]
  df <- d[["df"]]

  # Flag when event group has been specified
  has_event_group <- length(event_group_vals) > 0

  entry_name_col <- paste0(EC$VAL$SPECIAL_CHAR, "entry_name")

  table <- shiny::tags[["table"]]
  th <- shiny::tags[["th"]]
  thc <- function(..., colspan = 1) {
    if (colspan == 1) {
      th(class = "text-center", style = "vertical-align: bottom; border-top: 1px solid white", ...)
    } else {
      th(class = "text-center", colspan = as.character(colspan),
         style = "border-bottom: 1px solid black; border-right: 6px solid white", ...)
    }
  }
  tr <- shiny::tags[["tr"]]
  td <- shiny::tags[["td"]]
  tdc <- function(...) td(class = "text-center", ...) # nolint false positive unused

  df_names <- names(df)
  internal_columns <- df_names[startsWith(df_names, EC$VAL$SPECIAL_CHAR)]
  data_columns <- df_names[!df_names %in% c(hierarchy, internal_columns)]

  # Replace spaces with non-breaking spaces to avoid columns being squashed in display
  df[data_columns] <- rapply(df[data_columns],
                             function(.x) gsub(" ", "\u00A0", .x),
                             classes = "character",
                             how = "replace")

  entry_header <- shiny::span("", shiny::br(), "")
  data_headers <- purrr::map2(data_columns,
                              paste0("(N = ", n_denominator[data_columns], ")"),
                              ~ shiny::span(.x, shiny::br(), .y))

  if (table_type == "time_at_risk") {
    n_cols <- 3
  } else if (has_event_group) {
    n_cols <- length(event_group_vals)
  } else {
    n_cols <- 1
  }

  header_row <- tr(
    class = "no-border",
    thc(entry_header),
    purrr::map(data_headers, thc, colspan = n_cols)
  )

  if (table_type == "time_at_risk") {
    entry_subheader <- shiny::span("", shiny::br(), "")
    data_subheaders <- purrr::map(rep(c("n (%)",
                                        "Time\u00A0at\u00A0risk<br>(pt-yrs)",
                                        "Rate/100<br>pt-yrs"),
                                      length(data_columns)),
                                  ~ shiny::HTML(.x))

    subheader_row <- tr(
      thc(entry_subheader),
      purrr::map(data_subheaders, thc)
    )
  } else if (has_event_group) {
    entry_subheader <- shiny::span("")
    data_subheaders <- purrr::map(rep(event_group_vals, length(data_columns)),
                                  ~ shiny::span(.x))

    subheader_row <- tr(
      thc(entry_subheader),
      purrr::map(data_subheaders, thc)
    )
  } else {
    subheader_row <- NULL
  }

  df[[entry_name_col]] <- local({
    purrr::pmap_chr(
      df[c(hierarchy, hier_lvl_col)], function(...) {
        args <- list(...)
        if (args[[hier_lvl_col]] == 0) {
          return("Subjects with any event")
        }
        curr_lvl <- hierarchy[args[[hier_lvl_col]]]
        curr_label <- as.character(args[[curr_lvl]])
        curr_label
      }
    )
  })

  title <- sprintf("Event count by %s", paste(hierarchy, collapse = ", "))

  hierarchy_length <- length(hierarchy)

  body <- vector(mode = "list", length = nrow(df))
  for (r in seq_len(nrow(df))) {
    curr_row <- df[r, , drop = FALSE]
    curr_hier_lvl <- curr_row[[hier_lvl_col]]

    if (curr_hier_lvl < hierarchy_length) {
      collapse_control <- shiny::icon("table", onclick = "ec_collapse(this)")
    } else {
      collapse_control <- NULL
    }

    indent <- curr_hier_lvl
    indent_class <- sprintf("indent-%d", indent)
    entry_cell <- td(shiny::span(collapse_control,
                                 curr_row[[entry_name_col]],
                                 class = "truncate",
                                 title = curr_row[[entry_name_col]]))
    data_cells <- purrr::imap(curr_row[data_columns], function(.col, .col_id) {
      if (table_type == "time_at_risk") {
        data_list <- .col[[1]]
        purrr::map(setdiff(names(data_list), "subjid"),
                   ~ tdc(data_list[[.x]], column = .col_id, onclick = on_cell_click))
      } else if (has_event_group) {
        event_group_list <- .col[[1]]
        purrr::imap(event_group_list, function(.grp, .grp_id) {
          # Use special char as separator between column levels
          .col_id2 <- paste0(.col_id, EC$VAL$SPECIAL_CHAR, .grp_id)
          tdc(.grp[["count"]], column = .col_id2, onclick = on_cell_click)
        })
      } else {
        tdc(.col[[1]][["count"]], column = .col_id, onclick = on_cell_click)
      }
    })
    body[[r]] <- tr(
      "row-id" = r,
      class = c(indent_class),
      indent = indent,
      entry_cell,
      data_cells
    )
  }

  shiny::div(
    shiny::p(
      title
    ),
    table(
      class = "table event-count",
      hierarchical_count_table_dep(),
      header_row,
      subheader_row,
      !!!body
    )
  )
}

#' UI for the event count module
#'
#' @inheritParams mod_hierarchical_count_table
#' @inheritParams hierarchical_count_table_server
#'
#' @return A `shiny::tagList` containing the user interface for selecting hierarchy, group,
#' and minimum percentage for event counting.
#'
#' @keywords main
#'
#' @export
hierarchical_count_table_ui <- function(id,
                                        show_event_group_by = FALSE,
                                        show_time_at_risk_options = FALSE,
                                        default_total = TRUE,
                                        default_risk = FALSE) {
  ns <- shiny::NS(id)

  # Initialize optional selections
  event_by_group <- NULL
  time_at_risk_options <- NULL

  if (show_event_group_by) {
    event_by_group <- shiny::div(
      shiny::tags$hr(),
      col_menu_UI(id = ns(EC$ID$EVENT_GROUP))
    )
  } else if (show_time_at_risk_options) {
    time_at_risk_options <- shiny::div(
      shiny::tags$hr(),
      col_menu_UI(id = ns(EC$ID$EVENT_DATE)),
      col_menu_UI(id = ns(EC$ID$ORIGIN_DATE)),
      col_menu_UI(id = ns(EC$ID$CENSOR_DATE)),
      shiny::tags$hr(),
      shiny::checkboxInput(ns(EC$ID$RISK_FLAG),
                           label = shiny::span(EC$LBL$RISK_FLAG,
                                               shiny::icon("circle-info",
                                                           title = EC$INFO$RISK_FLAG)),
                           value = default_risk)
    )
  }

  shiny::div(
    class = "hier_count_table",
    shiny::tagList(
      shiny::div(style = "display: inline-block;",
                 shinyWidgets::dropMenu(
                   shiny::tags[["button"]](id = ns(EC$ID$DROP_MENU), EC$LBL$DROP_MENU, class = "btn btn-default"),
                   col_menu_UI(id = ns(EC$ID$HIERARCHY)),
                   col_menu_UI(id = ns(EC$ID$GRP)),
                   shiny::numericInput(ns(EC$ID$MIN_PERCENT),
                                       label = EC$LBL$MIN_PERCENT,
                                       value = 0, min = 0, max = 100),
                   shiny::checkboxInput(ns(EC$ID$TOTAL_FLAG), label = EC$LBL$TOTAL_FLAG, value = default_total),
                   event_by_group,
                   time_at_risk_options
                 )),
      shiny::div(style = "display: inline-block;",
                 mod_export_counttable_UI(ns(EC$ID$TAB_DOWNLOAD)))
    ),
    shiny::uiOutput(ns(EC$ID$TABLE))
  )
}

#' Server logic for the event count module
#'
#' @param id `[character(0)]`
#'
#' The ID for the event count module instance.
#'
#' @param table_dataset `[data.frame]`
#'
#' A reactive dataset containing the event data.
#'
#' @param pop_dataset `[data.frame]`
#'
#' A reactive dataset containing the population data.
#'
#' @param on_sbj_click_fun `[function]`
#'
#' Function to invoke when a subject is clicked
#'
#' @inheritParams mod_hierarchical_count_table
#'
#' @return A reactive value containing the list of subjects in the clicked cell, if applicable.
#'
#' @keywords main
#'
#' @export
#'
# nolint start
hierarchical_count_table_server <- function(
    # nolint end
  id,
  table_dataset,
  pop_dataset,
  subjid_var,
  show_event_group_by = FALSE,
  show_time_at_risk_options = FALSE,
  show_modal_on_click = TRUE,
  on_sbj_click_fun = function() NULL,
  default_hierarchy = NULL,
  default_group = NULL,
  default_event_group = NULL,
  default_event_date = NULL,
  default_origin_date = NULL,
  default_censor_date = NULL,
  hierarchy_choices = NULL,
  group_choices = NULL,
  event_group_choices = NULL,
  event_date_choices = NULL,
  origin_date_choices = NULL,
  censor_date_choices = NULL,
  intended_use_label = NULL) {
  mod <- function(input, output, session) {
    ns <- session[["ns"]]

    inputs <- list()
    inputs[[EC$ID$HIERARCHY]] <- col_menu_server(
      id = EC$ID$HIERARCHY, data = table_dataset,
      label = shiny::span(EC$LBL$HIERARCHY,
                          shiny::icon("circle-info",
                                      title = EC$INFO$HIERARCHY)),
      include_func = function(var, var_name) {
        (is.factor(var) || is.character(var)) &&
          var_name != subjid_var &&
          (is.null(hierarchy_choices) || var_name %in% hierarchy_choices)
      },
      default = default_hierarchy,
      multiple = TRUE,
      include_none = FALSE,
      options = list(maxItems = 2)
    )

    inputs[[EC$ID$GRP]] <- col_menu_server(
      id = EC$ID$GRP, data = pop_dataset,
      label = EC$LBL$GRP,
      include_func = function(var, var_name) {
        (is.factor(var) || is.character(var)) &&
          var_name != subjid_var &&
          (is.null(group_choices) || var_name %in% group_choices)
      },
      default = default_group,
      include_none = FALSE
    )

    inputs[[EC$ID$MIN_PERCENT]] <- shiny::reactive({
      input[[EC$ID$MIN_PERCENT]]
    })

    inputs[[EC$ID$TOTAL_FLAG]] <- shiny::reactive({
      input[[EC$ID$TOTAL_FLAG]]
    })

    if (show_event_group_by) {
      inputs[[EC$ID$EVENT_GROUP]] <- col_menu_server(
        id = EC$ID$EVENT_GROUP, data = table_dataset,
        label = shiny::span(EC$LBL$EVENT_GROUP,
                            shiny::icon("circle-info",
                                        title = EC$INFO$EVENT_GROUP)),
        include_func = function(var, var_name) {
          (is.factor(var) || is.character(var)) &&
            var_name != subjid_var &&
            (is.null(event_group_choices) || var_name %in% event_group_choices)
        },
        default = default_event_group,
        include_none = FALSE
      )
    } else if (show_time_at_risk_options) {
      inputs[[EC$ID$EVENT_DATE]] <- col_menu_server(
        id = EC$ID$EVENT_DATE, data = table_dataset,
        label = shiny::uiOutput(ns(EC$ID$EVENT_DATE_LBL)),
        include_func = function(var, var_name) {
          inherits(var, "Date") &&
            (is.null(event_date_choices) || var_name %in% event_date_choices)
        },
        default = default_event_date,
        include_none = FALSE
      )

      inputs[[EC$ID$ORIGIN_DATE]] <- col_menu_server(
        id = EC$ID$ORIGIN_DATE, data = pop_dataset,
        label = shiny::uiOutput(ns(EC$ID$ORIGIN_DATE_LBL)),
        include_func = function(var, var_name) {
          inherits(var, "Date") &&
            (is.null(origin_date_choices) || var_name %in% origin_date_choices)
        },
        default = default_origin_date,
        include_none = FALSE
      )

      inputs[[EC$ID$CENSOR_DATE]] <- col_menu_server(
        id = EC$ID$CENSOR_DATE, data = pop_dataset,
        label = shiny::uiOutput(ns(EC$ID$CENSOR_DATE_LBL)),
        include_func = function(var, var_name) {
          inherits(var, "Date") &&
            (is.null(censor_date_choices) || var_name %in% censor_date_choices)
        },
        default = default_censor_date,
        include_none = FALSE
      )

      # Build span label for date column input with warning and info icons
      date_label_span <- function(flag, date, label_text, label_info) {
        date_empty <- is.null(date) || length(date) == 0

        shiny::span(
          if (isTRUE(flag) && date_empty) {
            shiny::icon("triangle-exclamation",
                        title = EC$WARN$REQ_TIME_AT_RISK,
                        style = "color: orange; margin-right: 5px;")
          },
          label_text,
          shiny::icon("circle-info",
                      title = label_info)
        )
      }

      # Apply event date span label
      output[[EC$ID$EVENT_DATE_LBL]] <- shiny::renderUI({
        date_label_span(flag = input[[EC$ID$RISK_FLAG]],
                        date = inputs[[EC$ID$EVENT_DATE]](),
                        label_text = EC$LBL$EVENT_DATE,
                        label_info = EC$INFO$EVENT_DATE)
      })

      # Apply origin date span label
      output[[EC$ID$ORIGIN_DATE_LBL]] <- shiny::renderUI({
        date_label_span(flag = input[[EC$ID$RISK_FLAG]],
                        date = inputs[[EC$ID$ORIGIN_DATE]](),
                        label_text = EC$LBL$ORIGIN_DATE,
                        label_info = EC$INFO$ORIGIN_DATE)
      })

      # Apply censor date span label
      output[[EC$ID$CENSOR_DATE_LBL]] <- shiny::renderUI({
        date_label_span(flag = input[[EC$ID$RISK_FLAG]],
                        date = inputs[[EC$ID$CENSOR_DATE]](),
                        label_text = EC$LBL$CENSOR_DATE,
                        label_info = EC$INFO$CENSOR_DATE)
      })

      inputs[[EC$ID$RISK_FLAG]] <- shiny::reactive({
        input[[EC$ID$RISK_FLAG]]
      })

    }

    et <- shiny::reactive({
      d <- table_dataset()
      pd <- pop_dataset()
      group_var <- inputs[[EC$ID$GRP]]()
      hierarchy <- inputs[[EC$ID$HIERARCHY]]()
      min_percent <- inputs[[EC$ID$MIN_PERCENT]]()
      total <- inputs[[EC$ID$TOTAL_FLAG]]()

      event_group_var <- NULL
      event_date_var <- NULL
      origin_date_var <- NULL
      censor_date_var <- NULL
      compute_risk <- FALSE

      if (show_event_group_by) {
        event_group_var <- inputs[[EC$ID$EVENT_GROUP]]()
      } else if (show_time_at_risk_options) {
        event_date_var <- inputs[[EC$ID$EVENT_DATE]]()
        origin_date_var <- inputs[[EC$ID$ORIGIN_DATE]]()
        censor_date_var <- inputs[[EC$ID$CENSOR_DATE]]()
        compute_risk <- inputs[[EC$ID$RISK_FLAG]]()
      }

      # Helper: checks whether a value is actually "provided"
      is_provided <- function(x) {
        checkmate::test_string(x, min.chars = 1)
      }

      shiny::validate(
        shiny::need(
          checkmate::test_data_frame(d, min.rows = 1),
          EC$MSG$VALIDATE$NO_TABLE_ROWS
        ),
        shiny::need(
          checkmate::test_data_frame(pd, min.rows = 1),
          EC$MSG$VALIDATE$NO_POP_ROWS
        ),
        shiny::need(
          checkmate::test_string(group_var, min.chars = 1) && group_var != "None",
          EC$MSG$VALIDATE$NO_GRP
        ),
        shiny::need(
          checkmate::test_character(hierarchy, min.chars = 1, min.len = 1, max.len = 2),
          EC$MSG$VALIDATE$NO_HIERARCHY
        ),
        shiny::need(
          checkmate::test_number(min_percent, na.ok = FALSE, lower = 0, upper = 100),
          EC$MSG$VALIDATE$NO_MIN_PERCENT
        ),
        shiny::need(
          !checkmate::test_choice(group_var, hierarchy, null.ok = TRUE),
          EC$MSG$VALIDATE$GRP_CLASH
        ),
        shiny::need(
          checkmate::test_disjunct(event_date_var, origin_date_var),
          EC$MSG$VALIDATE$EVENT_ORIG_CLASH
        ),
        shiny::need(
          checkmate::test_disjunct(event_date_var, censor_date_var),
          EC$MSG$VALIDATE$EVENT_CENSOR_CLASH
        ),
        shiny::need(
          checkmate::test_disjunct(origin_date_var, censor_date_var),
          EC$MSG$VALIDATE$ORIG_CENSOR_CLASH
        ),
        shiny::need(
          (!compute_risk || is_provided(event_date_var)) &&
            (!(is_provided(origin_date_var) || is_provided(censor_date_var)) || is_provided(event_date_var)),
          EC$MSG$VALIDATE$NO_EVENT_DATE
        ),
        shiny::need(
          !compute_risk || is_provided(origin_date_var),
          EC$MSG$VALIDATE$NO_ORIGIN_DATE
        ),
        shiny::need(
          !compute_risk || is_provided(censor_date_var),
          EC$MSG$VALIDATE$NO_CENSOR_DATE
        )
      )

      # Associate labels attribute to hierarchy column names
      hierarchy_labels <- get_lbls_robust(d)[hierarchy]
      attr(hierarchy, "labels") <- unlist(hierarchy_labels)

      # Show a progress bar for the remainder of the execution of this reactive
      # This bar does not really progress; it just disappears once we're through
      p <- shiny::Progress$new(session = session)
      on.exit(p$close())
      p$set(message = "1) Processing data", value = 0.50)
      
      events_table_raw <- compute_events_table(event_df = d,
                                               pop_df = pd,
                                               hierarchy = hierarchy,
                                               group_var = group_var,
                                               subjid_var = subjid_var,
                                               event_group_var = event_group_var,
                                               origin_date_var = origin_date_var,
                                               censor_date_var = censor_date_var,
                                               event_date_var = event_date_var,
                                               total = total,
                                               total_group_val = "Total",
                                               compute_risk = compute_risk)

      # Show warning when origin date is after non-missing censor date (bad data!)
      shiny::validate(
        shiny::need(
          is.null(events_table_raw$meta$warning_message),
          events_table_raw$meta$warning_message
        )
      )

      sorted_events_table <- compute_order_events_table(events_table_raw)

      t <- pivot_wide_format_events_table(events_table_raw, min_percent) |>
        sort_wider_formatter_events_table(sorted_events_table)

      t
    })
   
    render_completion_callback <- shiny::tags$script(shiny::HTML(sprintf("
    requestAnimationFrame(() => { // repaint preceding the table render
      requestAnimationFrame(() => { // repaint following the table render
        Shiny.setInputValue('%s', 'done', {priority: 'event'});
      });
    });
    ", ns(EC$ID$RENDER_COMPLETION_CALLBACK))))

    table_progress_bars <- list() # keep a list of progress bars to cope with trigger-happy users
    
    shiny::observeEvent(input[[EC$ID$RENDER_COMPLETION_CALLBACK]], {
      for (p in table_progress_bars) p$close()
      table_progress_bars <<- list()
    })

    output[[EC$ID$TABLE]] <- shiny::renderUI({
      on_cell_click <- sprintf("Shiny.setInputValue('%s', {row_id: Number(this.closest('tr').getAttribute('row-id')), column : this.getAttribute('column')}, {priority: 'event'})", ns("cell_click")) # nolint
      et <- et()
      
      # Start a progress bar and leave its cleanup to the `input[[EC$ID$RENDER_COMPLETION_CALLBACK]]` observer
      p <- shiny::Progress$new(session = session)
      table_progress_bars[[length(table_progress_bars) + 1]] <<- p
      on.exit(p$inc(amount = 0.3))
      p$set(message = "2) Generating & Rendering Table", value = 0.2)
      
      rendered_content <- sort_wide_format_event_table_to_HTML(et, on_cell_click)
      shiny::tagList(rendered_content, render_completion_callback)
    })

    # Table download module
    mod_export_counttable_server(
      module_id = EC$ID$TAB_DOWNLOAD,
      dataset = et,
      intended_use_label = intended_use_label
    )

    if (show_modal_on_click) {
      shiny::observeEvent(input[["cell_click"]], {
        row <- input[["cell_click"]][["row_id"]]
        col <- input[["cell_click"]][["column"]]

        if (grepl(EC$VAL$SPECIAL_CHAR, col, fixed = TRUE)) {
          nested_cols <- strsplit(col, EC$VAL$SPECIAL_CHAR, fixed = TRUE)[[1]]
          subj_ids <- et()[["df"]][[nested_cols[1]]][[row]][[nested_cols[2]]][["subjid"]]
        } else {
          subj_ids <- et()[["df"]][[col]][[row]][["subjid"]]
        }

        # Only run when subjects defined in the cell
        if (length(subj_ids) > 0) {

          # Ensure that non-breaking spaces are converted back to ordinary spaces
          subj_ids <- gsub("\u00A0", " ", subj_ids)

          id_elements <- vector(mode = "list", length = (length(subj_ids) * 2) - 1)
          for (idx in seq_along(subj_ids)) {
            link_idx <- (idx * 2) - 1
            comma_idx <- link_idx + 1
            id_elements[[link_idx]] <- shiny::a(subj_ids[[idx]], "data-id" = subj_ids[[idx]])
            if (idx < length(subj_ids)) id_elements[[comma_idx]] <- ","
          }

          input_id <- ns("clicked_sbj")

          d <- shiny::modalDialog(
            shiny::div(
              id = ns("sbj_list"),
              shiny::h3("Subjects"),
              do.call(shiny::p, id_elements),
              onclick = sprintf("(function(event){Shiny.setInputValue('%s', event.target.getAttribute('data-id'), {priority: 'event'});})(event)", input_id)
            )
          )
          shiny::showModal(d)
        }
      })
    }

    # Jumping and communication
    shiny::observeEvent(input[["clicked_sbj"]], {
      shiny::req(checkmate::test_string(input[["clicked_sbj"]], na.ok = FALSE, min.chars = 1, null.ok = FALSE))
      shiny::removeModal()
      on_sbj_click_fun()
    })

    res <- list(
      subj_id = shiny::reactive({
        shiny::req(checkmate::test_string(input[["clicked_sbj"]], na.ok = FALSE, min.chars = 1, null.ok = FALSE))
        input[["clicked_sbj"]]
      })
    )

    if (isTRUE(getOption("shiny.testmode"))) do.call(shiny::exportTestValues, as.list(environment()))

    res
  }

  shiny::moduleServer(
    id = id,
    module = mod
  )
}

#' Hierarchical Count Table Module
#'
#' @param module_id `[character(1)]`
#'
#' Module Shiny id.
#'
#' @param table_dataset_name `[character(1)]`
#'
#' Name of the event dataset.
#'
#' @param pop_dataset_name `[character(1)]`
#'
#' Name of the population dataset.
#'
#' @param subjid_var `[character(1)]`
#'
#' A string representing the subject identifier column in both datasets.
#'
#' @param show_event_group_by `[logical(1)]`
#'
#' A flag to indicate whether to show the event by-group selection. This takes precedence over
#' `show_time_at_risk_options`, both cannot be shown together.
#'
#' @param show_time_at_risk_options `[logical(1)]`
#'
#' A flag to indicate whether to show the time at risk related user selections (event/origin/censor
#' date selections, and time at risk checkbox). This is ignored when `show_event_group_by` is `TRUE`,
#' both cannot be shown together.
#'
#' @param show_modal_on_click `[logical(1)]`
#'
#' A flag to indicate whether clicking a table cell should display a modal dialog with the subject IDs.
#'
#' @param default_hierarchy `[character(1|2)|NULL]`
#'
#' A default value for the hierarchy variables selection (optional).
#'
#' @param default_group `[character(1)|NULL]`
#'
#' A default value for the group variable selection (optional).
#'
#' @param default_total `[logical(1)]`
#'
#' A default value for checkbox determining whether to add a total group column.
#'
#' @param default_event_group `[character(1)|NULL]`
#'
#' A default value for the event group variable selection.
#'
#' @param default_event_date `[character(1)|NULL]`
#'
#' A default value for the event date variable selection (optional). Not applicable when
#' `show_time_at_risk_options` is `FALSE`.
#'
#' @param default_origin_date `[character(1)|NULL]`
#'
#' A default value for the origin date variable selection (optional). Not applicable when
#' `show_time_at_risk_options` is `FALSE`.
#'
#' @param default_censor_date `[character(1)|NULL]`
#'
#' A default value for the censor date variable selection (optional). Not applicable when
#' `show_time_at_risk_options` is `FALSE`.
#'
#' @param default_risk `[logical(1)]`
#'
#' A default value for for checkbox determining whether to calculate time at risk. Not
#' applicable when `show_time_at_risk_options` is `FALSE`.
#'
#' @param hierarchy_choices `[character(1+)|NULL]`
#'
#' A character vector specifying the possible choices for the hierarchy variables selection (optional).
#' If it is not specified then all factor and character variables from the event data will be used.
#'
#' @param group_choices `[character(1+)|NULL]`
#'
#' A character vector specifying the possible choices for the group variable selection (optional).
#' If it is not specified then all factor and character variables from the population data will be used.
#'
#' @param event_group_choices `[character(1+)|NULL]`
#'
#' A character vector specifying the possible choices for the event group variable selection (optional).
#' If it is not specified then all factor and character variables from the event data will be used.
#'
#' @param event_date_choices `[character(1+)|NULL]`
#'
#' A character vector specifying the possible choices for the event date variable selection (optional).
#' If it is not specified then all variables of class "Date" from the event data will be used.
#' Not applicable when `show_time_at_risk_options` is `FALSE`.
#'
#' @param origin_date_choices `[character(1+)|NULL]`
#'
#' A character vector specifying the possible choices for the origin date variable selection (optional).
#' If it is not specified then all variables of class "Date" from the population data will be used.
#' Not applicable when `show_time_at_risk_options` is `FALSE`.
#'
#' @param censor_date_choices `[character(1+)|NULL]`
#'
#' A character vector specifying the possible choices for the censor date variable selection (optional).
#' If it is not specified then all variables of class "Date" from the population data will be used.
#' Not applicable when `show_time_at_risk_options` is `FALSE`.
#'
#' @param intended_use_label `[character(1)|NULL]`
#'
#' Either a string indicating the intended use for export, or NULL. The provided label will be displayed
#' prior to the download and will also be included in the exported file.
#'
#' @param receiver_id `[character(1)]`
#'
#' Shiny ID of the module receiving the selected subject ID in the data listing. This ID must be present in the app
#' or be NULL.
#'
#' @keywords main
#'
#' @export
mod_hierarchical_count_table <- function(module_id,
                                         table_dataset_name,
                                         pop_dataset_name,
                                         subjid_var = "USUBJID",
                                         show_event_group_by = FALSE,
                                         show_time_at_risk_options = FALSE,
                                         show_modal_on_click = TRUE,
                                         default_hierarchy = NULL,
                                         default_group = NULL,
                                         default_total = TRUE,
                                         default_event_group = NULL,
                                         default_event_date = NULL,
                                         default_origin_date = NULL,
                                         default_censor_date = NULL,
                                         default_risk = FALSE,
                                         hierarchy_choices = NULL,
                                         group_choices = NULL,
                                         event_group_choices = NULL,
                                         event_date_choices = NULL,
                                         origin_date_choices = NULL,
                                         censor_date_choices = NULL,
                                         intended_use_label = "Use only for internal review and monitoring during the conduct of clinical trials.",
                                         receiver_id = NULL) {
  mod <- list(
    ui = function(module_id) {
      hierarchical_count_table_ui(id = module_id,
                                  show_event_group_by = show_event_group_by,
                                  show_time_at_risk_options = show_time_at_risk_options,
                                  default_total = default_total,
                                  default_risk = default_risk)
    },
    server = function(afmm) {
      if (is.null(receiver_id)) {
        on_sbj_click_fun <- function() NULL
      } else {
        on_sbj_click_fun <- function() {
          afmm[["utils"]][["switch2mod"]](receiver_id)
        }
      }

      hierarchical_count_table_server(
        id = module_id,
        table_dataset = shiny::reactive(afmm[["filtered_dataset"]]()[[table_dataset_name]]),
        pop_dataset = shiny::reactive(afmm[["filtered_dataset"]]()[[pop_dataset_name]]),
        subjid_var = subjid_var,
        show_event_group_by = show_event_group_by,
        show_time_at_risk_options = show_time_at_risk_options,
        show_modal_on_click = show_modal_on_click,
        on_sbj_click_fun = on_sbj_click_fun,
        default_hierarchy = default_hierarchy,
        default_group = default_group,
        default_event_group = default_event_group,
        default_event_date = default_event_date,
        default_origin_date = default_origin_date,
        default_censor_date = default_censor_date,
        hierarchy_choices = hierarchy_choices,
        group_choices = group_choices,
        event_group_choices = event_group_choices,
        event_date_choices = event_date_choices,
        origin_date_choices = origin_date_choices,
        censor_date_choices = censor_date_choices,
        intended_use_label = intended_use_label
      )
    },
    module_id = module_id
  )
  mod
}

# hierarchical table module interface description ----
# TODO: Fill in
mod_hierarchical_count_table_API_docs <- list(
  "Hierarchical count table",
  module_id = "",
  table_dataset_name = "",
  pop_dataset_name = "",
  subjid_var = "",
  show_event_group_by = "",
  show_time_at_risk_options = "",
  show_modal_on_click = "",
  default_hierarchy = "",
  default_group = "",
  default_total = "",
  default_event_group = "",
  default_event_date = "",
  default_origin_date = "",
  default_censor_date = "",
  default_risk = "",
  hierarchy_choices = "",
  group_choices = "",
  event_group_choices = "",
  event_date_choices = "",
  origin_date_choices = "",
  censor_date_choices = "",
  intended_use_label = "",
  receiver_id = ""
)

mod_hierarchical_count_table_API_spec <- TC$group(
  module_id = TC$mod_ID(),
  table_dataset_name = TC$dataset_name(),
  pop_dataset_name = TC$dataset_name(),
  subjid_var = TC$col("pop_dataset_name", TC$factor()) |> TC$flag("subjid_var"),
  show_event_group_by = TC$logical(),
  show_time_at_risk_options = TC$logical(),
  show_modal_on_click = TC$logical(),
  default_hierarchy = TC$col("table_dataset_name", TC$or(TC$character(), TC$factor())) |>
    TC$flag("zero_or_more", "optional"),
  default_group = TC$col("pop_dataset_name", TC$or(TC$character(), TC$factor())) |> TC$flag("optional"),
  default_total = TC$logical(),
  default_event_group = TC$col("table_dataset_name", TC$or(TC$character(), TC$factor())) |> TC$flag("optional"),
  default_event_date = TC$col("table_dataset_name", TC$date()) |> TC$flag("optional"),
  default_origin_date = TC$col("pop_dataset_name", TC$date()) |> TC$flag("optional"),
  default_censor_date = TC$col("pop_dataset_name", TC$date()) |> TC$flag("optional"),
  default_risk = TC$logical(),
  hierarchy_choices = TC$col("table_dataset_name", TC$or(TC$character(), TC$factor())) |>
    TC$flag("zero_or_more", "optional"),
  group_choices = TC$col("pop_dataset_name", TC$or(TC$character(), TC$factor())) |>
    TC$flag("zero_or_more", "optional"),
  event_group_choices = TC$col("table_dataset_name", TC$or(TC$character(), TC$factor())) |>
    TC$flag("zero_or_more", "optional"),
  event_date_choices = TC$col("table_dataset_name", TC$date()) |> TC$flag("zero_or_more", "optional"),
  origin_date_choices = TC$col("pop_dataset_name", TC$date()) |> TC$flag("zero_or_more", "optional"),
  censor_date_choices = TC$col("pop_dataset_name", TC$date()) |> TC$flag("zero_or_more", "optional"),
  intended_use_label = TC$character() |> TC$flag("optional"),
  receiver_id = TC$character() |> TC$flag("optional")
) |> TC$attach_docs(mod_hierarchical_count_table_API_docs)


check_mod_hierarchical_count_table <- function(
    afmm, datasets, module_id, table_dataset_name, pop_dataset_name, subjid_var, show_event_group_by, show_time_at_risk_options,
    show_modal_on_click, default_hierarchy, default_group, default_total, default_event_group, default_event_date, default_origin_date,
    default_censor_date, default_risk, hierarchy_choices, group_choices, event_group_choices, event_date_choices, origin_date_choices,
    censor_date_choices, intended_use_label, receiver_id) {
  err <- CM$container()

  # TODO: Replace this function with a generic one that performs the checks based on mod_hierarchical_count_API_spec.
  # Something along the lines of OK <- CM$check_API(mod_hierarchical_count_API_spec, args = match.call(), err)

  OK <- check_mod_hierarchical_count_table_auto( # nolint unused
    afmm, datasets,
    module_id, table_dataset_name, pop_dataset_name, subjid_var, show_event_group_by, show_time_at_risk_options, show_modal_on_click,
    default_hierarchy, default_group, default_total, default_event_group, default_event_date, default_origin_date, default_censor_date,
    default_risk, hierarchy_choices, group_choices, event_group_choices, event_date_choices, origin_date_choices, censor_date_choices,
    intended_use_label, receiver_id,
    err
  )

  res <- list(errors = err[["messages"]])
  return(res)
}

dataset_info_hierarchical_count_table <- function(table_dataset_name, pop_dataset_name, ...) {
  # TODO: Replace this function with a generic one that builds the list based on mod_boxplot_API_spec.
  # Something along the lines of CM$dataset_info(mod_hierarchical_count_table_API_spec, args = match.call())
  all <- unique(c(table_dataset_name, pop_dataset_name))
  subject_level <- pop_dataset_name
  if (length(subject_level) == 0) subject_level <- character(0)

  return(list(all = all, subject_level = subject_level))
}

mod_hierarchical_count_table <- CM$module(mod_hierarchical_count_table, check_mod_hierarchical_count_table, dataset_info_hierarchical_count_table)

#' Mock hierarchy table app
#' @keywords mock
#' @param dry_run Return parameters used in the call
#' @param update_query_string automatically update query string with app state
#' @param ui_defaults,srv_defaults a list of values passed to the ui/server function
#' @export

# nolint start
mock_app_hierarchical_count_table <- function(
    # nolint end
  dry_run = FALSE,
  update_query_string = TRUE,
  srv_defaults = list(),
  ui_defaults = list()) {
  if (!requireNamespace("pharmaverseadam")) {
    stop("Install pharmaverseadam")
  }
  table_dataset <- shiny::reactive({
    pharmaverseadam::adae |> chr2factor()
  })

  pop_dataset <- shiny::reactive({
    pharmaverseadam::adsl |> chr2factor()
  })

  ui_params <- c(
    list(
      id = "mod"
    ),
    ui_defaults
  )

  srv_params <- c(
    list(
      id = "mod",
      table_dataset = table_dataset,
      pop_dataset = pop_dataset,
      subjid_var = "SUBJID"
    ),
    srv_defaults
  )

  if (dry_run) {
    return(list(ui = ui_params, srv = srv_params))
  }

  mock_app_wrap(
    update_query_string = update_query_string,
    ui = function() do.call(hierarchical_count_table_ui, ui_params),
    server = function() {
      do.call(hierarchical_count_table_server, srv_params)
    }
  )
}

#' Mock hierarchy table app in dv.manager
#' @keywords mock
#' @export
mock_app_hierarchical_count_table_mm <- function() {
  if (!requireNamespace("dv.manager")) {
    stop("Install dv.manager")
  }
  if (!requireNamespace("pharmaverseadam")) {
    stop("Install pharmaverseadam")
  }
  dv.manager::run_app(
    data = list(
      dummy = list(adae = pharmaverseadam::adae, adsl = pharmaverseadam::adsl)
    ),
    module_list = list(
      "ADAE by term" = mod_hierarchical_count_table(
        "hierarchical_count_table",
        table_dataset_name = "adae",
        pop_dataset_name = "adsl",
        show_time_at_risk_options = TRUE,
        show_modal_on_click = TRUE,
        default_hierarchy = c("AEBODSYS", "AEDECOD"),
        default_group = "TRT01P",
        default_event_date = "ASTDT",
        default_origin_date = "TRTSDT",
        default_censor_date = "EOSDT",
        default_total = TRUE,
        default_risk = FALSE
      )
    ),
    filter_data = "adsl",
    filter_key = "SUBJID",
    enableBookmarking = "url"
  )
}

#' @keywords internal
hierarchical_count_table_dep <- function() {
  htmltools::htmlDependency(
    name = "hierarchical_count_table",
    version = "1.0",
    src = system.file("assets", package = "dv.tables", mustWork = TRUE),
    stylesheet = "css/hierarchical_count_table.css",
    script = "js/hierarchical_count_table.js"
  )
}
