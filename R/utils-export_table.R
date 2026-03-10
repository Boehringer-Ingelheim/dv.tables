#' Preprocess table for download as Excel (.xlsx) or Word (.rtf)
#'
#' @details
#' Each entry in the group columns of the `count_table` data frame is a 2-element list of `count`
#' (formatted as count and percent) and `subjid` - the count and percent information is extracted
#' into the processed data.
#'
#' Overall patient numbers are extracted from the metadata and added as a separate line at the
#' beginning.
#'
#' If the option to split count and percentage into separate columns is selected, then the column
#' with the count will be suffixed with `" [N]"` and the column with the percentage will be suffixed
#' with `" [%]"`.
#'
#' When processing data for Word, dual event columns are merged into an indented hierarchy of event
#' values.
#'
#' @param count_table A reactive list containing dataset containing the event data
#'   and other metadata.
#' @param download_type A string specifying the download type as a file extension, either
#'   `.xlsx` for Excel or `.rtf` for Word.
#' @param split_columns A logical indicating if count and percent should be split into separate
#'   columns.
#'
#' @return Processed data frame.
#'
#' @keywords internal
preprocess_download_table <- function(count_table, download_type, split_columns) {

  checkmate::assert_list(count_table,
                         types = c("data.frame", "list"),
                         null.ok = TRUE,
                         names = "named")

  checkmate::assert_subset(names(count_table), c("df", "meta"))
  checkmate::assert_subset(c("n_denominator",
                             "hierarchy"),
                           names(count_table[["meta"]]))

  # At least one row is required to download the table
  checkmate::assert_data_frame(count_table[["df"]], min.rows = 1)

  checkmate::assert_string(download_type)
  checkmate::assert_choice(download_type, c(".xlsx", ".rtf"))

  checkmate::assert_logical(split_columns)

  # Get group subject totals (named by group) and extract group names
  total_colname <- count_table[["meta"]]$n_denominator
  group_names <- names(total_colname)

  # Get event variables
  event_vars <- count_table[["meta"]]$hierarchy
  event_var_labels <- attr(event_vars, "labels")

  # Get event group values (empty vector if no event group specified)
  event_group_vals <- count_table[["meta"]]$event_group_vals

  # Flag when event group has been specified
  has_event_group <- length(event_group_vals) > 0

  # Get data frame
  df_prep <- count_table[["df"]]

  # For event group data, expand groups into columns for each event group value
  if (has_event_group) {
    old_names <- names(df_prep)
    df_prep <- df_prep |> tidyr::unnest_wider(col = tidyr::all_of(group_names), names_sep = EC$VAL$SPECIAL_CHAR)
    group_names <- setdiff(names(df_prep), old_names)
  }

  # Names of statistical results in each cell list
  stat_names <- intersect(names(df_prep[1, ][[group_names[1]]][[1]]),
                          c("count", "time_at_risk", "incidence_rate"))

  df_prep <- df_prep |>
    dplyr::select(dplyr::all_of(event_vars), dplyr::all_of(group_names)) |>

    # Subset on the statistical results in each cell list (dropping subjid)
    dplyr::mutate(dplyr::across(dplyr::all_of(group_names),
                                ~ purrr::map(.x, ~ .x[stat_names]))) |>

    # Remove factors from event columns
    dplyr::mutate(dplyr::across(dplyr::all_of(event_vars), as.character)) |>

    # Convert special chars to "Total"
    dplyr::mutate(dplyr::across(dplyr::all_of(event_vars),
                                ~ sub(EC$VAL$SPECIAL_CHAR, "Total", .x)))

  if (download_type == ".rtf") {

    if (length(event_vars) == 2) {

      # Create indented hierarchy of event values for dual event columns
      df_prep <- df_prep |>

        # Modify second event column to indent values with double-space; otherwise, for event
        # column totals, copy value from first event column.
        dplyr::mutate(dplyr::across(dplyr::all_of(event_vars[2]),
                                    ~ ifelse(.x == "Total",
                                             .data[[event_vars[1]]],
                                             paste0("  ", .x)))) |>

        # Remove first event column
        dplyr::select(-event_vars[1]) |>

        # Line break code <br> will be replaced by RTF \line after RTF string is generated
        dplyr::rename_with(~ paste0(event_var_labels[[1]], "<br>  ", event_var_labels[[2]]),
                           dplyr::all_of(event_vars[2]))
    } else {

      # Single event column - rename with label only
      df_prep <- df_prep |>
        dplyr::rename_with(~ event_var_labels[[1]], dplyr::all_of(event_vars[1]))
    }

  } else if (download_type == ".xlsx") {

    df_prep <- df_prep |>

      # Replace the Em Dash character with empty string
      dplyr::mutate(dplyr::across(dplyr::all_of(group_names),
                                  ~ purrr::map(.x, function(lst) purrr::map(lst, ~ sub("\u2014", "", .x))))) |>


      # Add label in square-brackets after variable name
      dplyr::rename_with(~ ifelse(event_var_labels != event_vars,
                                  paste0(event_vars, " [", event_var_labels, "]"),
                                  event_vars), dplyr::all_of(event_vars))
  }

  # Add new row with overall number of patients ----

  new_row <- stats::setNames(
    data.frame(matrix(ncol = ncol(df_prep), nrow = 1)),
    names(df_prep)
  )

  new_row[[1, 1]] <- "Overall No. of Patients"

  empty_stat_list <- stats::setNames(as.list(rep("", length(stat_names))), stat_names)

  for (col in group_names) {
    new_row[[col]] <- list(empty_stat_list)

    if (has_event_group) {
      group_val <- strsplit(col, EC$VAL$SPECIAL_CHAR)[[1]][[1]]
      new_row[[col]][[1]][["count"]] <- as.character(total_colname[group_val])
    } else {
      new_row[[col]][[1]][["count"]] <- as.character(total_colname[col])
    }
  }

  df_prep <- rbind(new_row, df_prep)

  # ----

  if (split_columns) {
    df_prep <- df_prep |>
      dplyr::mutate(dplyr::across(dplyr::all_of(group_names),
                                  ~ purrr::map(.x, function(lst) {
                                    n_pct <- unlist(strsplit(lst[["count"]], "[()]"))
                                    if (length(n_pct) == 0) n_pct <- ""

                                    n <- trimws(n_pct[1])
                                    pct <- trimws(n_pct[2])
                                    pct <- ifelse(is.na(pct), "", gsub("[ %]", "", pct))

                                    lst[["count"]] <- NULL
                                    c(list(n = n, pct = pct), lst)
                                  })))

    # Update statistical result names replacing "count" with "n" and "pct"
    stat_names <- unlist(ifelse(stat_names == "count", list(c("n", "pct")), stat_names))

  } else if (download_type == ".rtf") {
    df_prep <- df_prep |>

      # Convert `XX ( XX.XX %)` format to `XX (XX.XX)`
      dplyr::mutate(dplyr::across(dplyr::all_of(group_names), ~ purrr::map(.x, function(lst) {
        lst[["count"]] <- sub("([0-9]+)[ (]+([0-9.]+)[ %)]+)", "\\1 (\\2)", lst[["count"]])
        lst
      })))
  }

  # For Excel, convert any single element statistics to numeric
  if (download_type == ".xlsx") {
    numeric_stats <- intersect(stat_names, c("n", "pct", "time_at_risk", "incidence_rate"))

    df_prep <- df_prep |>
      dplyr::mutate(dplyr::across(dplyr::all_of(group_names), ~ purrr::map(.x, function(lst) {
        lst[numeric_stats] <- lapply(lst[numeric_stats], as.numeric)
        lst
      })))
  }

  # Split group columns into columns for their individual statistics ----

  stats_lookup <- list()

  stats_lookup[[".xlsx"]] <- c(count = " [N (%)]",
                               n = " [N]",
                               pct = " [%]",
                               time_at_risk = " [Time at Risk]",
                               incidence_rate = " [Incidence Rate]")

  stats_lookup[[".rtf"]] <- c(count = "<br>N (%)",
                              n = "<br>N",
                              pct = "<br>%",
                              time_at_risk = "<br>Time at Risk",
                              incidence_rate = "<br>Incidence Rate")

  # Extract stat columns from each group, naming with prefix
  new_cols <- purrr::map(group_names, function(col) {
    purrr::map_dfr(df_prep[[col]],
                   ~ purrr::set_names(.x[stat_names],
                                      paste0(col, stats_lookup[[download_type]][stat_names])))
  })

  # Bind side-by-side
  df_prep <- dplyr::select(
    dplyr::bind_cols(df_prep, new_cols),
    -dplyr::all_of(group_names)
  )

  # For event group column names, replace special separator character with display-friendly "/"
  if (has_event_group) {
    names(df_prep) <- sub(EC$VAL$SPECIAL_CHAR, "/", names(df_prep), fixed = TRUE)
  }

  return(df_prep)
}
