SUMMTAB <- poc(
  ID = poc(
    TBL_OPTIONS = "tbl_options",
    STATS_OPTIONS = "stats_options",
    COL_SELECTIONS = "col_selections",
    ANL_VARS = "anl_vars",
    GROUP_VARS = "group_vars",
    ROW_VARS = "row_vars",
    POP_FLAG_VARS = "pop_flag_vars",
    POP_FLAGS_AFTER_GROUPS = "pop_flags_after_groups",
    TOTAL_FLAG = "total",
    DROP_NA_FLAG = "drop_na",
    DROP_EMPTY_ROWS = "drop_empty_rows",
    SHOW_CATEGORY_N = "show_category_n",
    DENOM = "denom",
    AGGREGATE_METHOD = "aggregate_method",
    STATS = "stats",
    TBL_OUTPUT = "table_output",
    RENDER_COMPLETION_CALLBACK = "render_completion_callback"
  ),
  LBL = poc(
    TBL_OPTIONS = "Table Options",
    STATS_OPTIONS = "Statistics",
    COL_SELECTIONS = "Column Selection",
    ANL_VARS = "Summarize on:",
    GROUP_VARS = "Group by:",
    ROW_VARS = "Row by:",
    POP_FLAG_VARS = "Population flags:",
    POP_FLAGS_AFTER_GROUPS = "Move after group variables",
    TOTAL_FLAG = "Show a total column",
    DROP_NA_FLAG = "Drop NA values from numerical analyses",
    DROP_EMPTY_ROWS = "Remove rows with no data",
    SHOW_CATEGORY_N = "Show categorical n",
    DENOM = "Denominator used for categorical percentage:",
    AGGREGATE_METHOD = "Multi-value per subject aggregation method:",
    STATS = "Statistics for numerical analysis:"
  ),
  VALIDATE = poc(
    NO_TABLE_ROWS = "Table dataset has 0 rows",
    NO_POP_ROWS = "Population dataset has 0 rows",
    NO_ANL_VARS = "No variables selected to summarize on",
    NO_GROUP_VARS = "No variables selected to group by",
    TOO_MANY_ROW_VARS = "Maximum of 8 row variables allowed",
    VAR_OVERLAP = "Variable has been selected in more than one selection",
    NO_STATS = "No statistics selected",
    POP_GROUP_DUP = "Population dataset has more than one row per subject per grouping"
  ),
  VAL = poc(
    SPECIAL_CHAR = "\u001D", # For naming and processing row levels
    EM_DASH = "\u2014"
  )
)


#' Metadata environment for summary table calculation
#'
#' This environment is used to temporarily store denominator values for percentage calculation across categories.
#'
#' @keywords internal
summtab_meta_env <- new.env()


#' Calculate statistics for the "current" `dplyr::summarize` group
#'
#' Categorical data analysis (count and percentage of denominator) is signified by a dummy analysis variable, `.dummy`,
#' where count is just the number of rows in the group. The denominator is stored in the environmental variable,
#' `summtab_meta_env$n_denom`, during the processing of the first special total category group, and therefore is
#' available to the subsequent processing of proper categories.
#'
#' @param analysis_df A data frame containing `dplyr::summarize` group rows from the analysis data frame.
#' @param subjid_var A string representing the subject identifier column.
#' @param anl_var A string representing the name of the analysis variable to calculate the statistics on. For
#'   categorical analysis it should be `.dummy`.
#' @param stats_functions A named list defining the functions used for summarizing the data.
#' @param aggregate_func_name A string representing the name of the function used to aggregate multiple rows per subject
#'   into one.
#' @param denom A string, either "N" or "n", indicating the denominator to use for percent (`pct`) calculation.
#'
#' @return A list containing:
#' - `<stat>[.x]`, ...: One or more statistics calculated from `stats_functions`. The `<stat>` part matches the function
#'   name. The optional `.x` (`.1`, `.2`, etc.) is used when the function returns multiple values.
#' - `subjid`: A list of subject identifiers summarized in the group.
#'
#' @keywords internal
summtab_calc_stats <- function(analysis_df,
                               subjid_var,
                               anl_var,
                               stats_functions,
                               aggregate_func_name,
                               denom = "N") {

  # Initialise a results list
  results_list <- list()

  # If grouping is empty then return with no subject identifiers
  if (nrow(analysis_df) == 0L) {
    results_list[["subjid"]] <- list()
    return(list(results_list))
  }

  # Extract the package and the bare function name dynamically
  if (grepl("::", aggregate_func_name)) {
    agg_func_parts <- strsplit(aggregate_func_name, "::")[[1]]
    aggregate_func <- get(agg_func_parts[2], envir = asNamespace(agg_func_parts[1]), mode = "function")
  } else {
    aggregate_func <- get(aggregate_func_name, mode = "function")
  }

  # Collapse multiple rows per subject into one
  filter_df <- analysis_df |>
    dplyr::group_by(dplyr::across(dplyr::all_of(c(subjid_var, ".N")))) |>
    dplyr::summarise(!!anl_var := aggregate_func(.data[[anl_var]]), .groups = "drop")

  x_vals <- filter_df[[anl_var]]
  len_x <- length(x_vals)

  for (stat_name in names(stats_functions)) {

    f <- stats_functions[[stat_name]]

    if (stat_name == "pct") {
      results_list[[stat_name]] <- f(x_vals, n = summtab_meta_env$n_denom)
    } else {
      f_result <- f(x_vals)
      if (length(f_result) == 1L) {
        results_list[[stat_name]] <- f_result
      } else {
        # For function with multiple results, assign the elements, <stat_name>.1, <stat_name>.2, etc.
        results_list[paste0(stat_name, ".", seq_along(f_result))] <- f_result
      }
    }

    # Save the total count for the grouping, so it can be used later in percent calculation.
    category_n <- paste0(SUMMTAB$VAL$SPECIAL_CHAR, "n")
    if (anl_var == ".dummy") {
      group_df <- dplyr::cur_group()
      if (group_df[[ncol(group_df)]] == category_n) {
        summtab_meta_env$n_denom <- if (denom == "N") analysis_df[[".N"]][1] else results_list[["n"]]
      }
    }
  }

  # Get subject identifiers
  results_list[["subjid"]] <- as.list(as.character(filter_df[[subjid_var]]))

  return(list(results_list))
}


#' Combine and format calculated statistics using provided templates
#'
#' @param analysis_df A data frame containing the analysis data with statistics elements in separate columns.
#' @param stats_fmts A named list of lists defining the combination and formatting of the statistics elements from
#'   `analysis_df`. Each element of `stats_fmts` lists the argument values passed to `sprintf`, the result being
#'   assigned to the element name.
#' @param replace A named list of named vectors defining replacements that should be applied to the formatted results
#'   from `stats_fmts`. The names given to the vector elements are regular expressions to match the formatted results,
#'   and the elements themselves are the replacement strings. The names of the list elements should match the names of
#'   the list elements in `stats_fmts`.
#' @param stats_element_names A vector of all statistics element names, used to determine elements that have not been
#'   used in `stats_fmts` and therefore have basic formatting applied (conversion to character).
#'
#' @return A data frame of combined and formatted statistics.
#'
#' @keywords internal
summtab_format_stats <- function(analysis_df,
                                 stats_fmts,
                                 replace,
                                 stats_element_names) {

  formatted_df <- analysis_df
  drop_stats <- character()

  stat_fmt_names <- names(stats_fmts)
  for (fmt_name in stat_fmt_names) {
    fmt <- stats_fmts[[fmt_name]]
    for (i in 2L:length(fmt)) {
      statistic <- fmt[[i]]
      drop_stats <- c(drop_stats, statistic)
      fmt[[i]] <- analysis_df[[statistic]]
    }

    formatted_df[[fmt_name]] <- do.call(sprintf, fmt)

    lookups <- replace[[fmt_name]]
    if (!is.null(lookups)) {
      for (lui in seq_along(lookups)) {
        lu_pat <- names(lookups)[lui]
        lu_rep <- lookups[[lui]]
        formatted_df[[fmt_name]] <- sub(lu_pat, lu_rep, formatted_df[[fmt_name]])
      }
    }
  }

  # Format statistics that were not already combined/formatted
  unformatted_stats <- setdiff(stats_element_names, drop_stats)
  formatted_df[unformatted_stats] <- lapply(formatted_df[unformatted_stats], as.character)

  # Drop stats that have been combined/formatted to a new name
  drop_stats <- setdiff(drop_stats, stat_fmt_names)
  formatted_df <- formatted_df |>
    dplyr::select(-dplyr::all_of(drop_stats)) |>
    dplyr::relocate(dplyr::all_of(c(stat_fmt_names, unformatted_stats)),
                    .after = dplyr::everything())

  return(formatted_df)
}


#' Perform summary table computations
#'
#' @param tbl_df A data frame containing the data for analysis.
#' @param pop_df A data frame containing the population data.
#' @param anl_vars A vector of names of analysis variables from `tbl_df`.
#' @param group_vars A vector of names of population grouping variables from `pop_df`.
#' @param row_vars A vector of names of row categorization variables from `tbl_df`.
#' @param pop_flag_vars A vector of names of population flag variables from `pop_df`.
#' @param subjid_var A string representing the subject identifier column in both datasets.
#' @param stats_functions A named list defining the functions used for summarizing numerical data.
#' @param stats_formats A named list of lists defining the combination and formatting of the function results from
#'   summarizing numerical data.
#' @param stats_labels A named vector of statistics labels that should be used in the summary table.
#' @param stats_replace A named list of named vectors defining replacements that should be applied to the formatted
#'   results from `stats_formats`.
#' @param total A flag that determines whether to add a total group column.
#' @param total_group_val A string indicating the label for the total group column.
#' @param drop_na A flag that determines whether to drop NA values from selected 'group by' and 'row by' variables.
#' @param drop_empty_rows A flag that determines whether to remove rows with no data from the analysis results.
#' @param show_category_n A flag that determines whether to show the 'n' category when summarizing categorical data.
#' @param denom A string, either "N" or "n", indicating whether the denominator for categorical data should be taken as
#'   the number of subjects from the population grouping ("N") or the number of subjects from the 'row by' grouping for
#'   each population grouping ("n"). If `drop_na == TRUE` then `NA` values will be excluded from determining the "n"
#'   denominator.
#' @param aggregate_func_name A string representing the name of the function used to aggregate multiple rows per
#'   subject into one.
#'
#' @return A list containing:
#' - `df`: A data frame of the analysed data. Columns: row variables, analysis variable name, statistics for each
#'   population group combination, ".first" flags for rendering.
#' - `meta`: A list of metadata:
#'   - `anl_var`: A vector of analysis variable names.
#'   - `group_vars`: A vector of group variable names.
#'   - `row_vars`: A vector of row variable names.
#'   - `flag_columns`: A vector of names of columns holding the ".first" flags for rendering.
#'   - `data_columns`: A vector of names of columns holding the statistics for each population group combination.
#'   - `total_group_val`: A string indicating the label for the total group column.
#'   - `denom_df`: A data frame of population group denominator data.
#'   - `aggregate_flag`: A flag indicating whether rows have been aggregated.
#'   - `aggregate_func_name`: A string indicating the name of the function used for aggregating.
#'
#' @keywords internal
summtab_compute <- function(tbl_df,
                            pop_df,
                            anl_vars = NULL,
                            group_vars = NULL,
                            row_vars = NULL,
                            pop_flag_vars = NULL,
                            subjid_var = NULL,

                            stats_functions = NULL,
                            stats_formats = NULL,
                            stats_labels = NULL,
                            stats_replace = NULL,

                            total = NULL,
                            total_group_val = "Total",
                            drop_na = NULL,
                            drop_empty_rows = NULL,
                            show_category_n = NULL,
                            denom = NULL,
                            aggregate_func_name = NULL) {

  anl_var <- paste0(SUMMTAB$VAL$SPECIAL_CHAR, "anl_var")
  stat_col <- paste0(SUMMTAB$VAL$SPECIAL_CHAR, "stat")

  category_n <- paste0(SUMMTAB$VAL$SPECIAL_CHAR, "n")

  anl_vars_num <- intersect(anl_vars, names(tbl_df)[sapply(tbl_df, is.numeric)])
  anl_vars_cat <- setdiff(anl_vars, anl_vars_num)

  # Only keep distinct subject identifier and group variables from population dataset
  pop_df <- pop_df |>
    dplyr::select(dplyr::all_of(c(subjid_var, group_vars))) |>
    dplyr::distinct()

  # Only keep subject identifier, and analysis/group/row variables from analysis dataset
  tbl_df <- tbl_df |>
    dplyr::select(dplyr::any_of(c(subjid_var, anl_vars, group_vars, row_vars)))

  if (drop_na) {
    # Remove NA values (analysis variables handled individually later on)
    pop_df <- tidyr::drop_na(pop_df, dplyr::all_of(group_vars))
    tbl_df <- tidyr::drop_na(tbl_df, dplyr::all_of(row_vars))
  } else {
    # Replace NA values in selected variables with "<NA>" and add associated level
    pop_df[group_vars] <- lapply(pop_df[group_vars], add_na_factor_level)
    tbl_df[row_vars] <- lapply(tbl_df[row_vars], add_na_factor_level)
    tbl_df[anl_vars_cat] <- lapply(tbl_df[anl_vars_cat], add_na_factor_level)
  }

  # Identify population group vars that occur in table data frame
  common_group_vars <- intersect(group_vars, names(tbl_df))

  # Duplicate all rows so that total can be calculated for first group var
  if (total) {
    group_var_1 <- group_vars[[1]]
    gv1_fct_levels <- c(levels(pop_df[[group_var_1]]), total_group_val)

    pop_df[[group_var_1]] <- factor(pop_df[[group_var_1]], levels = gv1_fct_levels)
    total_grp_fct <- factor(total_group_val, levels = c(levels(pop_df[[group_var_1]])))
    total_rows <- dplyr::mutate(pop_df, !!group_var_1 := total_grp_fct) |>
      dplyr::distinct() # Necessary when population dataset has more than one row per subject

    pop_col_labels <- get_lbls_robust(pop_df)
    pop_df <- pop_df |>
      rbind(total_rows) |>
      set_lbls(pop_col_labels)

    if (group_var_1 %in% names(tbl_df)) {
      tbl_df[[group_var_1]] <- factor(tbl_df[[group_var_1]], levels = gv1_fct_levels)
      total_rows <- dplyr::mutate(tbl_df, !!group_var_1 := total_grp_fct)

      tbl_col_labels <- get_lbls_robust(tbl_df)
      tbl_df <- tbl_df |>
        rbind(total_rows) |>
        set_lbls(tbl_col_labels)
    }
  }

  denom_df <- pop_df |>
    dplyr::group_by(dplyr::across(dplyr::all_of(group_vars)), .drop = FALSE) |>
    dplyr::summarise(.N = dplyr::n_distinct(.data[[subjid_var]]), .groups = "drop") |>
    dplyr::mutate(.lookup = do.call(paste, c(dplyr::pick(dplyr::all_of(group_vars)),
                                             sep = SUMMTAB$VAL$SPECIAL_CHAR)))

  pop_df_subset <- pop_df |>
    dplyr::left_join(denom_df, by = group_vars) |>
    dplyr::select(dplyr::all_of(c(subjid_var, group_vars, ".N")))

  analysis_df <- tbl_df |>
    dplyr::inner_join(pop_df_subset, by = c(subjid_var, common_group_vars), relationship = "many-to-many") |>
    dplyr::select(dplyr::all_of(c(subjid_var, group_vars, row_vars, anl_vars, ".N"))) |>

    dplyr::mutate(.dummy = 1)

  # Initialise list to hold results for each analysis variable
  results_list <- list()

  # Initialise flag that indicates if aggregation will be applied
  aggregate_flag <- FALSE

  for (av in anl_vars) {

    # Flag if analysis variable is numeric
    is_anl_var_num <- av %in% anl_vars_num

    av_df <- analysis_df

    if (is_anl_var_num) {
      # Numeric analysis variable

      av_stats_funcs <- stats_functions
      av_stats_fmts <- stats_formats
      av_stats_replace <- stats_replace

      group_by_vars <- c(group_vars, row_vars)
      av_mod <- av

      # Drop NA values
      av_df <- tidyr::drop_na(av_df, dplyr::all_of(av))

      # Check if aggregation will be applied
      if (nrow(dplyr::distinct(av_df[, c(subjid_var, group_by_vars)])) < nrow(av_df)) aggregate_flag <- TRUE
    } else {
      # Categorical analysis variable

      av_stats_funcs <- list(n = length,
                             pct = \(x, n) 100 * length(x) / n) # calc_pct)
      av_stats_fmts <- list(n_pct = list(fmt = "%d (%.1f %%)", "n", "pct"))
      av_stats_replace <- list(n_pct = c(`^NA \\(NA \\%\\)$` = "0"))

      group_by_vars <- c(group_vars, row_vars, av)  # CONVERT av TO FACTOR!?!?!
      av_mod <- ".dummy" # Counts done on dummy variable

      # Drop NA values (unless requested otherwise)
      if (drop_na) av_df <- tidyr::drop_na(av_df, dplyr::all_of(av))

      # Duplicate all rows so that small n can be calculated for categorical analysis vars
      av_df <- av_df |>
        dplyr::bind_rows(dplyr::mutate(av_df, !!av := category_n)) |>
        dplyr::mutate(!!av := factor(.data[[av]], levels = c(category_n, levels(av_df[[av]]))))
    }

    # Retrieve the label of the analysis variable if it exists, otherwise fall back to column name
    av_label <- attr(tbl_df[[av]], "label")
    if (is.null(av_label)) av_label <- av

    av_df <- av_df |>
      dplyr::group_by(dplyr::across(dplyr::all_of(group_by_vars)), .drop = FALSE) |>

      dplyr::summarise(.stats = summtab_calc_stats(
        dplyr::pick(dplyr::all_of(c(subjid_var, av_mod, ".N"))),
        subjid_var = subjid_var,
        anl_var = av_mod,
        stats_functions = av_stats_funcs,
        aggregate_func_name = aggregate_func_name,
        denom = denom
      ), .groups = "drop") |>
      dplyr::mutate(!!anl_var := av_label)

    # Extract statistics from their single column lists into their own columns
    av_df <- tidyr::unnest_wider(av_df, tidyr::all_of(".stats"))

    # Capture all statistics columns calculated by `summtab_calc_stats()` including those prefixed with `.1`, `.2`, etc.
    av_calc_stats_elems <- setdiff(names(av_df), c(group_by_vars, "subjid", anl_var))

    # Format statistics
    av_df <- summtab_format_stats(
      av_df,
      stats_fmts = av_stats_fmts,
      replace = av_stats_replace,
      stats_element_names = av_calc_stats_elems
    )

    stat_cols <- setdiff(names(av_df), c(group_by_vars, anl_var, "subjid"))

    # Transpose statistics into a single column
    av_df <- tidyr::pivot_longer(
      av_df,
      cols = dplyr::all_of(stat_cols),
      names_to = stat_col,
      values_to = ".val",
    )

    # If categorical analysis, then move category into statistic name
    if (!is_anl_var_num) {
      av_df[[stat_col]] <- as.character(av_df[[av]])
      av_df[[av]] <- NULL

      if (show_category_n) {
        # Rename small n category to "n"
        av_df[[stat_col]] <- ifelse(av_df[[stat_col]] == category_n, "n", av_df[[stat_col]])
      } else {
        # Remove small n category
        av_df <- av_df[av_df[[stat_col]] != category_n, ]
      }
    }

    # Replace names of statistics with their corresponding labels (for numeric analysis variables)
    if (is_anl_var_num && !is.null(stats_labels)) {
      labelled_stats <- unname(stats_labels[av_df[[stat_col]]])
      av_df[[stat_col]] <- ifelse(
        is.na(labelled_stats),
        av_df[[stat_col]],
        labelled_stats
      )
    }

    if (nrow(av_df)) results_list[[av]] <- av_df
  }

  results_df <- results_list |>
    dplyr::bind_rows()

  # Convert statistics value column into a list-column where each element is a
  # list of the value and its related subject identifiers
  results_df[[".val"]] <- purrr::map2(results_df[[".val"]], results_df[["subjid"]], ~ list(stat = .x, subjid = .y))

  # Transpose value/subjid list-column into columns representing group variable combinations
  wide_df <- tidyr::pivot_wider(
    results_df,
    id_cols = dplyr::all_of(c(row_vars, anl_var, stat_col)),
    names_from = dplyr::all_of(group_vars),
    names_sep = SUMMTAB$VAL$SPECIAL_CHAR,
    names_expand = TRUE,
    values_from = dplyr::all_of(".val")
  )

  df_names <- names(wide_df)
  internal_columns <- df_names[startsWith(df_names, SUMMTAB$VAL$SPECIAL_CHAR)]
  data_columns <- df_names[!df_names %in% c(row_vars, internal_columns)]

  # If requested, remove rows with no data
  if (drop_empty_rows) {
    wide_df <- wide_df |>
      dplyr::filter(
        !purrr::pmap_lgl(
          dplyr::pick(dplyr::all_of(data_columns)),
          \(...) all(purrr::map_lgl(list(...), ~ is.null(.x[["subjid"]])))
        )
      )
  }

  # Create a list of expanding groups
  hierarchy <- c(anl_var, row_vars)
  flag_columns <- paste0(SUMMTAB$VAL$SPECIAL_CHAR, "first.", hierarchy)
  expanding_groups <- purrr::accumulate(hierarchy, c)

  # Loop through each group level and add ".first" flag (used for rendering row categories)
  flagged_df <- wide_df
  for (i in seq_along(expanding_groups)) {
    current_group <- expanding_groups[[i]]
    first_col <- flag_columns[i]

    flagged_df <- flagged_df |>
      dplyr::group_by(dplyr::across(dplyr::all_of(current_group))) |>
      dplyr::mutate(!!first_col := dplyr::if_else(dplyr::row_number() == 1L, TRUE, FALSE)) |>
      dplyr::ungroup()
  }

  summtab_list <- list(
    df = flagged_df,
    meta = list(
      anl_vars = anl_vars,
      group_vars = group_vars,
      row_vars = row_vars,
      pop_flag_vars = pop_flag_vars,
      flag_columns = flag_columns,
      data_columns = data_columns,
      total_group_val = total_group_val,
      denom_df = denom_df,
      aggregate_flag = aggregate_flag,
      aggregate_func_name = aggregate_func_name
    )
  )

  return(summtab_list)
}


#' summtab_html_table
#'
#' @param summtab_list A list of the data frame of the analysed data and metadata from `summtab_compute()`.
#' @param on_cell_click A string holding the JavaScript callback function to be executed when a table cell is clicked.
#'
#' @return An HTML table generated using `shiny::tags` and formatted for interactive display.
#'
#' @keywords internal
summtab_html_table <- function(summtab_list, on_cell_click = NULL) {

  df <- summtab_list[["df"]]

  anl_vars <- summtab_list[["meta"]][["anl_vars"]]
  group_vars <- summtab_list[["meta"]][["group_vars"]]
  row_vars <- summtab_list[["meta"]][["row_vars"]]
  pop_flag_vars <- summtab_list[["meta"]][["pop_flag_vars"]]
  flag_columns <- summtab_list[["meta"]][["flag_columns"]]
  data_columns <- summtab_list[["meta"]][["data_columns"]]
  total_group_val <- summtab_list[["meta"]][["total_group_val"]]
  denom_df <- summtab_list[["meta"]][["denom_df"]]
  aggregate_flag <- summtab_list[["meta"]][["aggregate_flag"]]
  aggregate_func_name <- summtab_list[["meta"]][["aggregate_func_name"]]

  anl_var <- paste0(SUMMTAB$VAL$SPECIAL_CHAR, "anl_var")
  stat_col <- paste0(SUMMTAB$VAL$SPECIAL_CHAR, "stat")

  hierarchy <- c(anl_var, row_vars)

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
  internal_columns <- df_names[startsWith(df_names, SUMMTAB$VAL$SPECIAL_CHAR)]
  data_columns <- df_names[!df_names %in% c(row_vars, internal_columns)]

  # Prepare denominator look-up
  n_denominator <- denom_df[[".N"]]
  names(n_denominator) <- denom_df[[".lookup"]]

  entry_header <- ""

  split_data_columns <- strsplit(data_columns, split = SUMMTAB$VAL$SPECIAL_CHAR, fixed = TRUE)

  header_rows <- vector(mode = "list", length = length(group_vars))
  for (head_i in seq_along(group_vars)) {

    extracted_headers <- rle(purrr::map_chr(split_data_columns, ~ .x[head_i]))[["values"]]

    if (head_i != length(group_vars)) {
      data_headers <- purrr::map(extracted_headers, ~ shiny::span(.x))
      n_cols <- length(data_columns) / length(extracted_headers)
    } else {
      data_headers <- purrr::map2(extracted_headers,
                                  paste0("(N", "\u00A0", "=", "\u00A0", n_denominator[data_columns], ")"),
                                  ~ shiny::span(.x, shiny::br(), .y))
      n_cols <- NULL
    }

    header_rows[[head_i]] <- tr(
      thc(entry_header, entry = TRUE),
      purrr::map(data_headers, thc, colspan = n_cols)
    )
  }

  mod_group_vars <- setdiff(group_vars, ".pop_group")
  title <- sprintf(
    "Summary of %s%s%s%s",
    paste(anl_vars, collapse = ", "),
    ifelse(length(row_vars) == 0L, "", paste("; row by", paste(row_vars, collapse = ", "))),
    ifelse(length(mod_group_vars) == 0L, "", paste("; group by", paste(mod_group_vars, collapse = ", "))),
    ifelse(length(pop_flag_vars) == 0L, "", paste("; flag by", paste(pop_flag_vars, collapse = ", ")))
  )

  aggregate_note <- if (aggregate_flag) {
    shiny::p(paste("Note: Multiple results per subject per group, aggregated by", aggregate_func_name))
  } else {
    NULL
  }

  collapse_control <- shiny::icon("table", onclick = "ec_collapse(this)")

  empty_data_cells <- replicate(length(data_columns), td(), simplify = FALSE)

  body <- vector(mode = "list", length = nrow(df))
  for (r in seq_len(nrow(df))) {
    curr_row <- df[r, , drop = FALSE]

    # Initialise indentation to zero
    indent <- 0L

    hier_rows <- vector(mode = "list", length = length(hierarchy))
    for (hier_i in seq_along(hierarchy)) {
      hier_col <- hierarchy[hier_i]
      flag_col <- flag_columns[hier_i]

      if (curr_row[[flag_col]]) {
        indent_class <- sprintf("indent-%d", indent)

        hier_entry_cell <- td(shiny::span(
          collapse_control,
          curr_row[[hier_col]],
          class = "truncate",
          title = curr_row[[hier_col]]
        ))

        hier_classes <- if (indent == 0L) indent_class else c(indent_class, "bg-gray")

        hier_rows[[hier_i]] <- tr(
          class = hier_classes,
          indent = indent,
          hier_entry_cell,
          empty_data_cells
        )
      } else {
        hier_rows[[hier_i]] <- NULL
      }

      indent <- indent + 1L
    }

    entry_cell <- td(shiny::span(
      curr_row[[stat_col]],
      class = "truncate",
      title = curr_row[[stat_col]]
    ))

    data_cells <- purrr::imap(curr_row[data_columns], function(.col, .col_id) {
      tdc(.col[[1]][["stat"]], column = .col_id, onclick = on_cell_click, style = "white-space: nowrap;")
    })

    indent_class <- sprintf("indent-%d", indent)

    stat_row <- tr(
      "row-id" = r,
      class = indent_class,
      indent = indent,
      entry_cell,
      data_cells
    )

    body[[r]] <- shiny::tagList(
      !!!hier_rows,
      stat_row
    )
  }

  html_table <- shiny::div(
    shiny::p(title),
    aggregate_note,
    table(
      class = "table event-count",
      summary_table_dep(),
      !!!header_rows,
      !!!body
    )
  )

  return(html_table)
}

#' @keywords internal
summary_table_dep <- function() {
  htmltools::htmlDependency(
    name = "summary_table",
    version = "1.0",
    src = system.file("assets", package = "dv.tables", mustWork = TRUE),
    stylesheet = "css/summary_table.css",
    script = "js/hierarchical_count_table.js"
  )
}


#' UI for the summary table module
#'
#' @inheritParams mod_summary_table
#' @inheritParams summary_table_server
#'
#' @param choices_stats `[character(1+) | NULL]`
#'
#' A vector of strings from the names of the list elements from `summary_table_server()` arguments, `stats_formats` and
#' `stats_functions`, used as the choice of statistics for summarizing numerical data.
#'
#' @return A `shiny::tagList` containing the user interface for selecting hierarchy, group,
#' and minimum percentage for event counting.
#'
#' @keywords main
#'
#' @export
summary_table_ui <- function(module_id,
                             show_pop_flag_selection = FALSE,
                             default_pop_flags_after_groups = FALSE,
                             default_total = TRUE,
                             default_drop_na = FALSE,
                             default_drop_empty_rows = FALSE,
                             default_show_category_n = TRUE,
                             default_denom = "N",
                             default_stats = NULL,
                             default_aggregate_method = NULL,
                             choices_aggregate_method = c(Mean = "mean"),
                             choices_stats = NULL) {

  ns <- shiny::NS(module_id)

  # Initialize optional selections
  pop_flags <- NULL

  if (show_pop_flag_selection) {
    pop_flags <- shiny::div(
      shiny::tags$hr(),
      col_menu_UI(id = ns(SUMMTAB$ID$POP_FLAG_VARS)),
      shiny::checkboxInput(ns(SUMMTAB$ID$POP_FLAGS_AFTER_GROUPS),
                           label = SUMMTAB$LBL$POP_FLAGS_AFTER_GROUPS,
                           value = default_pop_flags_after_groups)
    )
  }

  drop_menu_cols <- shinyWidgets::dropMenu(
    tag = shiny::actionButton(
      inputId = ns(SUMMTAB$ID$COL_SELECTIONS),
      label = SUMMTAB$LBL$COL_SELECTIONS
    ),
    col_menu_UI(id = ns(SUMMTAB$ID$ANL_VARS)),
    col_menu_UI(id = ns(SUMMTAB$ID$GROUP_VARS)),
    col_menu_UI(id = ns(SUMMTAB$ID$ROW_VARS)),
    pop_flags
  )

  drop_menu_stats <- shinyWidgets::dropMenu(
    tag = shiny::actionButton(
      inputId = ns(SUMMTAB$ID$STATS_OPTIONS),
      label = SUMMTAB$LBL$STATS_OPTIONS
    ),
    shiny::checkboxGroupInput(ns(SUMMTAB$ID$STATS), label = SUMMTAB$LBL$STATS, choices = choices_stats, selected = default_stats)
  )

  drop_menu_opts <- shinyWidgets::dropMenu(
    tag = shiny::actionButton(
      inputId = ns(SUMMTAB$ID$TBL_OPTIONS),
      label = SUMMTAB$LBL$TBL_OPTIONS
    ),
    shiny::checkboxInput(ns(SUMMTAB$ID$TOTAL_FLAG), label = SUMMTAB$LBL$TOTAL_FLAG, value = default_total),
    shiny::checkboxInput(ns(SUMMTAB$ID$DROP_NA_FLAG), label = SUMMTAB$LBL$DROP_NA_FLAG, value = default_drop_na),
    shiny::checkboxInput(ns(SUMMTAB$ID$DROP_EMPTY_ROWS), label = SUMMTAB$LBL$DROP_EMPTY_ROWS, value = default_drop_empty_rows),
    shiny::checkboxInput(ns(SUMMTAB$ID$SHOW_CATEGORY_N), label = SUMMTAB$LBL$SHOW_CATEGORY_N, value = default_show_category_n),
    shiny::radioButtons(ns(SUMMTAB$ID$DENOM), label = SUMMTAB$LBL$DENOM, choices = c("N", "n"), selected = default_denom),
    shiny::radioButtons(ns(SUMMTAB$ID$AGGREGATE_METHOD), label = SUMMTAB$LBL$AGGREGATE_METHOD, choices = choices_aggregate_method, selected = default_aggregate_method)
  )

  ui <- shiny::tagList(
    shiny::div(drop_menu_cols, style = "display: inline-block;"),
    shiny::div(drop_menu_stats, style = "display: inline-block;"),
    shiny::div(drop_menu_opts, style = "display: inline-block;"),
    shiny::div(class = "summary_table", shiny::uiOutput(ns(SUMMTAB$ID$TBL_OUTPUT)))
  )

  return(ui)
}


#' Server logic for the summary table module
#'
#' @inheritParams mod_summary_table
#'
#' @param table_dataset `[data.frame]`
#'
#' A reactive dataset containing the data for analysis.
#'
#' @param pop_dataset `[data.frame]`
#'
#' A reactive dataset containing the population data.
#'
#' @param on_sbj_click_fun `[function]`
#'
#' Function to invoke when a subject is clicked.
#'
#' @inheritParams mod_summary_table
#'
#' @return A reactive value containing the list of subjects in the clicked cell, if applicable.
#'
#' @keywords main
#'
#' @export
summary_table_server <- function(module_id,
                                 table_dataset,
                                 pop_dataset,
                                 subjid_var,
                                 show_pop_flag_selection = FALSE,
                                 show_modal_on_click = TRUE,
                                 on_sbj_click_fun = function() NULL,

                                 stats_functions = NULL,
                                 stats_formats = NULL,
                                 stats_labels = NULL,
                                 stats_replace = NULL,

                                 default_summarize_on = NULL,
                                 default_group_by = NULL,
                                 default_row_by = NULL,
                                 default_pop_flags = NULL,
                                 choices_summarize_on = NULL,
                                 choices_group_by = NULL,
                                 choices_row_by = NULL,
                                 choices_pop_flags = NULL,
                                 total_group_val = "Total") {

  mod <- function(input, output, session) {

    ns <- session[["ns"]]

    inputs <- list()

    inputs[[SUMMTAB$ID$ANL_VARS]] <- col_menu_server(
      id = SUMMTAB$ID$ANL_VARS,
      data = table_dataset,
      label = SUMMTAB$LBL$ANL_VARS,
      include_func = function(var, var_name) {
        !inherits(var, "Date") && !inherits(var, "POSIXt") && var_name != subjid_var &&
          (is.null(choices_summarize_on) || var_name %in% choices_summarize_on)
      },
      default = default_summarize_on,
      multiple = TRUE,
      include_none = FALSE
    )

    inputs[[SUMMTAB$ID$GROUP_VARS]] <- col_menu_server(
      id = SUMMTAB$ID$GROUP_VARS,
      data = pop_dataset,
      label = SUMMTAB$LBL$GROUP_VARS,
      include_func = function(var, var_name) {
        (is.factor(var) || is.character(var)) &&
          var_name != subjid_var &&
          (is.null(choices_group_by) || var_name %in% choices_group_by)
      },
      default = default_group_by,
      multiple = TRUE,
      include_none = FALSE
    )

    inputs[[SUMMTAB$ID$ROW_VARS]] <- col_menu_server(
      id = SUMMTAB$ID$ROW_VARS,
      data = table_dataset,
      label = SUMMTAB$LBL$ROW_VARS,
      include_func = function(var, var_name) {
        (is.factor(var) || is.character(var)) &&
          var_name != subjid_var &&
          (is.null(choices_row_by) || var_name %in% choices_row_by)
      },
      default = default_row_by,
      multiple = TRUE,
      include_none = FALSE
    )

    if (show_pop_flag_selection) {
      inputs[[SUMMTAB$ID$POP_FLAG_VARS]] <- col_menu_server(
        id = SUMMTAB$ID$POP_FLAG_VARS,
        data = pop_dataset,
        label = SUMMTAB$LBL$POP_FLAG_VARS,
        include_func = function(var, var_name) {
          (is.factor(var) || is.character(var)) &&
            var_name != subjid_var &&
            ((is.null(choices_pop_flags) && grepl("FL([0-9]*)?$", var_name)) || var_name %in% choices_pop_flags)
        },
        default = default_pop_flags,
        multiple = TRUE,
        include_none = FALSE
      )

      inputs[[SUMMTAB$ID$POP_FLAGS_AFTER_GROUPS]] <- shiny::reactive(input[[SUMMTAB$ID$POP_FLAGS_AFTER_GROUPS]])
    }

    inputs[[SUMMTAB$ID$TOTAL_FLAG]] <- shiny::reactive(input[[SUMMTAB$ID$TOTAL_FLAG]])
    inputs[[SUMMTAB$ID$DROP_NA_FLAG]] <- shiny::reactive(input[[SUMMTAB$ID$DROP_NA_FLAG]])
    inputs[[SUMMTAB$ID$DROP_EMPTY_ROWS]] <- shiny::reactive(input[[SUMMTAB$ID$DROP_EMPTY_ROWS]])
    inputs[[SUMMTAB$ID$SHOW_CATEGORY_N]] <- shiny::reactive(input[[SUMMTAB$ID$SHOW_CATEGORY_N]])
    inputs[[SUMMTAB$ID$DENOM]] <- shiny::reactive(input[[SUMMTAB$ID$DENOM]])
    inputs[[SUMMTAB$ID$AGGREGATE_METHOD]] <- shiny::reactive(input[[SUMMTAB$ID$AGGREGATE_METHOD]])
    inputs[[SUMMTAB$ID$STATS]] <- shiny::reactive(input[[SUMMTAB$ID$STATS]])

    summtab <- shiny::reactive({

      anl_vars <- inputs[[SUMMTAB$ID$ANL_VARS]]()
      group_vars <- inputs[[SUMMTAB$ID$GROUP_VARS]]()
      row_vars <- inputs[[SUMMTAB$ID$ROW_VARS]]()

      total <- inputs[[SUMMTAB$ID$TOTAL_FLAG]]()
      drop_na <- inputs[[SUMMTAB$ID$DROP_NA_FLAG]]()
      drop_empty_rows <- inputs[[SUMMTAB$ID$DROP_EMPTY_ROWS]]()
      show_category_n <- inputs[[SUMMTAB$ID$SHOW_CATEGORY_N]]()
      denom <- inputs[[SUMMTAB$ID$DENOM]]()
      aggregate_func_name <- inputs[[SUMMTAB$ID$AGGREGATE_METHOD]]()

      choices_stats <- inputs[[SUMMTAB$ID$STATS]]()

      pop_df <- pop_dataset()
      tbl_df <- table_dataset()

      # Avoid an index error when a group var has been used as a population flag var
      pop_df_orig <- pop_df
      group_vars_orig <- group_vars

      selected_vars <- c(anl_vars, group_vars, row_vars)
      pop_flag_vars <- NULL

      if (show_pop_flag_selection) {
        pop_flag_vars <- inputs[[SUMMTAB$ID$POP_FLAG_VARS]]()
        pop_flags_after_groups <- inputs[[SUMMTAB$ID$POP_FLAGS_AFTER_GROUPS]]()

        if (!is.null(pop_flag_vars) && length(pop_flag_vars) > 0) {

          pop_df <- pop_df |>
            tidyr::pivot_longer(
              tidyr::all_of(pop_flag_vars),
              names_to = ".pop_group",
              values_to = ".pop_flag"
            ) |>
            dplyr::mutate(.pop_group = factor(.data[[".pop_group"]],
                                              levels = pop_flag_vars,
                                              labels = get_lbls_robust(pop_df)[pop_flag_vars])) |>
            dplyr::filter(.data[[".pop_flag"]] == "Y") |>
            dplyr::relocate(dplyr::starts_with(".pop"))

          attr(pop_df[[".pop_group"]], "label") <- "Population Flag Group"
          attr(pop_df[[".pop_flag"]], "label") <- "Population Flag"

          group_vars <- if (pop_flags_after_groups) c(group_vars, ".pop_group") else c(".pop_group", group_vars)
          selected_vars <- c(selected_vars, pop_flag_vars)
        }
      }

      shiny::validate(
        shiny::need(
          checkmate::test_data_frame(tbl_df, min.rows = 1L),
          SUMMTAB$VALIDATE$NO_TABLE_ROWS
        ),
        shiny::need(
          checkmate::test_data_frame(pop_df, min.rows = 1L),
          SUMMTAB$VALIDATE$NO_POP_ROWS
        ),
        shiny::need(
          checkmate::test_character(anl_vars, min.chars = 1L, min.len = 1L, max.len = NULL),
          SUMMTAB$VALIDATE$NO_ANL_VARS
        ),
        shiny::need(
          checkmate::test_character(group_vars, min.chars = 1L, min.len = 1L, max.len = NULL),
          SUMMTAB$VALIDATE$NO_GROUP_VARS
        ),
        shiny::need(
          checkmate::test_character(row_vars, min.chars = 1L, min.len = 0L, max.len = 8L),
          SUMMTAB$VALIDATE$TOO_MANY_ROW_VARS
        ),
        shiny::need(
          checkmate::test_set_equal(selected_vars, unique(selected_vars), ordered = TRUE),
          SUMMTAB$VALIDATE$VAR_OVERLAP
        ),
        shiny::need(
          all(sapply(tbl_df[anl_vars], \(x) !is.numeric(x))) ||
            checkmate::test_character(choices_stats, min.chars = 1L, min.len = 1L, max.len = NULL),
          SUMMTAB$VALIDATE$NO_STATS
        ),
        shiny::need(
          !anyDuplicated(pop_df_orig[c(subjid_var, group_vars_orig)]),
          SUMMTAB$VALIDATE$POP_GROUP_DUP
        )
      )

      # Subset stats formats on chosen stats
      stats_formats_subset <- stats_formats[intersect(choices_stats, names(stats_formats))]

      # Extract function names from formats
      choices_fmt_stats <- stats_formats_subset |>
        lapply(\(sublist) sublist[-1]) |>
        unlist(use.names = FALSE) |>
        sub("\\.[0-9]+$", "", x = _) |>
        unique()

      choices_unfmt_stats <- setdiff(choices_stats, names(stats_formats_subset))
      stats_functions_subset <- stats_functions[c(choices_fmt_stats, choices_unfmt_stats)]

      # Show a progress bar for the remainder of the execution of this reactive
      # This bar does not really progress; it just disappears once we're through
      p <- shiny::Progress$new(session = session)
      on.exit(p$close())
      p$set(message = "1) Processing data", value = 0.50)

      summary_table <- summtab_compute(tbl_df,
                                       pop_df,
                                       anl_vars = anl_vars,
                                       group_vars = group_vars,
                                       row_vars = row_vars,
                                       pop_flag_vars = pop_flag_vars,
                                       subjid_var = subjid_var,

                                       stats_functions = stats_functions_subset,
                                       stats_formats = stats_formats_subset,
                                       stats_labels = stats_labels,
                                       stats_replace = stats_replace,

                                       total = total,
                                       total_group_val = total_group_val,
                                       drop_na = drop_na,
                                       drop_empty_rows = drop_empty_rows,
                                       show_category_n = show_category_n,
                                       denom = denom,
                                       aggregate_func_name = aggregate_func_name)

      summary_table
    })

    render_completion_callback <- shiny::tags$script(shiny::HTML(sprintf("
    requestAnimationFrame(() => { // repaint preceding the table render
      requestAnimationFrame(() => { // repaint following the table render
        Shiny.setInputValue('%s', 'done', {priority: 'event'});
      });
    });
    ", ns(SUMMTAB$ID$RENDER_COMPLETION_CALLBACK))))

    table_progress_bars <- list() # keep a list of progress bars to cope with trigger-happy users

    shiny::observeEvent(input[[SUMMTAB$ID$RENDER_COMPLETION_CALLBACK]], {
      for (p in table_progress_bars) p$close()
      table_progress_bars <<- list()
    })

    output[[SUMMTAB$ID$TBL_OUTPUT]] <- shiny::renderUI({

      on_cell_click <- sprintf("Shiny.setInputValue('%s', {row_id: Number(this.closest('tr').getAttribute('row-id')), column: this.getAttribute('column')}, {priority: 'event'})", ns("cell_click")) # nolint

      summtab <- summtab()

      # Start a progress bar and leave its cleanup to the `input[[SUMMTAB$ID$RENDER_COMPLETION_CALLBACK]]` observer
      p <- shiny::Progress$new(session = session)
      table_progress_bars[[length(table_progress_bars) + 1L]] <<- p
      on.exit(p$inc(amount = 0.3))
      p$set(message = "2) Generating & Rendering Table", value = 0.2)

      rendered_content <- summtab_html_table(summtab, on_cell_click)

      shiny::tagList(rendered_content, render_completion_callback)
    })

    if (show_modal_on_click) {
      shiny::observeEvent(input[["cell_click"]], {
        row <- input[["cell_click"]][["row_id"]]
        col <- input[["cell_click"]][["column"]]

        subj_ids <- summtab()[["df"]][[col]][[row]][["subjid"]]

        # Only run when subjects defined in the cell
        if (length(subj_ids) > 0L) {

          # Ensure that non-breaking spaces are converted back to ordinary spaces
          subj_ids <- gsub("\u00A0", " ", subj_ids)

          id_elements <- vector(mode = "list", length = (length(subj_ids) * 2L) - 1L)
          for (idx in seq_along(subj_ids)) {
            link_idx <- (idx * 2L) - 1L
            comma_idx <- link_idx + 1L
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
      shiny::req(checkmate::test_string(input[["clicked_sbj"]], na.ok = FALSE, min.chars = 1L, null.ok = FALSE))
      shiny::removeModal()
      on_sbj_click_fun()
    })

    res <- list(
      subj_id = shiny::reactive({
        shiny::req(checkmate::test_string(input[["clicked_sbj"]], na.ok = FALSE, min.chars = 1L, null.ok = FALSE))
        input[["clicked_sbj"]]
      })
    )

    if (isTRUE(getOption("shiny.testmode"))) do.call(shiny::exportTestValues, as.list(environment()))

    res
  }

  shiny::moduleServer(id = module_id, module = mod)
}


#' Summary Table Module
#'
#' @param module_id `[character(1)]`
#'
#' A string that serves as a unique identifier for the module.
#'
#' @param table_dataset_name `[character(1)]`
#'
#' The name of the analysis dataset to be summarized. This can be the same as the population dataset.
#'
#' @param pop_dataset_name `[character(1)]`
#'
#' The name of the population dataset. Typically this will have one row per subject, but multiple rows per subject is
#' also valid for summarizing data where a subject may appear in more than one grouping, e.g. for crossover trials
#' where a subject can take different treatments in different phases, or for population flag summaries (pre-processing
#' of CDISC subject-level data would be required to transpose the flags to a grouping column).
#'
#' @param subjid_var `[character(1)]`
#'
#' A string representing the subject identifier column in both datasets.
#'
#' @param show_pop_flag_selection `[logical(1)]`
#'
#' A flag to indicate whether to show the population flag selection. Other associated arguments are `default_pop_flags`
#' and `choices_pop_flags`.
#'
#' @param show_modal_on_click `[logical(1)]`
#'
#' A flag to indicate whether clicking a table cell should display a modal dialog with the subject IDs.
#'
#' @param stats_functions `[list(1+) | NULL]`
#'
#' A named list defining the functions used for summarizing numerical data. The functions must either return a single
#' numeric value (e.g. `mean`, `stats::sd`, etc.) or a vector of numeric values (e.g. `\(x) stats::quantile(x, c(0.25, 0.75))`).
#' Note that the functions will not be applied to empty groupings, but if a function requires more than one data point
#' (e.g. `stats::t.test`) then the error cases must be dealt with using a wrapper function; see module documentation for
#' further information.
#'
#' @param stats_formats `[list(1+) | NULL]`
#'
#' A named list of lists defining the combination and formatting of the function results from summarizing numerical data.
#' Each element lists the argument values passed to `sprintf`, the result being assigned to the element name (internally
#' corresponding to an interim results data frame column name). The names from the list elements of `stats_functions`
#' correspond to column names that can be used in the `sprintf` arguments, but note that if a function returns more than
#' one value, those values must be referred to using a dot followed by an integer suffix, e.g. if the function named
#' `meanci` returns two values then use `"meanci.1"`, and `"meanci.2"`. The name of each element list should be a
#' keyword conveying the meaning of the combined statistics, e.g. `minmax` for the minimum to maximum range. The name
#' can also be the same as the name from `stats_functions`, e.g. `meanci` for the mean confidence interval.
#'
#' Any results from functions given in `stats_functions` that do not appear in the formatting will be automatically
#' formatted as character.
#'
#' @param stats_labels `[list(1+) | NULL]`
#'
#' A named vector of statistics labels that should be used in the summary table. The names correspond to the names
#' assigned in the `stats_formats` list, or otherwise the names in the `stats_functions` list.
#'
#' Labels apply to UI statistics checkbox labels and table statistics labels. Note that if a function defined in
#' `stats_functions` returns more than one value, e.g. `stats::quantile`, and those values are not combined in
#' `stats_formats`, then they appear separately in the table statistics, but the UI statistics checkbox will reflect the
#' name given to the function definition. Labels can be applied to both cases; see module documentation for
#' further information.
#'
#' @param stats_replace `[list(1+) | NULL]`
#'
#' A named list of named vectors defining replacements that should be applied to the formatted results from
#' `stats_formats`. The names given to the vector elements are regular expressions to match the formatted results, and
#' the elements themselves are the replacement strings. The names of the list elements should match the names of the
#' list elements in `stats_formats`.
#'
#' @param default_summarize_on `[character(1+) | NULL]`
#'
#' A vector of variable names from the analysis dataset, used as the default for selected variables to summarize on
#' (optional).
#'
#' @param default_group_by `[character(1+) | NULL]`
#'
#' A vector of variable names from the population dataset, used as the default for selected variables to group by
#' (optional).
#'
#' @param default_row_by `[character(1+) | NULL]`
#'
#' A vector of variable names from the dataset specified by `table_dataset_name`, used as the default for selected
#' variables to categorize on (optional).
#'
#' @param default_total `[logical(1)]`
#'
#' A flag specifying the default value for the checkbox that determines whether to add a total group column.
#'
#' @param default_drop_na `[logical(1)]`
#'
#' A flag specifying the default value for the checkbox that determines whether to drop NA values from selected
#' 'group by' and 'row by' variables.
#'
#' @param default_drop_empty_rows `[logical(1)]`
#'
#' A flag specifying the default value for the checkbox that determines whether to remove rows with no data from the
#' analysis results.
#'
#' @param default_show_category_n `[logical(1)]`
#'
#' A flag specifying the default value for the checkbox that determines whether to show the 'n' category when
#' summarizing categorical data.
#'
#' @param default_denom `["N" | "n"]`
#'
#' A string, either "N" or "n", indicating the default of whether the denominator for categorical data should be taken
#' as the number of subjects from the population grouping ("N") or the number of subjects from the 'row by' grouping for
#' each population grouping ("n"). If the user selects to drop `NA` values then those values will be excluded from
#' determining the "n" denominator.
#'
#' @param default_stats `[character(1+) | NULL]`
#'
#' A vector of strings from the names of the list elements in `stats_formats` or `stats_functions`, used as the default
#' selection of statistics for summarizing numerical data.
#'
#' @param default_aggregate_method `[character(1)]`
#'
#' A string indicating the name of the function to use as the default for aggregating rows when more than one row per
#' subject exists after population grouping and row categorization has been applied. The function is applied to the
#' analysis variable. The double colon (`::`) namespace resolution operator can be used to specify a function from a
#' specific package, e.g., `"dplyr::first"`.
#'
#' @param default_pop_flags `[character(1+) | NULL]`
#'
#' A vector of variable names from the population dataset, used as the default for selected population flag variables
#' (optional).
#'
#' @param default_pop_flags_after_groups `[logical(1)]`
#'
#' A flag specifying the default value for the checkbox that determines whether to show the population flags after the
#' group variables.
#'
#' @param choices_summarize_on `[character(1+) | NULL]`
#'
#' A vector of variable names from the analysis dataset, specifying the possible choices for the variables to summarize
#' on (optional). If it is not specified then all variables from the analysis dataset, excluding `Date` and `POSIXt`
#' class variables, will be used.
#'
#' @param choices_group_by `[character(1+) | NULL]`
#'
#' A vector of variable names from the population dataset, specifying the possible choices for the variables to group by
#' (optional). If it is not specified then all factor and character variables from the population dataset will be used.
#'
#' @param choices_row_by `[character(1+) | NULL]`
#'
#' A vector of variable names from the analysis dataset, specifying the possible choices for the variables to categorize
#' on (optional). If it is not specified then all factor and character variables from the analysis dataset will be used.
#'
#' @param choices_aggregate_method `[character(1+) | NULL]`
#'
#' A vector of named strings indicating the names of functions that can be used for aggregating rows when more than one
#' row per subject exists after population grouping and row categorization has been applied. The double colon (`::`)
#' namespace resolution operator can be used to specify functions from specific packages, e.g., `"dplyr::first"`. The
#' names are displayed in the UI radio button selections.
#'
#' @param choices_pop_flags `[character(1+) | NULL]`
#'
#' A vector of variable names from the population dataset, specifying the possible choices for the population flag
#' variables (optional). If it is not specified then all factor and character variables from the population dataset will
#' be used.
#'
#' @param total_group_val `[character(1)]`
#'
#' A string indicating the label for the total group column.
#'
#' @param receiver_id `[character(1) | NULL]`
#'
#' Unique identifier for the module receiving the selected subject ID in the data listing. This ID must be present in
#' the app or be NULL.
#'
#' @return A list containing the following elements to be used by the \pkg{dv.manager}:
#' \itemize{
#'   \item{`ui`}: Shiny module UI function.
#'   \item{`server`}: Shiny module server function.
#'   \item{`module_id`}: Shiny module unique identifier.
#' }
#'
#' @keywords main
#' @export
mod_summary_table <- function(
    module_id,
    table_dataset_name,
    pop_dataset_name,
    subjid_var = "USUBJID",
    show_pop_flag_selection = FALSE,
    show_modal_on_click = TRUE,

    stats_functions = list(
      n = length,
      mean = mean,
      sd = stats::sd,
      meanci = \(x) if (length(x) > 1L) stats::t.test(x, conf.level = 0.95)$conf.int else rep(NA_real_, 2L),
      geomean = \(x) if (all(x > 0)) exp(mean(log(x))) else NaN,
      median = stats::median,
      medianci = \(x) if (length(x) > 1L) stats::wilcox.test(x, exact = FALSE, conf.int = TRUE, conf.level = 0.95)$conf.int else rep(NA_real_, 2L),
      q1q3 = \(x) stats::quantile(x, c(0.25, 0.75)),
      min = min,
      max = max
    ),
    stats_formats = list(
      n = list(fmt = "%d", "n"),
      meansd = list(fmt = "%.1f (%.1f)", "mean", "sd"),
      meanci = list(fmt = "(%.2f, %.2f)", "meanci.1", "meanci.2"),
      geomean = list(fmt = "%.1f", "geomean"),
      median = list(fmt = "%.1f", "median"),
      medianci = list(fmt = "(%.2f, %.2f)", "medianci.1", "medianci.2"),
      q1q3 = list(fmt = "%.1f - %.1f", "q1q3.1", "q1q3.2"),
      minmax = list(fmt = "%.1f - %.1f", "min", "max")
    ),
    stats_labels = c(
      n = "n",
      meansd = "Mean (SD)",
      meanci = "Mean 95% CI",
      geomean = "Geometric Mean",
      median = "Median",
      medianci = "Median 95% CI",
      q1q3 = "25% and 75%-ile",
      minmax = "Min - Max"
    ),
    stats_replace = list(
      n = c(`^NA$` = "0"),
      meansd = c(`^NA \\(NA\\)$` = SUMMTAB$VAL$EM_DASH,
                 `\\(NA\\)$` = sprintf("(%s)", SUMMTAB$VAL$EM_DASH)),
      meanci = c(`^\\(NA, NA\\)$` = SUMMTAB$VAL$EM_DASH),
      geomean = c(`^NA$` = SUMMTAB$VAL$EM_DASH,
                  `^NaN$` = "NE"),
      median = c(`^NA$` = SUMMTAB$VAL$EM_DASH),
      medianci = c(`^\\(NA, NA\\)$` = SUMMTAB$VAL$EM_DASH),
      q1q3 = c(`^NA - NA$` = SUMMTAB$VAL$EM_DASH),
      minmax = c(`^NA - NA$` = SUMMTAB$VAL$EM_DASH)
    ),

    default_summarize_on = NULL,
    default_group_by = NULL,
    default_row_by = NULL,
    default_total = TRUE,
    default_drop_na = FALSE,
    default_drop_empty_rows = FALSE,
    default_show_category_n = TRUE,
    default_denom = "N",
    default_stats = c("n", "meansd", "minmax"),
    default_aggregate_method = NULL,
    default_pop_flags = NULL,
    default_pop_flags_after_groups = FALSE,

    choices_summarize_on = NULL,
    choices_group_by = NULL,
    choices_row_by = NULL,
    choices_aggregate_method = c(Mean = "mean",
                                 Minimum = "min",
                                 Maximum = "max",
                                 "First Row" = "dplyr::first",
                                 "Last Row" = "dplyr::last"),
    choices_pop_flags = NULL,
    total_group_val = "Total",
    receiver_id = NULL
) {

  # Check validity of arguments that were not checked by Early Error Feedback
  ac <- checkmate::makeAssertCollection()
  checkmate::assert_logical(show_pop_flag_selection, add = ac)
  checkmate::assert_logical(show_modal_on_click, add = ac)
  checkmate::assert_list(stats_functions, types = "function", any.missing = FALSE, names = "unique", null.ok = TRUE, add = ac)
  checkmate::assert_list(stats_formats, types = "list", names = "unique", null.ok = TRUE, add = ac)
  checkmate::assert_character(stats_labels, min.chars = 1L, any.missing = FALSE, names = "unique", null.ok = TRUE, add = ac)
  checkmate::assert_list(stats_replace, types = "character", names = "unique", null.ok = TRUE, add = ac)
  checkmate::assert_logical(default_total, add = ac)
  checkmate::assert_logical(default_drop_na, add = ac)
  checkmate::assert_logical(default_show_category_n, add = ac)
  checkmate::assert_string(default_denom, add = ac)
  checkmate::assert_subset(default_denom, c("N", "n"), add = ac)
  checkmate::assert_character(default_stats, min.chars = 1L, null.ok = TRUE, add = ac)
  checkmate::assert_string(default_aggregate_method, min.chars = 1L, null.ok = TRUE, add = ac)
  checkmate::assert_logical(default_pop_flags_after_groups, add = ac)
  checkmate::assert_character(choices_aggregate_method, min.chars = 1L, any.missing = FALSE, names = "unique", null.ok = TRUE, add = ac)
  checkmate::assert_string(total_group_val, add = ac)
  checkmate::assert_string(receiver_id, min.chars = 1L, null.ok = TRUE, add = ac)
  checkmate::reportAssertions(ac)

  if (!is.null(stats_functions) && length(stats_functions) > 0) {

    if (!is.null(stats_formats) && length(stats_formats) > 0) {

      # Names of functions used by formats
      fmt_func_names <- stats_formats |>
        lapply(\(sublist) unlist(sublist[-1])) |>
        lapply(\(x) sub("\\.[0-9]+$", "", x))

      # Valid formats (all functions defined in `stats_functions`)
      fmt_match <- fmt_func_names |>
        sapply(\(x) all(x %in% names(stats_functions)))

      # Names of functions used by valid formats
      fmt_func_names_subset <- unlist(fmt_func_names[fmt_match], use.names = FALSE)

      # Names of functions that have not been formatted
      unfmt_func_names <- setdiff(names(stats_functions), fmt_func_names_subset)

      # Names of valid formats
      valid_fmt_names <- names(stats_formats)[fmt_match]

      # Final choices from valid format names and unformatted functions
      choices_stats <- c(valid_fmt_names, unfmt_func_names)
    } else {
      # All statistics functions unformatted
      choices_stats <- names(stats_functions)
    }

    stats_choices_labels <- ifelse(
      choices_stats %in% names(stats_labels),
      stats_labels[choices_stats],
      choices_stats
    )

    names(choices_stats) <- stats_choices_labels
  } else {
    choices_stats <- NULL
  }

  mod <- list(
    ui = function(module_id) {
      summary_table_ui(module_id,
                       show_pop_flag_selection = show_pop_flag_selection,
                       default_pop_flags_after_groups = default_pop_flags_after_groups,
                       default_total = default_total,
                       default_drop_na = default_drop_na,
                       default_drop_empty_rows = default_drop_empty_rows,
                       default_show_category_n = default_show_category_n,
                       default_denom = default_denom,
                       default_aggregate_method = default_aggregate_method,
                       default_stats = default_stats,
                       choices_aggregate_method = choices_aggregate_method,
                       choices_stats = choices_stats)
    },
    server = function(afmm) {

      if (is.null(receiver_id)) {
        on_sbj_click_fun <- function() NULL
      } else {
        on_sbj_click_fun <- function() {
          afmm[["utils"]][["switch2mod"]](receiver_id)
        }
      }

      summary_table_server(module_id,
                           table_dataset = shiny::reactive(afmm[["filtered_dataset"]]()[[table_dataset_name]]),
                           pop_dataset = shiny::reactive(afmm[["filtered_dataset"]]()[[pop_dataset_name]]),
                           subjid_var = subjid_var,
                           show_pop_flag_selection = show_pop_flag_selection,
                           show_modal_on_click = show_modal_on_click,
                           on_sbj_click_fun = on_sbj_click_fun,

                           stats_functions = stats_functions,
                           stats_formats = stats_formats,
                           stats_labels = stats_labels,
                           stats_replace = stats_replace,

                           default_summarize_on = default_summarize_on,
                           default_group_by = default_group_by,
                           default_row_by = default_row_by,
                           default_pop_flags = default_pop_flags,
                           choices_summarize_on = choices_summarize_on,
                           choices_group_by = choices_group_by,
                           choices_row_by = choices_row_by,
                           choices_pop_flags = choices_pop_flags,
                           total_group_val = total_group_val)
    },
    module_id = module_id
  )

  return(mod)
}


# Summary table module interface ----

# TODO: Fill in
mod_summary_table_API_docs <- list(
  "Summary table",
  module_id = "",
  table_dataset_name = "",
  pop_dataset_name = "",
  subjid_var = "",
  show_pop_flag_selection = "",
  show_modal_on_click = "",
  stats_functions = "",
  stats_formats = "",
  stats_labels = "",
  stats_replace = "",
  default_summarize_on = "",
  default_group_by = "",
  default_row_by = "",
  default_total = "",
  default_drop_na = "",
  default_drop_empty_rows = "",
  default_show_category_n = "",
  default_denom = "",
  default_stats = "",
  default_aggregate_method = "",
  default_pop_flags = "",
  default_pop_flags_after_groups = "",
  choices_summarize_on = "",
  choices_group_by = "",
  choices_row_by = "",
  choices_aggregate_method = "",
  choices_pop_flags = "",
  total_group_val = "",
  receiver_id = ""
)

mod_summary_table_API_spec <- TC$group(
  module_id = TC$mod_ID(),
  table_dataset_name = TC$dataset_name(),
  pop_dataset_name = TC$dataset_name(),
  subjid_var = TC$col("pop_dataset_name", TC$factor()) |> TC$flag("subjid_var"),
  show_pop_flag_selection = TC$logical(),
  show_modal_on_click = TC$logical(),
  stats_functions = TC$character() |> TC$flag("ignore"),
  stats_formats = TC$character() |> TC$flag("ignore"),
  stats_labels = TC$character(),
  stats_replace = TC$character() |> TC$flag("ignore"),
  default_summarize_on = TC$col("table_dataset_name", TC$or(TC$numeric(), TC$integer(), TC$character(), TC$factor())) |>
    TC$flag("one_or_more", "optional"),
  default_group_by = TC$col("pop_dataset_name", TC$or(TC$character(), TC$factor())) |>
    TC$flag("one_or_more", "optional"),
  default_row_by = TC$col("table_dataset_name", TC$or(TC$character(), TC$factor())) |>
    TC$flag("one_or_more", "optional"),
  default_total = TC$logical(),
  default_drop_na = TC$logical(),
  default_drop_empty_rows = TC$logical(),
  default_show_category_n = TC$logical(),
  default_denom = TC$character(),
  default_stats = TC$character(),
  default_aggregate_method = TC$character(),
  default_pop_flags = TC$col("pop_dataset_name", TC$or(TC$character(), TC$factor())) |>
    TC$flag("one_or_more", "optional"),
  default_pop_flags_after_groups = TC$logical(),
  choices_summarize_on = TC$col("table_dataset_name", TC$or(TC$numeric(), TC$integer(), TC$character(), TC$factor())) |>
    TC$flag("one_or_more", "optional"),
  choices_group_by = TC$col("pop_dataset_name", TC$or(TC$character(), TC$factor())) |>
    TC$flag("one_or_more", "optional"),
  choices_row_by = TC$col("table_dataset_name", TC$or(TC$character(), TC$factor())) |>
    TC$flag("one_or_more", "optional"),
  choices_aggregate_method = TC$character(),
  choices_pop_flags = TC$col("pop_dataset_name", TC$or(TC$character(), TC$factor())) |>
    TC$flag("one_or_more", "optional"),
  total_group_val = TC$character(),
  receiver_id = TC$character() |> TC$flag("optional")
) |> TC$attach_docs(mod_summary_table_API_docs)

check_mod_summary_table <- function(
    afmm, datasets,
    module_id, table_dataset_name, pop_dataset_name, subjid_var, show_pop_flag_selection, show_modal_on_click,
    stats_functions, stats_formats, stats_labels, stats_replace,
    default_summarize_on, default_group_by, default_row_by, default_total, default_drop_na, default_drop_empty_rows,
    default_show_category_n, default_denom, default_stats, default_aggregate_method, default_pop_flags, default_pop_flags_after_groups,
    choices_summarize_on, choices_group_by, choices_row_by, choices_aggregate_method, choices_pop_flags,
    total_group_val, receiver_id
) {
  err <- CM$container()

  # TODO: Replace this function with a generic one that performs the checks based on mod_hierarchical_count_API_spec.
  # Something along the lines of OK <- CM$check_API(mod_hierarchical_count_API_spec, args = match.call(), err)

  OK <- check_mod_summary_table_auto( # nolint unused
    afmm, datasets,
    module_id, table_dataset_name, pop_dataset_name, subjid_var, show_pop_flag_selection, show_modal_on_click,
    stats_functions, stats_formats, stats_labels, stats_replace,
    default_summarize_on, default_group_by, default_row_by, default_total, default_drop_na, default_drop_empty_rows,
    default_show_category_n, default_denom, default_stats, default_aggregate_method, default_pop_flags, default_pop_flags_after_groups,
    choices_summarize_on, choices_group_by, choices_row_by, choices_aggregate_method, choices_pop_flags,
    total_group_val, receiver_id,
    err
  )

  res <- list(errors = err[["messages"]])
  return(res)
}

dataset_info_summary_table <- function(table_dataset_name, pop_dataset_name, ...) {
  # TODO: Replace this function with a generic one that builds the list based on mod_boxplot_API_spec.
  # Something along the lines of CM$dataset_info(mod_hierarchical_count_table_API_spec, args = match.call())
  all <- unique(c(table_dataset_name, pop_dataset_name))
  subject_level <- pop_dataset_name
  if (length(subject_level) == 0) subject_level <- character(0)

  return(list(all = all, subject_level = subject_level))
}

mod_summary_table <- CM$module(mod_summary_table, check_mod_summary_table, dataset_info_summary_table)


# Summary table mock apps ----

#' Mock summary table app
#'
#' @param dry_run Return parameters used in the call
#' @param update_query_string automatically update query string with app state
#' @param ui_defaults,srv_defaults a list of values passed to the ui/server function
#'
#' @keywords mock
#' @export
mock_app_summary_table <- function(dry_run = FALSE,
                                   update_query_string = TRUE,
                                   srv_defaults = list(),
                                   ui_defaults = list()) {

  if (!requireNamespace("pharmaverseadam")) {
    stop("Install pharmaverseadam")
  }
  table_dataset <- shiny::reactive({
    pharmaverseadam::adlb |>
      dplyr::filter(.data[["LBTESTCD"]] %in% c("ALP", "ALT", "AST", "BILI"),
                    .data[["AVISITN"]] %in% c(0, 4, 5, 7)) |>
      chr2factor()
  })

  pop_dataset <- shiny::reactive({
    pharmaverseadam::adsl |> chr2factor()
  })

  ui_params <- c(
    list(
      module_id = "mod"
    ),
    ui_defaults
  )

  srv_params <- c(
    list(
      module_id = "mod",
      table_dataset = table_dataset,
      pop_dataset = pop_dataset,
      subjid_var = "USUBJID"
    ),
    srv_defaults
  )

  if (dry_run) {
    return(list(ui = ui_params, srv = srv_params))
  }

  mock_app_wrap(
    update_query_string = update_query_string,
    ui = function() do.call(summary_table_ui, ui_params),
    server = function() do.call(summary_table_server, srv_params)
  )
}

#' Mock summary table app integrated in the `{dv.manager}` module manager framework
#'
#' @keywords mock
#' @export
mock_app_summary_table_mm <- function() {

  adsl <- pharmaverseadam::adsl |>
    dplyr::mutate(ENRLFL = "Y",
                  TRTFL = ifelse(is.na(TRTSDT), "N", "Y"),
                  RANDFL = ifelse(is.na(RANDDT), "N", "Y"),
                  DISCFL = ifelse(EOSSTT == "DISCONTINUED", "Y", "N"))

  adsl[["COUNTRY"]] <- ifelse(as.numeric(adsl[["SITEID"]]) < 715, adsl[["COUNTRY"]], "Canada")

  attr(adsl, "meta") <- base::file.info("NEWS.md")
  attr(adsl[["ENRLFL"]], "label") <- "Enrolled Flag"
  attr(adsl[["RANDFL"]], "label") <- "Randomized Flag"
  attr(adsl[["TRTFL"]], "label") <- "Treated Flag"
  attr(adsl[["DISCFL"]], "label") <- "Discontinued Flag"

  adlb <- pharmaverseadam::adlb |>
    dplyr::filter(.data[["LBTESTCD"]] %in% c("ALP", "ALT", "AST", "BILI"),
                  .data[["AVISITN"]] %in% c(0, 4, 5, 7))

  attr(adlb, "meta") <- base::file.info("NEWS.md")

  dv.manager::run_app(
    data = list(
      pharmaverseadam = list(adsl = adsl, adlb = adlb)
    ),
    module_list = list(
      "Demography Summary" = mod_summary_table(
        module_id = "dm_summtab",
        table_dataset_name = "adsl",
        pop_dataset_name = "adsl",
        default_summarize_on = c("AGE", "SEX", "RACE"),
        default_group_by = c("TRT01P"),
        default_row_by = NULL,
        receiver_id = "papo"
      ),
      "Disposition Summary" = mod_summary_table(
        module_id = "ds_summtab",
        table_dataset_name = "adsl",
        pop_dataset_name = "adsl",
        default_summarize_on = c("EOSSTT", "DTHCAUS", "SAFFL"),
        default_group_by = c("TRT01P"),
        default_row_by = NULL,
        default_drop_na = TRUE,
        receiver_id = "papo"
      ),
      "Lab Summary" = mod_summary_table(
        module_id = "lb_summtab",
        table_dataset_name = "adlb",
        pop_dataset_name = "adsl",
        default_summarize_on = c("AVAL", "CHG", "ATOXGR"),
        default_group_by = c("TRT01P", "SEX"),
        default_row_by = c("PARAM", "AVISIT"),
        default_denom = "n",
        receiver_id = "papo"
      ),
      "Population Summary" = mod_summary_table(
        module_id = "pop_summtab",
        show_pop_flag_selection = TRUE,
        table_dataset_name = "adsl",
        pop_dataset_name = "adsl",
        default_summarize_on = c("SITEID"),
        default_group_by = NULL,
        default_row_by = c("COUNTRY"),
        default_total = FALSE,
        default_drop_na = TRUE,
        default_drop_empty_rows = TRUE,
        default_show_category_n = FALSE,
        default_pop_flags = c("ENRLFL", "RANDFL", "TRTFL", "DISCFL"),
        default_pop_flags_after_groups = FALSE,
        receiver_id = "papo"
      ),
      "Patient Profile" = dv.papo::mod_patient_profile(
        module_id = "papo",
        subject_level_dataset_name = "adsl",
        subjid_var = "USUBJID",
        sender_ids = c("dm_summtab", "ds_summtab", "lb_summtab", "pop_summtab"),
        summary = list(vars = c("AGE", "SEX", "RACE", "ETHNIC", "ARM"),
                       column_count = 1)
      )
    ),
    filter_data = "adsl",
    filter_key = "USUBJID",
    enableBookmarking = "url"
  )

}
