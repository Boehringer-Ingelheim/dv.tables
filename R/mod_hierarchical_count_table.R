EC <- poc(
  ID = poc(
    TABLE = "table",
    DROP_MENU = "drop_menu",
    HIERARCHY = "hierarchy",
    GRP = "group",
    POP_FLAG_VARS = "pop_flag_vars",
    POP_FLAGS_AFTER_GROUPS = "pop_flags_after_groups",
    MIN_PERCENT = "min_percent",
    REMOVE_ROWS_UNDER_MIN_PERCENT = "remove_rows_under_min_percent",
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
    POP_FLAG_VARS = "Population flags:",
    POP_FLAGS_AFTER_GROUPS = "Move after group variables",
    MIN_PERCENT = "Minimum %",
    REMOVE_ROWS_UNDER_MIN_PERCENT = "Remove rows under minimum %",
    TOTAL_FLAG = "Total",
    EVENT_GROUP = "Event group by",
    RISK_FLAG = "Time at Risk",
    EVENT_DATE = "Event Date",
    ORIGIN_DATE = "Origin Date",
    CENSOR_DATE = "Censor Date",
    TAB_DOWNLOAD = "table_download"
  ),
  INFO = poc(
    HIERARCHY = "Up to 4 selections allowed",
    GRP = "Up to 2 selections allowed",
    EVENT_GROUP = "Selection from event data",
    EVENT_DATE = "Events with missing dates will be dropped",
    ORIGIN_DATE = "Events occurring before origin date will be dropped",
    CENSOR_DATE = "Events occurring after censor date will be dropped",
    RISK_FLAG = paste(
      "Event date, origin date and censor date must be provided; data with",
      "missing dates will be excluded from time at risk analysis.",
      sep = "\n"
    )
  ),
  WARN = poc(
    REQ_TIME_AT_RISK = "Required for Time at Risk"
  ),
  MSG = poc(
    VALIDATE = poc(
      NO_GRP = "No group selected",
      NO_HIERARCHY = "No hierarchy selected",
      NO_MIN_PERCENT = "Minimum percent must be between 0 and 100",
      NO_TABLE_ROWS = "Table dataset has 0 rows",
      NO_POP_ROWS = "Population dataset has 0 rows",
      VAR_OVERLAP = "Variable has been selected in more than one selection",
      ORIG_AFTER_CENSOR = "One or more origin dates are after non-missing censor date",
      EVENT_ORIG_CLASH = "Event date must not be the same as origin date",
      EVENT_CENSOR_CLASH = "Event date must not be the same as censor date",
      ORIG_CENSOR_CLASH = "Origin date must not be the same as censor date",
      NO_EVENT_DATE = "No event date selected",
      NO_ORIGIN_DATE = "No origin date selected",
      NO_CENSOR_DATE = "No censor date selected",
      EVENT_GRP_CLASH = "Event group selection cannot be used in hierarchy"
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
                         group_vars,
                         subjid_var,
                         event_group_var,
                         origin_date_var,
                         censor_date_var,
                         event_date_var) {

  # Flag when event group has been specified
  has_event_group <- !is.null(event_group_var) && length(event_group_var) > 0L

  # Flags when time at risk dates are specified for population and event data frames
  has_origin_dt <- !is.null(origin_date_var) && length(origin_date_var) > 0L
  has_censor_dt <- !is.null(censor_date_var) && length(censor_date_var) > 0L
  has_event_dt <- !is.null(event_date_var) && length(event_date_var) > 0L

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
  for (hierarchy_level in 0L:length(hierarchy)) {

    hierarchy_cols <- hierarchy[0L:hierarchy_level]

    # Remove rows where hierarchy value is NA in any processed hierarchy columns
    subset_event_df <- event_df[stats::complete.cases(event_df[, hierarchy_cols]), ]

    # For each hierarchy group, only keep first event occurrence
    if (has_event_dt && nrow(subset_event_df) > 0L) {
      subset_event_df <- subset_event_df |>
        dplyr::group_by(dplyr::across(dplyr::all_of(c(subjid_var, hierarchy_cols, event_group_var)))) |>
        dplyr::summarise(!!event_date_var := min(.data[[event_date_var]]), .groups = "drop")
    } else {
      subset_event_df <- subset_event_df |>
        dplyr::group_by(dplyr::across(dplyr::all_of(c(subjid_var, hierarchy_cols, event_group_var)))) |>
        dplyr::slice(1L) |>
        dplyr::ungroup()
    }

    # Identify records with events before merging onto all hierarchy combinations
    subset_event_df[[censor_col]] <- FALSE

    # Expand population data using grid of hierarchy combinations to create base records for ADTTE ----

    if (hierarchy_level != 0L) {
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
      dplyr::select(dplyr::any_of(c(subjid_var, event_group_var, hierarchy_cols, group_vars,
                                    time_at_risk_col, censor_col)))

    # Add hierarchy level to data
    adtte[[hier_lvl_col]] <-
      if (nrow(adtte) > 0L) {
        hierarchy_level
      } else {
        integer(0L)
      }

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
#' @param hierarchy `character(1+)`
#' A character vector of column names from `event_df` to use as the hierarchy.
#'
#' @param group_vars `character(1)`
#' A character vector of column names from `pop_df` used for grouping the population data.
#'
#' @param subjid_var `character(1)`
#' A string representing the subject identifier column name. This column must be present in both `event_df` and
#' `pop_df`.
#'
#' @param pop_flag_vars
#' A vector of names of population flag variables from `pop_df`.
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
#' - `meta`: A list of metadata:
#'   - `hierarchy`: A vector of hierarchy variable names.
#'   - `group_var`: A string indicating the group variable name.
#'   - `event_group_var`: A string indicating the event group variable name.
#'   - `event_group_vals`: A vector of event group values.
#'   - `pop_flag_vars`: A vector of population flag variable names.
#'   - `total_vars`: A vector of variable names that will have a total column displayed in the table.
#'   - `total_group_val`: A string indicating the label for the total group column.
#'   - `denom_df`: A data frame of population group denominator data.
#'   - `table_type`: A string, either "frequency" or "time_at_risk", indicating the table type.
#'   - `warning_message`: A string indicating a warning message to be raised by shiny::validate.
#'
#' <!-- - `data_columns`: A vector of names of columns holding the statistics for each population group combination. -->
#' <!-- - `denom_df`: A data frame of population group denominator data. -->
#'
#' @keywords internal
compute_events_table <- function(event_df,
                                 pop_df,
                                 hierarchy = NULL,
                                 group_vars = NULL,
                                 subjid_var = NULL,
                                 pop_flag_vars = NULL,
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
  checkmate::assert_character(group_vars, min.chars = 1, min.len = 1)
  checkmate::assert_string(subjid_var, min.chars = 1)

  checkmate::assert_names(names(event_df), must.include = c(hierarchy, event_group_var, subjid_var))
  checkmate::assert_names(names(pop_df), must.include = c(group_vars, subjid_var))

  checkmate::assert_character(pop_flag_vars, min.chars = 1, null.ok = TRUE)

  lapply(group_vars, function(v) checkmate::assert_factor(pop_df[[v]]))
  lapply(hierarchy, function(v) checkmate::assert_factor(event_df[[v]]))
  checkmate::assert_factor(event_df[[subjid_var]])
  checkmate::assert_factor(pop_df[[subjid_var]])
  checkmate::assert_character(event_group_var, min.chars = 1, max.len = 1, null.ok = TRUE)

  # Time at risk dates, if specified, must be on population and event data frames
  checkmate::assert_names(names(pop_df), must.include = c(origin_date_var, censor_date_var))
  checkmate::assert_names(names(event_df), must.include = event_date_var)

  # Check that total group value is a string (required even if total not requested)
  checkmate::assert_string(total_group_val, min.chars = 1)

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

  subset_pop_df <- pop_df[, c(subjid_var, group_vars, origin_date_var, censor_date_var)]

  # Replace NA values in group var factor with "<NA>" and add associated level
  subset_pop_df[group_vars] <- lapply(subset_pop_df[group_vars], add_na_factor_level)

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
                        group_vars = group_vars,
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

  # Add rows for group totals (required for ordering) ----

  for (gv in c(group_vars, event_group_var)) {
    gv_fct_levels <- c(levels(adtte[[gv]]), total_group_val)

    adtte[[gv]] <- factor(adtte[[gv]], levels = gv_fct_levels)
    total_grp_fct <- factor(total_group_val, levels = c(levels(adtte[[gv]])))
    total_rows <- adtte
    total_rows[[as.character(gv)]] <- total_grp_fct
    total_rows <- dplyr::distinct(total_rows)

    adtte <- adtte |>
      rbind(total_rows)
  }

  # Calculate statistics ----

  calc_stats <- adtte |>
    dplyr::mutate(dplyr::across(dplyr::all_of(hierarchy),
                                ~ as.factor(replace(as.character(.), is.na(.), EC$VAL$SPECIAL_CHAR)))) |>

    dplyr::group_by(dplyr::across(dplyr::all_of(c(hierarchy, group_vars, event_group_var, hier_lvl_col))))

  if (compute_risk) {
    # Time-to-event data

    table_type <- "time_at_risk"

    calc_stats <- calc_stats |>

      # Calculate summary stats including time at risk
      dplyr::summarise(.N = sum(!is.na(.data[[time_at_risk_col]])),
                       n = sum(!.data[[censor_col]]),
                       subjid = list(.data[[subjid_var]][.data[[censor_col]] == 0]),
                       time_at_risk = sum(.data[[time_at_risk_col]], na.rm = TRUE) / 365.25,
                       .groups = "drop") |>

      # Calculate incidence rate and percent
      dplyr::mutate(incidence_rate = 100 * .data[["n"]] / .data[["time_at_risk"]],
                    pct = dplyr::if_else(.data[[".N"]] == 0, -Inf, 100 * .data[["n"]] / .data[[".N"]]))
  } else {
    # Basic frequency data

    table_type <- "frequency"

    calc_stats <- calc_stats |>

      # Calculate summary stats
      dplyr::summarise(.N = dplyr::n(),
                       n = sum(.data[[censor_col]] == 0),
                       subjid = list(.data[[subjid_var]][.data[[censor_col]] == 0]),
                       .groups = "drop") |>

      # Calculate percent
      dplyr::mutate(pct = 100 * .data[["n"]] / .data[[".N"]])
  }

  # Fill in population groups that are completely missing from the event data ----

  # Hierarchy base combinations
  hier_base <- calc_stats[c(hierarchy, hier_lvl_col)] |>
    dplyr::distinct()

  # Grid of all possible group variable combinations
  gv_grid <- calc_stats[c(group_vars, event_group_var)] |>
    lapply(\(x) factor(levels(x), levels(x))) |>
    expand.grid(KEEP.OUT.ATTRS = FALSE)

  # Merge every row from group variables grid for each row of hierarchy base combinations
  full_grid <- dplyr::cross_join(hier_base, gv_grid)

  calc_stats <- full_grid |> dplyr::left_join(calc_stats, by = names(full_grid))

  # Identify rows with missing data
  missing_rows <- is.na(calc_stats[["n"]])

  if (length(missing_rows) > 0L) {
    calc_stats[[".N"]][missing_rows] <- 0L
    calc_stats[["n"]][missing_rows] <- 0L
    calc_stats[["pct"]][missing_rows] <- 0
    calc_stats[["subjid"]][missing_rows] <- list(factor())

    if (compute_risk) {
      calc_stats[["time_at_risk"]][missing_rows] <- NA_real_
      calc_stats[["incidence_rate"]][missing_rows] <- NA_real_
    }
  }

  # Extract the denominators for the grouping variables into a data frame
  denom_df <- calc_stats[calc_stats[[hier_lvl_col]] == 0L, c(".N", group_vars)] |>
    dplyr::distinct() |>
    dplyr::mutate(.lookup = do.call(paste, c(dplyr::pick(dplyr::all_of(group_vars)),
                                             sep = EC$VAL$SPECIAL_CHAR)))

  # Get variable names that will have a total column displayed in the table.
  # Currently this is limited to the last group variable (excluding flag group).
  total_vars <- if (total) {
    mod_group_vars <- setdiff(group_vars, ".pop_group")
    mod_group_vars[length(mod_group_vars)]
  } else {
    character()
  }

  # Return from function ----

  res <- list(
    df = calc_stats,
    meta = list(
      hierarchy = hierarchy,
      hier_lvl_col = hier_lvl_col,
      group_vars = group_vars,
      pop_flag_vars = pop_flag_vars,
      event_group_var = event_group_var,
      event_group_vals = event_group_vals,
      total_vars = total_vars,
      total_group_val = total_group_val,
      denom_df = denom_df,
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
  group_vars <- d[["meta"]][["group_vars"]]
  event_group_var <- d[["meta"]][["event_group_var"]]
  total_group_val <- d[["meta"]][["total_group_val"]]

  results_df <- d[["df"]]

  hier_lvl_col <- paste0(EC$VAL$SPECIAL_CHAR, "lvl")
  count_col_prefix <- paste0(EC$VAL$SPECIAL_CHAR, "count")

  # Only keep rows with the total across all groups
  hierarchy_grid <- results_df |>
    dplyr::filter(dplyr::if_all(dplyr::all_of(c(group_vars, event_group_var)), \(x) x == total_group_val)) |>
    dplyr::select(dplyr::all_of(c(hierarchy, hier_lvl_col, "n")))

  # Assign totals from each hierarchy level onto lower hierarchy levels
  for (hierarchy_level in seq_along(hierarchy)) {
    # Process all hierarchy levels up to this one
    hier_cols <- hierarchy[1:hierarchy_level]

    level_counts <- hierarchy_grid |>
      dplyr::filter(.data[[hier_lvl_col]] == hierarchy_level) |>
      dplyr::select(dplyr::all_of(c(hier_cols, "n"))) |>
      dplyr::rename(dplyr::all_of(stats::setNames("n", paste0(count_col_prefix, hierarchy_level))))

    hierarchy_grid <- hierarchy_grid |>
      dplyr::left_join(level_counts, by = hier_cols)
  }

  hierarchy_grid[["n"]] <- NULL

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

  return(hierarchy_grid)
}

#' Converts the event table to wide format
#'
#' @param d `list`
#' A list returned from `compute_events_table()` containing the event data and metadata.
#'
#' @param min_percent `numeric`
#' The minimum percentage threshold for filtering events. Rows where the percentage of subjects is below this threshold
#' will have their cell values replaced with a dash instead of being shown.
#'
#' @param remove_rows_under_min_pct `logical(1)`
#' Whether to remove entire rows (across all groups) for which every group's percentage of subjects falls below
#' `min_percent`, instead of just replacing the cell values for those rows with a dash.
#'
#' @return A list containing:
#' - `df`: A wide-format data frame with the event counts and percentages for each group and hierarchy level.
#' - `meta`: A list of metadata related to the event table.
#'
#' @keywords internal
pivot_wide_format_events_table <- function(d, min_percent = 0, remove_rows_under_min_pct = FALSE) {
  checkmate::assert_data_frame(d[["df"]]) # DP
  checkmate::assert_list(d[["meta"]]) # DP

  hierarchy <- d[["meta"]][["hierarchy"]]
  group_vars <- d[["meta"]][["group_vars"]]
  event_group_var <- d[["meta"]][["event_group_var"]]
  total_vars <- d[["meta"]][["total_vars"]]
  total_group_val <- d[["meta"]][["total_group_val"]]
  table_type <- d[["meta"]][["table_type"]]
  df <- d[["df"]]

  # Flag when event group has been specified
  has_event_group <- !is.null(event_group_var) && length(event_group_var) > 0

  cell_col <- paste0(EC$VAL$SPECIAL_CHAR, "cell")

  # Remove unwanted total rows
  unwanted_total_vars <- setdiff(c(group_vars, event_group_var), total_vars)
  df <- dplyr::filter(df, dplyr::if_all(dplyr::all_of(unwanted_total_vars), \(x) x != total_group_val))

  pct_below_min <- df[["pct"]] < min_percent
  zero_count <- df[["n"]] == 0

  count <- ifelse(
    pct_below_min,
    "\u2014",
    ifelse(
      zero_count,
      "0",
      sprintf("%d ( %.2f %%)", df[["n"]], df[["pct"]])
    )
  )
  subjid <- purrr::map(df[["subjid"]], as.character)

  if (table_type == "time_at_risk") {
    time_at_risk <- ifelse(
      pct_below_min | is.na(df[["time_at_risk"]]),
      "\u2014",
      sprintf("%.2f", df[["time_at_risk"]])
    )
    incidence_rate <- ifelse(
      pct_below_min | is.na(df[["incidence_rate"]]),
      "\u2014",
      sprintf("%.2f", df[["incidence_rate"]])
    )

    cells <- list(
      count = count,
      subjid = subjid,
      time_at_risk = time_at_risk,
      incidence_rate = incidence_rate
    )

  } else {
    cells <- list(
      count = count,
      subjid = subjid
    )
  }

  df[[cell_col]] <- local({
    stopifnot(
      "cell components must all have length nrow(df)" = lengths(cells) ==
        nrow(df)
    )
    .mapply(list, cells, NULL)
  })

  if (remove_rows_under_min_pct) {
    pct_below_min_col <- paste0(EC$VAL$SPECIAL_CHAR, "pct_min_col")
    df[[pct_below_min_col]] <- pct_below_min
    df <- df |>
      dplyr::group_by(dplyr::across(dplyr::all_of(hierarchy))) |>
      dplyr::filter(!all(.data[[pct_below_min_col]])) |>
      dplyr::ungroup()
    df[[pct_below_min_col]] <- NULL
  }

  # Keep only the necessary columns
  df <- df[, c(hierarchy, group_vars, event_group_var, cell_col)]

  if (has_event_group) {
    # Combine event group cells across hierarchy and group variable values, as a list of lists,
    # each inner list named after an event group value.
    df <- df |>
      dplyr::group_by(dplyr::across(dplyr::all_of(c(hierarchy, group_vars)))) |>
      dplyr::summarise(!!cell_col := list(stats::setNames(.data[[cell_col]], .data[[event_group_var]])),
                       .groups = "drop")
  }

  # Ensure order reflects the final table display order
  df <- df[do.call(order, df[c(hierarchy, group_vars)]), ]

  wide_event <- tidyr::pivot_wider(
    df,
    id_cols = dplyr::all_of(hierarchy),
    names_from = dplyr::all_of(group_vars),
    names_sep = EC$VAL$SPECIAL_CHAR,
    values_from = dplyr::all_of(cell_col)
  )

  res <- list(
    df = wide_event,
    meta = c(
      d[["meta"]],
      list(min_percent = min_percent)
    )
  )

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
#' @param var_labels `list`
#' A list of variable labels indexed by variable names.
#'
#' @param on_cell_click `character(0)`
#' A JavaScript callback function to be executed when a table cell is clicked. Default is `NULL`.
#'
#' @return An HTML table generated using `shiny::tags` and formatted for interactive display.
#'
#' @keywords internal
sort_wide_format_event_table_to_HTML <- function(d, var_labels, on_cell_click = NULL) { # nolint
  checkmate::assert_data_frame(d[["df"]]) # DP
  checkmate::assert_list(d[["meta"]]) # DP

  hierarchy <- d[["meta"]][["hierarchy"]]
  hier_lvl_col <- d[["meta"]][["hier_lvl_col"]]
  group_vars <- d[["meta"]][["group_vars"]]
  pop_flag_vars <- d[["meta"]][["pop_flag_vars"]]
  event_group_var <- d[["meta"]][["event_group_var"]]
  event_group_vals <- d[["meta"]][["event_group_vals"]]
  denom_df <- d[["meta"]][["denom_df"]]
  table_type <- d[["meta"]][["table_type"]]
  min_percent <- d[["meta"]][["min_percent"]]
  df <- d[["df"]]

  # Flag when event group has been specified
  has_event_group <- length(event_group_vals) > 0

  entry_name_col <- paste0(EC$VAL$SPECIAL_CHAR, "entry_name")

  table <- shiny::tags[["table"]]
  th <- shiny::tags[["th"]]
  thc <- function(..., colspan = 1L, entry = FALSE) {
    if (entry) {
      th(class = "text-center", ...)
    } else if (is.null(colspan)) {
      th(class = "text-center", style = "vertical-align: bottom;", ...)
    } else {
      th(class = "text-center short-border", colspan = as.character(colspan), ...)
    }
  }
  tr <- shiny::tags[["tr"]]
  td <- shiny::tags[["td"]]
  tdc <- function(...) td(class = "text-center", ...) # nolint false positive unused

  df_names <- names(df)
  internal_columns <- df_names[startsWith(df_names, EC$VAL$SPECIAL_CHAR)]
  data_columns <- df_names[!df_names %in% c(hierarchy, internal_columns)]

  # Prepare denominator look-up
  n_denominator <- denom_df[[".N"]]
  names(n_denominator) <- denom_df[[".lookup"]]

  entry_header <- shiny::span("")

  split_data_columns <- strsplit(data_columns, split = SUMMTAB$VAL$SPECIAL_CHAR, fixed = TRUE)

  if (table_type == "time_at_risk") {
    n_cols <- 3
  } else if (has_event_group) {
    n_cols <- length(event_group_vals)
  } else {
    n_cols <- 1
  }

  header_rows <- vector(mode = "list", length = length(group_vars))
  for (head_i in seq_along(group_vars)) {

    if (head_i != length(group_vars)) {
      level_path <- vapply(split_data_columns,
                           \(parts) paste(parts[1:head_i], collapse = EC$VAL$SPECIAL_CHAR),
                           FUN.VALUE = character(1L),
                           USE.NAMES = FALSE)
      rle_level_path <- rle(level_path)
      rle_values <- rle_level_path[["values"]]
      extracted_headers <- sub(paste0(".*", EC$VAL$SPECIAL_CHAR), "", rle_values)
      data_headers <- purrr::map(extracted_headers, ~ shiny::span(.x))
      thc_data_columns <- purrr::map2(data_headers, rle_level_path[["lengths"]], ~ thc(.x, colspan = .y * n_cols))
    } else {
      extracted_headers <- sub(paste0(".*", EC$VAL$SPECIAL_CHAR), "", data_columns)
      data_headers <- purrr::map2(extracted_headers,
                                  paste0("(N", "\u00A0", "=", "\u00A0", n_denominator[data_columns], ")"),
                                  ~ shiny::span(.x, shiny::br(), .y))
      thc_data_columns <- purrr::map(data_headers,
                                     thc,
                                     colspan = if (table_type == "time_at_risk" || has_event_group) n_cols else NULL)
    }

    header_rows[[head_i]] <- tr(
      thc(entry_header, entry = TRUE),
      thc_data_columns
    )
  }

  if (table_type == "time_at_risk") {
    entry_subheader <- shiny::span("")
    data_subheaders <- purrr::map(rep(c("n (%)",
                                        "Time\u00A0at\u00A0risk<br>(pt-yrs)",
                                        "Rate/100<br>pt-yrs"),
                                      length(data_columns)),
                                  ~ shiny::HTML(.x))

    subheader_row <- tr(
      thc(entry_subheader, entry = TRUE),
      purrr::map(data_subheaders, thc, colspan = NULL)
    )
  } else if (has_event_group) {
    entry_subheader <- shiny::span("")
    data_subheaders <- purrr::map(rep(event_group_vals, length(data_columns)),
                                  ~ shiny::span(.x))

    subheader_row <- tr(
      thc(entry_subheader, entry = TRUE),
      purrr::map(data_subheaders, thc, colspan = NULL)
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

  mod_group_vars <- setdiff(group_vars, ".pop_group")
  title <- sprintf(
    "Event count by %s%s%s%s%s",
    paste(unlist(var_labels[hierarchy], use.names = FALSE), collapse = ", "),
    ifelse(length(mod_group_vars) == 0L, "",
           paste("; group by", paste(unlist(var_labels[mod_group_vars], use.names = FALSE), collapse = ", "))),
    ifelse(length(pop_flag_vars) == 0L, "",
           paste("; flag by", paste(unlist(var_labels[pop_flag_vars], use.names = FALSE), collapse = ", "))),
    ifelse(length(event_group_var) == 0L, "",
           paste("; event group by", paste(unlist(var_labels[event_group_var], use.names = FALSE), collapse = ", "))),
    ifelse(min_percent == 0, "",
           sprintf("; minimum %.2f%%", min_percent))
  )

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
        purrr::map(setdiff(names(data_list), c("subjid")),
                   ~ tdc(data_list[[.x]], column = .col_id, onclick = on_cell_click, style = "white-space: nowrap;"))
      } else if (has_event_group) {
        event_group_list <- .col[[1]]
        purrr::imap(event_group_list, function(.grp, .grp_id) {
          # Use special char as separator between column levels
          .col_id2 <- paste0(.col_id, EC$VAL$SPECIAL_CHAR, .grp_id)
          tdc(.grp[["count"]], column = .col_id2, onclick = on_cell_click, style = "white-space: nowrap;")
        })
      } else {
        tdc(.col[[1]][["count"]], column = .col_id, onclick = on_cell_click, style = "white-space: nowrap;")
      }
    })

    data_cell_classes <- if (indent == 0L || is.null(collapse_control)) {
      indent_class
    } else {
      c(indent_class, "bg-gray")
    }

    body[[r]] <- tr(
      "row-id" = r,
      class = data_cell_classes,
      indent = indent,
      entry_cell,
      data_cells
    )
  }

  html_table <- shiny::div(
    shiny::p(title),
    table(
      class = "table event-count",
      hierarchical_count_table_dep(),
      !!!header_rows,
      subheader_row,
      !!!body
    )
  )

  return(html_table)
}

#' UI for the event count module
#'
#' @inheritParams mod_hierarchical_count_table
#' @inheritParams hierarchical_count_table_server
#'
#' @return A `shiny::div` containing the user interface for selecting hierarchy, group,
#' and minimum percentage for event counting.
#'
#' @keywords main
#'
#' @export
hierarchical_count_table_ui <- function(id,
                                        show_pop_flag_selection = FALSE,
                                        show_event_group_by = FALSE,
                                        show_time_at_risk_options = FALSE,
                                        default_pop_flags_after_groups = FALSE,
                                        default_total = TRUE,
                                        default_risk = FALSE,
                                        default_min_percent = 0,
                                        default_remove_rows_under_min_percent = FALSE
                                      ) {
  ns <- shiny::NS(id)

  # Initialize optional selections
  pop_flags <- NULL
  event_by_group <- NULL
  time_at_risk_options <- NULL

  if (show_pop_flag_selection) {
    pop_flags <- shiny::div(
      shiny::tags$hr(),
      col_menu_UI(id = ns(EC$ID$POP_FLAG_VARS)),
      shiny::checkboxInput(ns(EC$ID$POP_FLAGS_AFTER_GROUPS),
                           label = EC$LBL$POP_FLAGS_AFTER_GROUPS,
                           value = default_pop_flags_after_groups)
    )
  }

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

  drop_menu <- shinyWidgets::dropMenu(
    shiny::tags[["button"]](
      id = ns(EC$ID$DROP_MENU),
      EC$LBL$DROP_MENU,
      class = "btn btn-default"
    ),
    col_menu_UI(id = ns(EC$ID$HIERARCHY)),
    col_menu_UI(id = ns(EC$ID$GRP)),
    pop_flags,
    shiny::tags$hr(),
    shiny::numericInput(
      ns(EC$ID$MIN_PERCENT),
      label = EC$LBL$MIN_PERCENT,
      value = default_min_percent,
      min = 0,
      max = 100
    ),
    shiny::checkboxInput(
      ns(EC$ID$REMOVE_ROWS_UNDER_MIN_PERCENT),
      label = EC$LBL$REMOVE_ROWS_UNDER_MIN_PERCENT,
      value = default_remove_rows_under_min_percent
    ),
    shiny::checkboxInput(
      ns(EC$ID$TOTAL_FLAG),
      label = EC$LBL$TOTAL_FLAG,
      value = default_total
    ),
    event_by_group,
    time_at_risk_options,
    options = shinyWidgets::dropMenuOptions(
      popperOptions = list(
        modifiers = list(
          preventOverflow = list(
            enabled = TRUE,
            boundariesElement = "scrollParent",
            priority = list("left", "right", "bottom", "top")
          )
        )
      )
    ),
    style = "max-height: 85vh; overflow-y: auto; overflow-x: hidden; padding: 10px;"
  )

  shiny::div(
    class = "hier_count_table",
    shiny::tagList(
      shiny::div(style = "display: inline-block;",
                 drop_menu),
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
  show_pop_flag_selection = FALSE,
  show_event_group_by = FALSE,
  show_time_at_risk_options = FALSE,
  show_modal_on_click = TRUE,
  on_sbj_click_fun = function() NULL,
  default_hierarchy = NULL,
  default_group = NULL,
  default_pop_flags = NULL,
  default_event_group = NULL,
  default_event_date = NULL,
  default_origin_date = NULL,
  default_censor_date = NULL,
  hierarchy_choices = NULL,
  group_choices = NULL,
  pop_flag_choices = NULL,
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
      options = list(maxItems = 4, plugins = list("drag_drop"))
    )

    inputs[[EC$ID$GRP]] <- col_menu_server(
      id = EC$ID$GRP, data = pop_dataset,
      label = shiny::span(EC$LBL$GRP,
                          shiny::icon("circle-info",
                                      title = EC$INFO$GRP)),
      include_func = function(var, var_name) {
        (is.factor(var) || is.character(var)) &&
          var_name != subjid_var &&
          (is.null(group_choices) || var_name %in% group_choices)
      },
      default = default_group,
      multiple = TRUE,
      include_none = FALSE,
      options = list(maxItems = 2, plugins = list("drag_drop"))
    )

    inputs[[EC$ID$MIN_PERCENT]] <- shiny::reactive({
      input[[EC$ID$MIN_PERCENT]]
    })

    inputs[[EC$ID$REMOVE_ROWS_UNDER_MIN_PERCENT]] <- shiny::reactive({
      input[[EC$ID$REMOVE_ROWS_UNDER_MIN_PERCENT]]
    })

    inputs[[EC$ID$TOTAL_FLAG]] <- shiny::reactive({
      input[[EC$ID$TOTAL_FLAG]]
    })

    if (show_pop_flag_selection) {
      inputs[[EC$ID$POP_FLAG_VARS]] <- col_menu_server(
        id = EC$ID$POP_FLAG_VARS,
        data = pop_dataset,
        label = EC$LBL$POP_FLAG_VARS,
        include_func = function(var, var_name) {
          (is.factor(var) || is.character(var)) &&
            var_name != subjid_var &&
            ((is.null(pop_flag_choices) && grepl("FL([0-9]*)?$", var_name)) || var_name %in% pop_flag_choices)
        },
        default = default_pop_flags,
        multiple = TRUE,
        include_none = FALSE,
        options = list(plugins = list("drag_drop"))
      )

      inputs[[EC$ID$POP_FLAGS_AFTER_GROUPS]] <- shiny::reactive(input[[EC$ID$POP_FLAGS_AFTER_GROUPS]])
    }

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

    # Initialize variable labels reactive value
    var_labels <- shiny::reactiveVal(list())

    et <- shiny::reactive({
      d <- table_dataset()
      pd <- pop_dataset()
      group_vars <- inputs[[EC$ID$GRP]]()
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

      # Store variable labels for information display in final HTML
      combined_labels <- c(get_lbls_robust(d), get_lbls_robust(pd))
      var_labels(combined_labels[!duplicated(names(combined_labels))])

      selected_vars <- c(hierarchy, group_vars, event_group_var)
      pop_flag_vars <- NULL

      if (show_pop_flag_selection) {
        pop_flag_vars <- inputs[[EC$ID$POP_FLAG_VARS]]()
        pop_flags_after_groups <- inputs[[EC$ID$POP_FLAGS_AFTER_GROUPS]]()

        if (!is.null(pop_flag_vars) && length(pop_flag_vars) > 0) {
          pd <- process_pop_flag_vars(pd, pop_flag_vars)

          group_vars <- if (pop_flags_after_groups) c(group_vars, ".pop_group") else c(".pop_group", group_vars)
          selected_vars <- c(selected_vars, pop_flag_vars)
        }
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
          checkmate::test_character(group_vars, min.chars = 1, min.len = 1, max.len = 3),
          EC$MSG$VALIDATE$NO_GRP
        ),
        shiny::need(
          checkmate::test_character(hierarchy, min.chars = 1, min.len = 1, max.len = 4),
          EC$MSG$VALIDATE$NO_HIERARCHY
        ),
        shiny::need(
          checkmate::test_number(min_percent, na.ok = FALSE, lower = 0, upper = 100),
          EC$MSG$VALIDATE$NO_MIN_PERCENT
        ),
        shiny::need(
          checkmate::test_set_equal(selected_vars, unique(selected_vars), ordered = TRUE),
          EC$MSG$VALIDATE$VAR_OVERLAP
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
        ),
        shiny::need(
          !checkmate::test_choice(event_group_var, hierarchy, null.ok = FALSE),
          EC$MSG$VALIDATE$EVENT_GRP_CLASH
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
                                               group_vars = group_vars,
                                               subjid_var = subjid_var,
                                               pop_flag_vars = pop_flag_vars,
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

      t <- pivot_wide_format_events_table(
        events_table_raw,
        min_percent,
        inputs[[EC$ID$REMOVE_ROWS_UNDER_MIN_PERCENT]]()
      ) |>
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
      var_labels <- var_labels()

      # Start a progress bar and leave its cleanup to the `input[[EC$ID$RENDER_COMPLETION_CALLBACK]]` observer
      p <- shiny::Progress$new(session = session)
      table_progress_bars[[length(table_progress_bars) + 1]] <<- p
      on.exit(p$inc(amount = 0.3))
      p$set(message = "2) Generating & Rendering Table", value = 0.2)

      rendered_content <- sort_wide_format_event_table_to_HTML(
        et,
        var_labels,
        on_cell_click
      )
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

        has_event_group <- if (show_event_group_by) {
          length(inputs[[EC$ID$EVENT_GROUP]]()) > 0
        } else {
          FALSE
        }

        if (has_event_group) {
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
#' @param show_pop_flag_selection `[logical(1)]`
#'
#' A flag to indicate whether to show the population flag selection. Other associated arguments are `default_pop_flags`
#' and `pop_flag_choices`.
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
#' @param default_hierarchy `[character(1+)|NULL]`
#'
#' A default value for the hierarchy variables selection (optional).
#'
#' @param default_group `[character(1+)|NULL]`
#'
#' A default value for the group variables selection (optional).
#'
#' @param default_total `[logical(1)]`
#'
#' A default value for checkbox determining whether to add a total group column.
#'
#' @param default_min_percent `[numeric(1)]`
#'
#' A default value (0-100) for the minimum percentage of subjects a row must reach to be displayed. Rows below
#' this threshold have their counts replaced with a dash instead of being shown.
#'
#' @param default_remove_rows_under_min_percent `[logical(1)]`
#'
#' A default value for checkbox determining whether to remove entire rows for which every group's percentage of
#' subjects falls below `default_min_percent`, instead of just showing a dash for those cells.
#'
#' @param default_pop_flags `[character(1+) | NULL]`
#'
#' A vector of variable names from the population dataset, used as the default for selected population flag variables
#' (optional).
#'
#' Subjects are identified as being within a population when the value of the flag variable is `"Y"`.
#'
#' @param default_pop_flags_after_groups `[logical(1)]`
#'
#' A flag specifying the default value for the checkbox that determines whether to show the population flags after the
#' group variables.
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
#' A character vector specifying the possible choices for the group variables selection (optional).
#' If it is not specified then all factor and character variables from the population data will be used.
#'
#' @param pop_flag_choices `[character(1+) | NULL]`
#'
#' A vector of variable names from the population dataset, specifying the possible choices for the population flag
#' variables (optional). If it is not specified then all `FL` suffixed factor and character variables from the
#' population dataset will be used.
#'
#' Subjects are identified as being within a population when the value of the flag variable is `"Y"`.
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
mod_hierarchical_count_table <- function(
    module_id,
    table_dataset_name,
    pop_dataset_name,
    subjid_var = "USUBJID",
    show_pop_flag_selection = FALSE,
    show_event_group_by = FALSE,
    show_time_at_risk_options = FALSE,
    show_modal_on_click = TRUE,

    default_hierarchy = NULL,
    default_group = NULL,
    default_total = TRUE,
    default_min_percent = 0,
    default_remove_rows_under_min_percent = FALSE,
    default_pop_flags = NULL,
    default_pop_flags_after_groups = FALSE,
    default_event_group = NULL,
    default_event_date = NULL,
    default_origin_date = NULL,
    default_censor_date = NULL,
    default_risk = FALSE,

    hierarchy_choices = NULL,
    group_choices = NULL,
    pop_flag_choices = NULL,
    event_group_choices = NULL,
    event_date_choices = NULL,
    origin_date_choices = NULL,
    censor_date_choices = NULL,
    intended_use_label = "Use only for internal review and monitoring during the conduct of clinical trials.",
    receiver_id = NULL
) {
  mod <- list(
    ui = function(module_id) {
      hierarchical_count_table_ui(
        id = module_id,
        show_pop_flag_selection = show_pop_flag_selection,
        show_event_group_by = show_event_group_by,
        show_time_at_risk_options = show_time_at_risk_options,
        default_pop_flags_after_groups = default_pop_flags_after_groups,
        default_total = default_total,
        default_risk = default_risk,
        default_min_percent = default_min_percent,
        default_remove_rows_under_min_percent = default_remove_rows_under_min_percent
      )
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
        table_dataset = shiny::reactive(afmm[["filtered_dataset_list"]]()[[
          table_dataset_name
        ]]),
        pop_dataset = shiny::reactive(afmm[["filtered_dataset_list"]]()[[
          pop_dataset_name
        ]]),
        subjid_var = subjid_var,
        show_pop_flag_selection = show_pop_flag_selection,
        show_event_group_by = show_event_group_by,
        show_time_at_risk_options = show_time_at_risk_options,
        show_modal_on_click = show_modal_on_click,
        on_sbj_click_fun = on_sbj_click_fun,
        default_hierarchy = default_hierarchy,
        default_group = default_group,
        default_pop_flags = default_pop_flags,
        default_event_group = default_event_group,
        default_event_date = default_event_date,
        default_origin_date = default_origin_date,
        default_censor_date = default_censor_date,
        hierarchy_choices = hierarchy_choices,
        group_choices = group_choices,
        pop_flag_choices = pop_flag_choices,
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
  show_pop_flag_selection = "",
  show_event_group_by = "",
  show_time_at_risk_options = "",
  show_modal_on_click = "",
  default_hierarchy = "",
  default_group = "",
  default_total = "",
  default_min_percent = "",
  default_remove_rows_under_min_percent = "",
  default_pop_flags = "",
  default_pop_flags_after_groups = "",
  default_event_group = "",
  default_event_date = "",
  default_origin_date = "",
  default_censor_date = "",
  default_risk = "",
  hierarchy_choices = "",
  group_choices = "",
  pop_flag_choices = "",
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
  show_pop_flag_selection = TC$logical(),
  show_event_group_by = TC$logical(),
  show_time_at_risk_options = TC$logical(),
  show_modal_on_click = TC$logical(),
  default_hierarchy = TC$col(
    "table_dataset_name",
    TC$or(TC$character(), TC$factor())
  ) |>
    TC$flag("zero_or_more", "optional"),
  default_group = TC$col(
    "pop_dataset_name",
    TC$or(TC$character(), TC$factor())
  ) |>
    TC$flag("optional"),
  default_total = TC$logical(),
  default_min_percent = TC$numeric(min = 0, max = 100),
  default_remove_rows_under_min_percent = TC$logical(),
  default_pop_flags = TC$col(
    "pop_dataset_name",
    TC$or(TC$character(), TC$factor())
  ) |>
    TC$flag("zero_or_more", "optional"),
  default_pop_flags_after_groups = TC$logical(),
  default_event_group = TC$col(
    "table_dataset_name",
    TC$or(TC$character(), TC$factor())
  ) |>
    TC$flag("optional"),
  default_event_date = TC$col("table_dataset_name", TC$date()) |>
    TC$flag("optional"),
  default_origin_date = TC$col("pop_dataset_name", TC$date()) |>
    TC$flag("optional"),
  default_censor_date = TC$col("pop_dataset_name", TC$date()) |>
    TC$flag("optional"),
  default_risk = TC$logical(),
  hierarchy_choices = TC$col(
    "table_dataset_name",
    TC$or(TC$character(), TC$factor())
  ) |>
    TC$flag("zero_or_more", "optional"),
  group_choices = TC$col(
    "pop_dataset_name",
    TC$or(TC$character(), TC$factor())
  ) |>
    TC$flag("zero_or_more", "optional"),
  pop_flag_choices = TC$col(
    "pop_dataset_name",
    TC$or(TC$character(), TC$factor())
  ) |>
    TC$flag("zero_or_more", "optional"),
  event_group_choices = TC$col(
    "table_dataset_name",
    TC$or(TC$character(), TC$factor())
  ) |>
    TC$flag("zero_or_more", "optional"),
  event_date_choices = TC$col("table_dataset_name", TC$date()) |>
    TC$flag("zero_or_more", "optional"),
  origin_date_choices = TC$col("pop_dataset_name", TC$date()) |>
    TC$flag("zero_or_more", "optional"),
  censor_date_choices = TC$col("pop_dataset_name", TC$date()) |>
    TC$flag("zero_or_more", "optional"),
  intended_use_label = TC$character() |> TC$flag("optional"),
  receiver_id = TC$character() |> TC$flag("optional")
) |>
  TC$attach_docs(mod_hierarchical_count_table_API_docs)


check_mod_hierarchical_count_table <- function(
    afmm, datasets, module_id, table_dataset_name, pop_dataset_name, subjid_var,
    show_pop_flag_selection, show_event_group_by, show_time_at_risk_options, show_modal_on_click,
    default_hierarchy, default_group, default_total, default_min_percent, default_remove_rows_under_min_percent,
    default_pop_flags, default_pop_flags_after_groups, default_event_group, default_event_date, default_origin_date,
    default_censor_date, default_risk, hierarchy_choices, group_choices, pop_flag_choices, event_group_choices,
    event_date_choices, origin_date_choices, censor_date_choices, intended_use_label, receiver_id) {
  err <- CM$container()

  # TODO: Replace this function with a generic one that performs the checks based on mod_hierarchical_count_API_spec.
  # Something along the lines of OK <- CM$check_API(mod_hierarchical_count_API_spec, args = match.call(), err)

  OK <- check_mod_hierarchical_count_table_auto(
    afmm,
    datasets,
    module_id,
    table_dataset_name,
    pop_dataset_name,
    subjid_var,
    show_pop_flag_selection,
    show_event_group_by,
    show_time_at_risk_options,
    show_modal_on_click,
    default_hierarchy,
    default_group,
    default_total,
    default_min_percent,
    default_remove_rows_under_min_percent,
    default_pop_flags,
    default_pop_flags_after_groups,
    default_event_group,
    default_event_date,
    default_origin_date,
    default_censor_date,
    default_risk,
    hierarchy_choices,
    group_choices,
    pop_flag_choices,
    event_group_choices,
    event_date_choices,
    origin_date_choices,
    censor_date_choices,
    intended_use_label,
    receiver_id,
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
mock_app_hierarchical_count_table <- function(dry_run = FALSE,
                                              update_query_string = TRUE,
                                              srv_defaults = list(),
                                              ui_defaults = list()) {

  if (!requireNamespace("pharmaverseadam")) stop("Install pharmaverseadam")

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

  if (!requireNamespace("dv.manager")) stop("Install dv.manager")
  if (!requireNamespace("dv.papo")) stop("Install dv.papo")
  if (!requireNamespace("pharmaverseadam")) stop("Install pharmaverseadam")

  adsl <- pharmaverseadam::adsl |> dplyr::filter(!is.na(.data[["RANDDT"]]))
  adae <- pharmaverseadam::adae

  attr(adsl, "meta") <- base::file.info("NEWS.md")
  attr(adae, "meta") <- base::file.info("NEWS.md")

  dv.manager::run_app(
    data = list(
      pharmaverseadam = list(adae = adae, adsl = adsl)
    ),
    module_list = list(
      "Hierarchy Table" = mod_hierarchical_count_table(
        module_id = "hier_table",
        table_dataset_name = "adae",
        pop_dataset_name = "adsl",
        show_pop_flag_selection = TRUE,
        show_modal_on_click = TRUE,
        default_hierarchy = c("AEBODSYS", "AEDECOD"),
        default_group = "TRT01P",
        default_total = TRUE,
        receiver_id = "papo"
      ),
      "Time at Risk Hierarchy Table" = mod_hierarchical_count_table(
        module_id = "hier_time_at_risk",
        table_dataset_name = "adae",
        pop_dataset_name = "adsl",
        show_pop_flag_selection = TRUE,
        show_time_at_risk_options = TRUE,
        show_modal_on_click = TRUE,
        default_hierarchy = c("AEBODSYS", "AEDECOD"),
        default_group = "TRT01P",
        default_event_date = "ASTDT",
        default_origin_date = "TRTSDT",
        default_censor_date = "EOSDT",
        default_total = FALSE,
        default_risk = TRUE,
        receiver_id = "papo"
      ),
      "Hierarchy Table by Event Group" = mod_hierarchical_count_table(
        module_id = "hier_event_group",
        table_dataset_name = "adae",
        pop_dataset_name = "adsl",
        show_pop_flag_selection = TRUE,
        show_event_group_by = TRUE,
        show_modal_on_click = TRUE,
        default_hierarchy = c("AEBODSYS", "AEDECOD"),
        default_group = "TRT01P",
        default_total = FALSE,
        default_event_group = "AESEV",
        receiver_id = "papo"
      ),
      "Patient Profile" = dv.papo::mod_patient_profile(
        module_id = "papo",
        subject_level_dataset_name = "adsl",
        subjid_var = "USUBJID",
        sender_ids = c("hier_table", "hier_time_at_risk", "hier_event_group"),
        summary = list(vars = c("AGE", "SEX", "RACE", "ETHNIC", "ARM"),
                       column_count = 1)
      )
    ),
    filter_dataset_name = "adsl",
    filter_key = "USUBJID",
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
