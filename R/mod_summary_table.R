SUMMTAB <- poc(
  ID = poc(
    TBL_OPTIONS = "tbl_options",
    STATS_OPTIONS = "stats_options",
    COL_SELECTIONS = "col_selections",
    ANL_VARS = "anl_vars",
    GROUP_VARS = "group_vars",
    ROW_VARS = "row_vars",
    TOTAL_FLAG = "total",
    DROP_NA_FLAG = "drop_na",
    SHOW_CATEGORY_N = "show_category_n",
    DENOM = "denom",
    COLLAPSE_METHOD = "collapse_method",
    STATS = "stats",
    TBL_OUTPUT = "table_output"
  ),
  LBL = poc(
    TBL_OPTIONS = "Table Options",
    STATS_OPTIONS = "Statistics",
    COL_SELECTIONS = "Column Selection",
    ANL_VARS = "Summarize on:",
    GROUP_VARS = "Group by:",
    ROW_VARS = "Row by:",
    TOTAL_FLAG = "Total column",
    DROP_NA_FLAG = "Drop NA values",
    SHOW_CATEGORY_N = "Show categorical n",
    DENOM = "Denominator:",
    COLLAPSE_METHOD = "Row Collapse Method:",
    STATS = "Statistics:"
  ),
  VALIDATE = poc(
    NO_TABLE_ROWS = "Table dataset has 0 rows",
    NO_POP_ROWS = "Population dataset has 0 rows",
    NO_ANL_VARS = "No variables selected to summarize on",
    NO_GROUP_VARS = "No variables selected to group by",
    TOO_MANY_ROW_VARS = "Maximum of 8 row variables allowed",
    VAR_OVERLAP = "Variable has been selected in more than one selection",
    NO_STATS = "No statistics selected"
  ),
  VAL = poc(
    SPECIAL_CHAR = "\u001D", # For naming and processing row levels
    EM_DASH = "\u2014"
  )
)

meta_env <- new.env()
# calc_pct <- function(x, n) 100 * length(x) / n

calc_stats <- function(analysis_df,
                       subjid_var,
                       anl_var,
                       stats_functions,
                       stats_element_names,
                       collapse_func_name,
                       denom = "N") {

  #return(list(list(n = 99, pct = 5.5, subjid = list("123")  )))

  # ADD ARG CHECKS HERE!!!

  # Get Big N from analysis data
  meta_env$N <- analysis_df[[".N"]][1]

  # Initialise a results list at its final size with default values
  results_list <- as.list(setNames(ifelse(stats_element_names == "n", 0, NA_real_), stats_element_names))

  # If grouping is empty then return with no subject identifiers
  if (nrow(analysis_df) == 0L) {
    results_list[["subjid"]] <- list()
    return(list(results_list))
  }

  # Extract the package and the bare function name dynamically
  if (grepl("::", collapse_func_name)) {
    collapse_parts <- strsplit(collapse_func_name, "::")[[1]]
    collapse_func <- get(collapse_parts[2], envir = asNamespace(collapse_parts[1]), mode = "function")
  } else {
    collapse_func <- get(collapse_func_name, mode = "function")
  }

  # Collapse multiple rows per subject into one
  filter_df <- analysis_df |>
    dplyr::group_by(dplyr::across(dplyr::all_of(c(subjid_var, ".N")))) |>
    dplyr::summarise(!!anl_var := collapse_func(.data[[anl_var]]), .groups = "drop")

  x_vals <- filter_df[[anl_var]]
  len_x <- length(x_vals)

  for (stat_name in names(stats_functions)) {

    f <- stats_functions[[stat_name]]

    if (stat_name == "pct") {
      n_denom <- if (denom == "N") meta_env$N else meta_env$n
      results_list[[stat_name]] <- f(x_vals, n = n_denom)
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
        meta_env$n <- results_list[["n"]]
      }
    }
  }

  #browser()

  # Get subject identifiers
  results_list[["subjid"]] <- as.list(as.character(filter_df[[subjid_var]]))

  return(list(results_list))
}


# ========================================================================================================= format_stats
format_stats <- function(analysis_df,
                         stats_fmts,
                         replace,
                         stats_element_names) {

  formatted_df <- analysis_df
  drop_stats <- character()

  # TODO: CHECK THAT STATS WITHIN FORMATS EXIST!!!!!

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
      for (lui in seq_len(length(lookups))) {
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


# ================================================================================================ compute_summary_table
compute_summary_table <- function(tbl_df,
                                  pop_df,
                                  anl_vars = NULL,
                                  group_vars = NULL,
                                  row_vars = NULL,
                                  subjid_var = NULL,

                                  stats_functions = NULL,
                                  stats_formats = NULL,
                                  stats_labels = NULL,
                                  stats_replace = NULL,

                                  total = NULL,
                                  total_group_val = "Total",
                                  drop_na = NULL,
                                  show_category_n = NULL,
                                  denom = NULL,
                                  collapse_func_name = NULL) {

  # NOTE: Early error feedback should check that pop_df is one row per subject per grouping

  anl_var <- paste0(SUMMTAB$VAL$SPECIAL_CHAR, "anl_var")
  stat_col <- paste0(SUMMTAB$VAL$SPECIAL_CHAR, "stat")

  category_n <- paste0(SUMMTAB$VAL$SPECIAL_CHAR, "n")

  anl_vars_num <- intersect(anl_vars, names(tbl_df)[sapply(tbl_df, is.numeric)])
  anl_vars_cat <- setdiff(anl_vars, anl_vars_num)

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

  store_col_labels <- function(df) {
    lapply(df, function(col) attr(col, "label"))
  }

  restore_col_labels <- function(df, orig_labels) {
    for (col_name in names(orig_labels)) {
      attr(df[[col_name]], "label") <- orig_labels[[col_name]]
    }

    return(df)
  }

  # Duplicate all rows so that total can be calculated for first group var
  if (total) {
    group_var_1 <- group_vars[[1]]
    gv1_fct_levels <- c(levels(pop_df[[group_var_1]]), total_group_val)

    pop_df[[group_var_1]] <- factor(pop_df[[group_var_1]], levels = gv1_fct_levels)
    total_grp_fct <- factor(total_group_val, levels = c(levels(pop_df[[group_var_1]])))
    total_rows <- dplyr::mutate(pop_df, !!group_var_1 := total_grp_fct)

    pop_col_labels <- store_col_labels(pop_df)
    pop_df <- pop_df |>
      rbind(total_rows) |>
      restore_col_labels(pop_col_labels)

    if (group_var_1 %in% names(tbl_df)) {
      tbl_df[[group_var_1]] <- factor(tbl_df[[group_var_1]], levels = gv1_fct_levels)
      total_rows <- dplyr::mutate(tbl_df, !!group_var_1 := total_grp_fct)

      tbl_col_labels <- store_col_labels(tbl_df)
      tbl_df <- tbl_df |>
        rbind(total_rows) |>
        restore_col_labels(tbl_col_labels)
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

  #browser()

  # Extract statistics elements from formats
  fmt_stats_elems <- stats_formats |>
    lapply(\(sublist) sublist[-1]) |>
    unlist(use.names = FALSE) |>
    unique()

  fmt_stats_names <- fmt_stats_elems |>
    sub("\\.[0-9]+$", "", x = _) |>
    unique()

  stats_elems <- c(fmt_stats_elems, setdiff(names(stats_functions), fmt_stats_names))

  # Initialise list to hold results for each analysis variable
  results_list <- list()

  # Initialise flag that indicates if collapsing will be applied
  collapse_flag <- FALSE

  for (av in anl_vars) {

    # Flag if analysis variable is numeric
    is_anl_var_num <- av %in% anl_vars_num

    av_df <- analysis_df

    if (is_anl_var_num) {
      # Numeric analysis variable

      av_stats_funcs <- stats_functions
      av_stats_fmts <- stats_formats
      av_stats_elems <- stats_elems

      # multi_stats_names <- fmt_stats_elems[grep("\\.[0-9]+$", fmt_stats_elems)] |>
      #   sub("\\.[0-9]+$", x = _) |>
      #   unique()

      group_by_vars <- c(group_vars, row_vars)
      av_mod <- av

      # Drop NA values
      av_df <- tidyr::drop_na(av_df, dplyr::all_of(av))

      # Check if collapsing will be applied
      if (nrow(dplyr::distinct(av_df[, c(subjid_var, group_by_vars)])) < nrow(av_df)) collapse_flag <- TRUE
    } else {
      # Categorical analysis variable

      av_stats_funcs <- list(n = length,
                             pct = \(x, n) 100 * length(x) / n) # calc_pct)
      av_stats_fmts <- list(n_pct = list(fmt = "%d (%.1f %%)", "n", "pct"))
      av_stats_elems <- c("n", "pct")

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

      dplyr::summarise(.stats = calc_stats(
        dplyr::pick(dplyr::all_of(c(subjid_var, av_mod, ".N"))),
        subjid_var = subjid_var,
        anl_var = av_mod,
        stats_functions = av_stats_funcs,
        stats_element_names = av_stats_elems,
        collapse_func_name = collapse_func_name,
        denom = denom
      ), .groups = "keep") |>
      dplyr::mutate(!!anl_var := av_label) |>
      dplyr::ungroup()

    # Extract statistics from their single column lists into their own columns
    av_df <- tidyr::unnest_wider(av_df, tidyr::all_of(".stats"))

    # Format statistics
    av_df <- format_stats(
      av_df,
      stats_fmts = av_stats_fmts,
      replace = stats_replace,
      stats_element_names = av_stats_elems
      #stat_names = names(av_stats)
    )

    # # Ensure any unformatted statistics are converted to character
    # unformatted_stats <- intersect(names(av_df)[sapply(av_df, is.numeric)], names(stats_functions))
    # av_df[unformatted_stats] <- lapply(av_df[unformatted_stats], as.character)

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
    if (is_anl_var_num) {
      labelled_stats <- stats_labels[av_df[[stat_col]]]
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
    # values_fill = list("????") # THIS DOES NOT SEEM NECESSARY!!!
  )

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

  df_names <- names(flagged_df)
  internal_columns <- df_names[startsWith(df_names, SUMMTAB$VAL$SPECIAL_CHAR)]
  data_columns <- df_names[!df_names %in% c(row_vars, internal_columns)]

  summtab_list <- list(
    df = flagged_df,
    meta = list(
      anl_vars = anl_vars,
      group_vars = group_vars,
      row_vars = row_vars,
      hierarchy = hierarchy,
      flag_columns = flag_columns,
      data_columns = data_columns,
      total_group_val = total_group_val,
      denom_df = denom_df,
      collapse_flag = collapse_flag,
      collapse_func_name = collapse_func_name
    )
  )

  return(summtab_list)
}

# ===================================================================================================== build_html_table
build_html_table <- function(summtab_list, on_cell_click = NULL) {

  df <- summtab_list[["df"]]

  anl_vars <- summtab_list[["meta"]][["anl_vars"]]
  group_vars <- summtab_list[["meta"]][["group_vars"]]
  row_vars <- summtab_list[["meta"]][["row_vars"]]
  hierarchy <- summtab_list[["meta"]][["hierarchy"]]
  flag_columns <- summtab_list[["meta"]][["flag_columns"]]
  data_columns <- summtab_list[["meta"]][["data_columns"]]
  total_group_val <- summtab_list[["meta"]][["total_group_val"]]
  denom_df <- summtab_list[["meta"]][["denom_df"]]
  collapse_flag <- summtab_list[["meta"]][["collapse_flag"]]
  collapse_func_name <- summtab_list[["meta"]][["collapse_func_name"]]

  anl_var <- paste0(SUMMTAB$VAL$SPECIAL_CHAR, "anl_var")
  stat_col <- paste0(SUMMTAB$VAL$SPECIAL_CHAR, "stat")

  # captured_lines <- capture.output(print(df, n = 500))
  # collapsed_text <- paste(captured_lines, collapse = "\n")
  #
  # return(shiny::pre(collapsed_text))

  table <- shiny::tags[["table"]]
  th <- shiny::tags[["th"]]
  thc <- function(..., colspan = 1L, entry = FALSE) {
    if (entry) {
      th(class = "text-center", ...)
    } else if (colspan == 1L) {
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

  # # Replace spaces with non-breaking spaces to avoid columns being squashed in display
  # df[data_columns] <- rapply(df[data_columns],
  #                            function(.x) gsub(" ", "\u00A0", .x),
  #                            classes = "character",
  #                            how = "replace")

  # Prepare denominator look-up
  n_denominator <- denom_df[[".N"]]
  names(n_denominator) <- denom_df[[".lookup"]]

  entry_header <- ""
  #entry_header <- shiny::span("", shiny::br(), "")    # HEIGHT OF 2 LINES

  split_data_columns <- strsplit(data_columns, split = SUMMTAB$VAL$SPECIAL_CHAR, fixed = TRUE)

  #browser()

  header_rows <- vector(mode = "list", length = length(group_vars))
  for (head_i in seq_len(length(group_vars))) {

    extracted_headers <- rle(purrr::map_chr(split_data_columns, ~ .x[head_i]))[["values"]]

    if (head_i != length(group_vars)) {
      data_headers <- purrr::map(extracted_headers, ~ shiny::span(.x))
      n_cols <- length(data_columns) / length(extracted_headers)
    } else {
      data_headers <- purrr::map2(extracted_headers,
                                  paste0("(N", "\u00A0", "=", "\u00A0", n_denominator[data_columns], ")"),
                                  ~ shiny::span(.x, shiny::br(), .y))
      n_cols <- 1
    }

    header_rows[[head_i]] <- tr(
      #class = "no-border",
      thc(entry_header, entry = TRUE),
      purrr::map(data_headers, thc, colspan = n_cols)
    )
  }

  title <- sprintf("Summary of %s%s; group by %s",
                   paste(anl_vars, collapse = ", "),
                   ifelse(length(row_vars) == 0L, "", paste("; row by", paste(row_vars, collapse = ", "))),
                   paste(group_vars, collapse = ", "))

  aggregate_note <- if (collapse_flag) {
    shiny::p(paste("Note: Multiple results per subject per group, aggregated by", collapse_func_name))
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
    for (hier_i in seq_len(length(hierarchy))) {
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
#' @return A `shiny::tagList` containing the user interface for selecting hierarchy, group,
#' and minimum percentage for event counting.
#'
#' @keywords main
#'
#' @export
summary_table_ui <- function(id,
                             default_total = TRUE,
                             default_drop_na = FALSE,
                             default_show_category_n = TRUE,
                             default_denom = "N",
                             default_collapse_method = "mean",
                             default_stats = "n",
                             collapse_method_choices = c(Mean = "mean", Minimum = "min", Maximum = "max"),
                             choices_stats = c("n", "Mean (SD)", "Min - Max")) {

  ns <- shiny::NS(id)

  drop_menu_cols <- shinyWidgets::dropMenu(
    tag = shiny::actionButton(
      inputId = ns(SUMMTAB$ID$COL_SELECTIONS),
      label = SUMMTAB$LBL$COL_SELECTIONS
    ),
    col_menu_UI(id = ns(SUMMTAB$ID$ANL_VARS)),
    col_menu_UI(id = ns(SUMMTAB$ID$GROUP_VARS)),
    col_menu_UI(id = ns(SUMMTAB$ID$ROW_VARS))
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
    shiny::checkboxInput(ns(SUMMTAB$ID$SHOW_CATEGORY_N), label = SUMMTAB$LBL$SHOW_CATEGORY_N, value = default_show_category_n),
    shiny::radioButtons(ns(SUMMTAB$ID$DENOM), label = SUMMTAB$LBL$DENOM, choices = c("N", "n"), selected = default_denom),
    shiny::radioButtons(ns(SUMMTAB$ID$COLLAPSE_METHOD), label = SUMMTAB$LBL$COLLAPSE_METHOD, choices = collapse_method_choices, selected = default_collapse_method)
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
#' @param id `[character(0)]`
#'
#' The ID for the event count module instance.
#'
#' @return ??? A reactive value containing the list of subjects in the clicked cell, if applicable.
#'
#' @keywords main
#'
#' @export
summary_table_server <- function(id,
                                 table_dataset,
                                 pop_dataset,
                                 subjid_var,
                                 show_modal_on_click = TRUE,
                                 on_sbj_click_fun = function() NULL,

                                 stats_functions = NULL,
                                 stats_formats = NULL,
                                 stats_labels = NULL,
                                 stats_replace = NULL,

                                 default_summarize_on = NULL,
                                 default_group_by = NULL,
                                 default_row_by = NULL,
                                 summarize_on_choices = NULL,
                                 group_by_choices = NULL,
                                 row_by_choices = NULL,
                                 intended_use_label = NULL) {

  mod <- function(input, output, session) {

    ns <- session[["ns"]]

    inputs <- list()

    inputs[[SUMMTAB$ID$ANL_VARS]] <- col_menu_server(
      id = SUMMTAB$ID$ANL_VARS,
      data = table_dataset,
      label = SUMMTAB$LBL$ANL_VARS,
      include_func = function(var, var_name) {
        !inherits(var, "Date") && !inherits(var, "POSIXt") &&
          (is.null(summarize_on_choices) || var_name %in% summarize_on_choices)
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
          (is.null(group_by_choices) || var_name %in% group_by_choices)
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
          (is.null(row_by_choices) || var_name %in% row_by_choices)
      },
      default = default_row_by,
      multiple = TRUE,
      include_none = FALSE
    )

    inputs[[SUMMTAB$ID$TOTAL_FLAG]] <- shiny::reactive(input[[SUMMTAB$ID$TOTAL_FLAG]])
    inputs[[SUMMTAB$ID$DROP_NA_FLAG]] <- shiny::reactive(input[[SUMMTAB$ID$DROP_NA_FLAG]])
    inputs[[SUMMTAB$ID$SHOW_CATEGORY_N]] <- shiny::reactive(input[[SUMMTAB$ID$SHOW_CATEGORY_N]])
    inputs[[SUMMTAB$ID$DENOM]] <- shiny::reactive(input[[SUMMTAB$ID$DENOM]])
    inputs[[SUMMTAB$ID$COLLAPSE_METHOD]] <- shiny::reactive(input[[SUMMTAB$ID$COLLAPSE_METHOD]])
    inputs[[SUMMTAB$ID$STATS]] <- shiny::reactive(input[[SUMMTAB$ID$STATS]])

    summtab <- shiny::reactive({

      anl_vars <- inputs[[SUMMTAB$ID$ANL_VARS]]()
      group_vars <- inputs[[SUMMTAB$ID$GROUP_VARS]]()
      row_vars <- inputs[[SUMMTAB$ID$ROW_VARS]]()

      total <- inputs[[SUMMTAB$ID$TOTAL_FLAG]]()
      drop_na <- inputs[[SUMMTAB$ID$DROP_NA_FLAG]]()
      show_category_n <- inputs[[SUMMTAB$ID$SHOW_CATEGORY_N]]()
      denom <- inputs[[SUMMTAB$ID$DENOM]]()
      collapse_func_name <- inputs[[SUMMTAB$ID$COLLAPSE_METHOD]]()

      choices_stats <- inputs[[SUMMTAB$ID$STATS]]()

      pop_df <- pop_dataset()
      tbl_df <- table_dataset()

      selected_vars <- c(anl_vars, group_vars, row_vars)

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

      #browser()

      choices_unfmt_stats <- setdiff(choices_stats, names(stats_formats_subset))
      stats_functions_subset <- stats_functions[c(choices_fmt_stats, choices_unfmt_stats)]

      # Show a progress bar for the remainder of the execution of this reactive
      # This bar does not really progress; it just disappears once we're through
      p <- shiny::Progress$new(session = session)
      on.exit(p$close())
      p$set(message = "1) Processing data", value = 0.50)

      summary_table <- compute_summary_table(tbl_df,
                                             pop_df,
                                             anl_vars = anl_vars,
                                             group_vars = group_vars,
                                             row_vars = row_vars,
                                             subjid_var = subjid_var,

                                             stats_functions = stats_functions_subset,
                                             stats_formats = stats_formats_subset,
                                             stats_labels = stats_labels,
                                             stats_replace = stats_replace,

                                             total = total,
                                             total_group_val = "Total",
                                             drop_na = drop_na,
                                             show_category_n = show_category_n,
                                             denom = denom,
                                             collapse_func_name = collapse_func_name)


      summary_table
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

    output[[SUMMTAB$ID$TBL_OUTPUT]] <- shiny::renderUI({

      on_cell_click <- sprintf("Shiny.setInputValue('%s', {row_id: Number(this.closest('tr').getAttribute('row-id')), column: this.getAttribute('column')}, {priority: 'event'})", ns("cell_click")) # nolint

      summtab <- summtab()

      # Start a progress bar and leave its cleanup to the `input[[EC$ID$RENDER_COMPLETION_CALLBACK]]` observer
      p <- shiny::Progress$new(session = session)
      table_progress_bars[[length(table_progress_bars) + 1L]] <<- p
      on.exit(p$inc(amount = 0.3))
      p$set(message = "2) Generating & Rendering Table", value = 0.2)

      rendered_content <- build_html_table(summtab, on_cell_click)

      #rendered_content
      shiny::tagList(rendered_content, render_completion_callback)
    })

    if (show_modal_on_click) {
      shiny::observeEvent(input[["cell_click"]], {
        row <- input[["cell_click"]][["row_id"]]
        col <- input[["cell_click"]][["column"]]

        subj_ids <- summtab()[["df"]][[col]][[row]][["subjid"]]
        # if (grepl(SUMMTAB$VAL$SPECIAL_CHAR, col, fixed = TRUE)) {
        #   nested_cols <- strsplit(col, EC$VAL$SPECIAL_CHAR, fixed = TRUE)[[1]]
        #   subj_ids <- et()[["df"]][[nested_cols[1]]][[row]][[nested_cols[2]]][["subjid"]]
        # } else {
        #   subj_ids <- et()[["df"]][[col]][[row]][["subjid"]]
        # }

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

  shiny::moduleServer(id = id, module = mod)
}


mod_summary_table <- function(
    module_id,
    table_dataset_name,
    pop_dataset_name,
    subjid_var = "USUBJID",
    show_modal_on_click = TRUE,

    stats_functions = list(
      n = length,
      mean = mean,
      sd = stats::sd,
      meanci = \(x) if (length(x) > 1L) stats::t.test(x, conf.level = 0.95)$conf.int else rep(NA_real_, 2L),
      geomean = \(x) exp(mean(log(x))),
      median = stats::median,
      medianci = \(x) if (length(x) > 1L) stats::wilcox.test(x,
                                                             exact = FALSE,
                                                             conf.int = TRUE,
                                                             conf.level = 0.95)$conf.int else rep(NA_real_, 2L),
      q1 = \(x) stats::quantile(x, 0.25),
      q3 = \(x) stats::quantile(x, 0.75),
      min = min,
      max = max
    ),
    stats_formats = list(n = list(fmt = "%d", "n"),
                         meansd = list(fmt = "%.1f (%.1f)", "mean", "sd"),
                         meanci = list(fmt = "(%.2f, %.2f)", "meanci.1", "meanci.2"),
                         geomean = list(fmt = "%.1f", "geomean"),
                         median = list(fmt = "%.1f", "median"),
                         medianci = list(fmt = "(%.2f, %.2f)", "medianci.1", "medianci.2"),
                         q1q3 = list(fmt = "%.1f - %.1f", "q1", "q3"),
                         minmax = list(fmt = "%.1f - %.1f", "min", "max")),
    stats_labels = c(n = "n",
                     meansd = "Mean (SD)",
                     meanci = "Mean 95% CI",
                     geomean = "Geometric Mean",
                     median = "Median",
                     medianci = "Median 95% CI",
                     q1q3 = "25% and 75%-ile",
                     minmax = "Min - Max"),
    stats_replace = list(n = c(`^NA$` = SUMMTAB$VAL$EM_DASH),
                         meansd = c(`^NA \\(NA\\)$` = SUMMTAB$VAL$EM_DASH,
                                    `\\(NA\\)` = sprintf("(%s)", SUMMTAB$VAL$EM_DASH)),
                         meanci = c(`^\\(NA, NA\\)$` = SUMMTAB$VAL$EM_DASH),
                         geomean = c(`^NA$` = SUMMTAB$VAL$EM_DASH),
                         median = c(`^NA$` = SUMMTAB$VAL$EM_DASH),
                         medianci = c(`^\\(NA, NA\\)$` = SUMMTAB$VAL$EM_DASH),
                         q1q3 = c(`^NA - NA$` = SUMMTAB$VAL$EM_DASH),
                         minmax = c(`^NA - NA$` = SUMMTAB$VAL$EM_DASH),
                         n_pct = c(`^0 \\(NA \\%\\)$` = "0")),

    default_summarize_on = NULL,
    default_group_by = NULL,
    default_row_by = NULL,
    default_total = TRUE,
    default_drop_na = FALSE,
    default_show_category_n = TRUE,
    default_denom = "N",
    default_collapse_method = "mean",

    summarize_on_choices = NULL,
    group_by_choices = NULL,
    row_by_choices = NULL,
    collapse_method_choices = c(Mean = "mean",
                                Minimum = "min",
                                Maximum = "max",
                                "First Row" = "dplyr::first",
                                "Last Row" = "dplyr::last"),

    intended_use_label = "Use only for internal review and monitoring during the conduct of clinical trials.",
    receiver_id = NULL
) {

  # Extract function names from formats
  fmt_stats <- stats_formats |>
    lapply(\(sublist) sublist[-1]) |>
    unlist(use.names = FALSE) |>
    sub("\\.[0-9]+$", "", x = _) |>
    unique()

  unfmt_stats <- setdiff(names(stats_functions), fmt_stats)

  choices_stats <- c(names(stats_formats), unfmt_stats)

  stats_choices_labels <- ifelse(
    choices_stats %in% names(stats_labels),
    stats_labels[choices_stats],
    choices_stats
  )

  names(choices_stats) <- stats_choices_labels

  mod <- list(
    ui = function(module_id) {
      summary_table_ui(module_id,
                       default_total = default_total,
                       default_drop_na = default_drop_na,
                       default_show_category_n = default_show_category_n,
                       default_denom = default_denom,
                       default_stats = choices_stats,
                       collapse_method_choices = collapse_method_choices,
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
                           show_modal_on_click = show_modal_on_click,
                           on_sbj_click_fun = on_sbj_click_fun,

                           stats_functions = stats_functions,
                           stats_formats = stats_formats,
                           stats_labels = stats_labels,
                           stats_replace = stats_replace,

                           default_summarize_on = default_summarize_on,
                           default_group_by = default_group_by,
                           default_row_by = default_row_by,
                           summarize_on_choices = summarize_on_choices,
                           group_by_choices = group_by_choices,
                           row_by_choices = row_by_choices,
                           intended_use_label = intended_use_label)
    },
    module_id = module_id
  )

  return(mod)
}


mock_summary_table_mm <- function() {

  adsl <- pharmaverseadam::adsl
  adlb <- pharmaverseadam::adlb |>
    dplyr::filter(.data[["LBTESTCD"]] %in% c("ALP", "ALT", "AST", "BILI"),
                  .data[["AVISITN"]] %in% c(0, 4, 5, 7))

  attr(adsl, "meta") <- base::file.info("NEWS.md")
  attr(adlb, "meta") <- base::file.info("NEWS.md")

  dv.manager::run_app(
    data = list(
      pharmaverseadam = list(adsl = adsl, adlb = adlb)
    ),
    module_list = list(
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
      "Demography Summary" = mod_summary_table(
        module_id = "dm_summtab",
        table_dataset_name = "adsl",
        pop_dataset_name = "adsl",
        default_summarize_on = c("AGE", "SEX", "RACE"),
        default_group_by = c("TRT01P"),
        default_row_by = NULL,
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
      "Patient Profile" = dv.papo::mod_patient_profile(
        module_id = "papo",
        subject_level_dataset_name = "adsl",
        subjid_var = "USUBJID",
        sender_ids = c("ds_summtab", "dm_summtab", "lb_summtab"),
        summary = list(vars = c("AGE", "SEX", "RACE", "ETHNIC", "ARM"),
                       column_count = 1)
      )
    ),
    filter_data = "adsl",
    filter_key = "USUBJID",
    enableBookmarking = "url"
  )

}
