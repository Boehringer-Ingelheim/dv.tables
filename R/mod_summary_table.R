SUMMTAB <- poc(
  ID = poc(
    TBL_OPTIONS = "tbl_options",
    ANL_VARS = "anl_vars",
    GROUP_VARS = "group_vars",
    ROW_VARS = "row_vars",
    TOTAL_FLAG = "total",
    DENOM = "denom",
    TBL_OUTPUT = "table_output"
  ),
  LBL = poc(
    TBL_OPTIONS = "Table Options",
    ANL_VARS = "Summarize on:",
    GROUP_VARS = "Group by:",
    ROW_VARS = "Row by:",
    DENOM = "Denominator:",
    TOTAL_FLAG = "Total"
  ),
  VALIDATE = poc(
    NO_TABLE_ROWS = "Table dataset has 0 rows",
    NO_POP_ROWS = "Population dataset has 0 rows",
    NO_ANL_VARS = "No variables selected to summarize on",
    NO_GROUP_VARS = "No variables selected to group by",
    TOO_MANY_ROW_VARS = "Maximum of 8 row variables allowed",
    VAR_OVERLAP = "Variable has been selected in more than one selection"
  ),
  VAL = poc(
    SPECIAL_CHAR = "\u001D", # For naming and processing row levels
    EM_DASH = "\u2014"
  )
)

meta_env <- new.env()
calc_pct <- function(x, n) 100 * length(x) / n # meta_env$N
#calc_pct <- function(x) 100 * length(x) / 99

calc_stats <- function(analysis_df,
                       subjid_var,
                       anl_var,
                       stats,
                       denom = "N") {

  #return(list(list(n = 99, pct = 5.5, subjid = list("123")  )))

  # ADD ARG CHECKS HERE!!!

  # Convert the stats list to use safe wrappers
  safe_stats <- lapply(stats, function(f) {
    #force(f)  # NEEDED???

    function(x, stat_name, ...) {

      if (length(x) == 0) {
        if (stat_name %in% c("n")) 0 else NA_real_
      } else if (length(list(...)) > 0) {
        f(x, ...)
      } else {
        f(x)
      }
    }
  })

  # safe_stats <- lapply(stats, function(f) {
  #   function(x, stat_name) {
  #
  #     if (length(x) == 0) {
  #       if (stat_name %in% c("n")) 0 else NA_real_
  #     } else {
  #       f(x)
  #     }
  #   }
  # })

  # Get Big N from analysis data
  meta_env$N <- analysis_df[[".N"]][1]

  # Remove NA values
  filter_df <- analysis_df |>
    dplyr::filter(!is.na(.data[[anl_var]]))

  # Collapse multiple rows per subject into one
  filter_df <- filter_df |>
    dplyr::group_by(dplyr::across(dplyr::all_of(c(subjid_var, ".N")))) |>
    dplyr::summarise(!!anl_var := mean(.data[[anl_var]]), .groups = "drop")

  results_list <- list()

  # THIS DUMMY RETURN WORKS WITH NO WARNINGS GIVEN
  #return(list(list(n = 122L, pct = 68.2, subjid = list("01-701-1015", "01-701-1015"))))

  stat_names <- names(safe_stats)
  for (stat_name in stat_names) {
    arg_list <- {
      if (stat_name == "pct") {
        if (denom == "N") list(filter_df[[anl_var]], stat_name, n = meta_env$N)
        else list(filter_df[[anl_var]], stat_name, n = meta_env$n)
      }
      else {
        list(filter_df[[anl_var]], stat_name)
      }
    }

    #results_list[[stat_name]] <- safe_stats[[stat_name]](filter_df[[anl_var]], stat_name)
    results_list[[stat_name]] <- do.call(safe_stats[[stat_name]], arg_list)

    # Save the total count for the grouping, so it can be used later in percent calculation.
    # Note: the `n` in `group_df` refers to the total category, whereas the `n` in `results_list`
    # refers to the statistic.
    if (anl_var == ".dummy") {
      group_df <- dplyr::cur_group()
      if (group_df[[ncol(group_df)]] == "n") {
        meta_env$n <- results_list[["n"]]
      }
    }
  }

  # DOES NOT WORK IF DUMMY RETURNED HERE!!
  #return(list(list(n = 122L, pct = 68.2, subjid = list("01-701-1015", "01-701-1015"))))

  # Get subject identifiers
  results_list[["subjid"]] <- filter_df[[subjid_var]]

  # dplyr::relocate(".anl_var", .before = "n")

  #str(results_list)

  return(list(results_list))
}

# calc_n_pct <- function(analysis_df,
#                        subjid_var,
#                        anl_var) {
#
#   group_vars <- dplyr::cur_group()
#
#   # Get Big N from analysis data
#   big_n <- analysis_df[[".N"]][1]
#
#   return(list(list(n_pct = "9 (99.9 %)")))
# }

# ========================================================================================================= format_stats
format_stats <- function(analysis_df,
                         stats_fmts,
                         replace = list(n = c(`^NA$` = SUMMTAB$VAL$EM_DASH),
                                        meansd = c(`^NA \\(NA\\)$` = SUMMTAB$VAL$EM_DASH,
                                                   `\\(NA\\)` = sprintf("(%s)", SUMMTAB$VAL$EM_DASH)),
                                        minmax = c(`^NA - NA$` = SUMMTAB$VAL$EM_DASH),
                                        n_pct = c(`^0 \\(NA \\%\\)$` = "0"))) {

  formatted_df <- analysis_df
  drop_stats <- character()

  stat_fmt_names <- names(stats_fmts)
  for (fmt_name in stat_fmt_names) {
    fmt <- stats_fmts[[fmt_name]]
    for (i in 2:length(fmt)) {
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

  drop_stats <- setdiff(drop_stats, stat_fmt_names)
  formatted_df <- dplyr::select(formatted_df, -dplyr::all_of(drop_stats))

  return(formatted_df)
}


# ================================================================================================ compute_summary_table
compute_summary_table <- function(tbl_df,
                                  pop_df,
                                  anl_vars = NULL,
                                  group_vars = NULL,
                                  row_vars = NULL,
                                  subjid_var = NULL,
                                  total = NULL,
                                  total_group_val = "Total",
                                  denom = NULL) {

  anl_var <- paste0(SUMMTAB$VAL$SPECIAL_CHAR, "anl_var")
  stat_col <- paste0(SUMMTAB$VAL$SPECIAL_CHAR, "stat")

  anl_vars_num <- intersect(anl_vars, names(tbl_df)[sapply(tbl_df, is.numeric)])
  anl_vars_cat <- setdiff(anl_vars, anl_vars_num)


  # ENSURE anl_vars/group_vars/row_vars ARE FACTORS???

    # SHOULD BE OPTION TO REMOVE NA VALUES!!!
    # ...
  # Replace NA values in selected variables with "<NA>" and add associated level
  pop_df[group_vars] <- lapply(pop_df[group_vars], add_na_factor_level)
  tbl_df[row_vars] <- lapply(tbl_df[row_vars], add_na_factor_level)
  tbl_df[anl_vars_cat] <- lapply(tbl_df[anl_vars_cat], add_na_factor_level)

  # Remove any population group vars that occur in table data frame
  tbl_df <- tbl_df[setdiff(names(tbl_df), group_vars)]

  # Duplicate all rows so that total can be calculated for first group var
  if (total) {
    group_var_1 <- group_vars[[1]]
    pop_df <- pop_df |>
      dplyr::bind_rows(dplyr::mutate(pop_df, !!group_var_1 := total_group_val)) |>
      dplyr::mutate(!!group_var_1 := factor(.data[[group_var_1]], levels = c(levels(pop_df[[group_var_1]]), total_group_val)))
  }

  denom_df <- pop_df |>
    dplyr::count(dplyr::across(dplyr::all_of(group_vars)), name = ".N") |>
    dplyr::mutate(.lookup = do.call(paste, c(dplyr::pick(dplyr::all_of(group_vars)),
                                             sep = SUMMTAB$VAL$SPECIAL_CHAR)))

  #browser()

  pop_df_subset <- pop_df |>
    dplyr::left_join(denom_df, by = group_vars) |>
    dplyr::select(dplyr::all_of(c(subjid_var, group_vars, ".N")))
    #dplyr::select(dplyr::all_of(c(subjid_var, setdiff(names(pop_df), names(tbl_df)), ".N")))

  #pop_df[, c(subjid_var, setdiff(names(pop_df), names(tbl_df))), drop = FALSE]

  analysis_df <- tbl_df |>
    dplyr::left_join(pop_df_subset, by = subjid_var) |>
    #dplyr::right_join(pop_df_subset, by = subjid_var) |>
    dplyr::select(dplyr::all_of(c(subjid_var, group_vars, row_vars, anl_vars, ".N"))) |>

    # dplyr::mutate(dplyr::across(dplyr::all_of(row_vars),
    #                             ~ as.factor(replace(as.character(.), is.na(.), SUMMTAB$VAL$SPECIAL_CHAR)))) |>

    dplyr::mutate(.dummy = 1)

  # Define labels for statistics
  stats_lbls <- c(n = "n",
                  meansd = "Mean (SD)",
                  minmax = "Min - Max")

  # Initialise list to hold results for each analysis variable
  results_list <- list()

  for (av in anl_vars) {

    # Flag if analysis variable is numeric
    is_anl_var_num <- av %in% anl_vars_num

    if (is_anl_var_num) {
      stats <- list(n = length,
                    mean = mean,
                    sd = sd,
                    min = min,
                    max = max)
      stats_fmts <- list(n = list(fmt = "%d", "n"),
                         meansd = list(fmt = "%.1f (%.1f)", "mean", "sd"),
                         minmax = list(fmt = "%.1f - %.1f", "min", "max"))

      group_by_vars <- c(group_vars, row_vars)
      av_mod <- av

      # calc_stats_fun <- calc_stats
      # calc_stats_fun_args <- list(
      #   subjid_var = subjid_var,
      #   anl_var = av_mod,
      #   stats = stats
      # )

      av_df <- analysis_df
    } else {
      stats <- list(n = length,
                    pct = calc_pct)
      stats_fmts <- list(n_pct = list(fmt = "%d (%.1f %%)", "n", "pct"))

      group_by_vars <- c(group_vars, row_vars, av)  # CONVERT av TO FACTOR!?!?!
      av_mod <- ".dummy" # Counts done on dummy variable

      # calc_stats_fun <- calc_n_pct
      # calc_stats_fun_args <- list(
      #   subjid_var = subjid_var,
      #   anl_var = av_mod
      # )

      # Duplicate all rows so that small n can be calculated for categorical analysis vars
      av_df <- analysis_df |>
        dplyr::bind_rows(dplyr::mutate(analysis_df, !!av := "n")) |>
        dplyr::mutate(!!av := factor(.data[[av]], levels = c("n", levels(analysis_df[[av]]))))
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
        stats = stats,
        denom = denom
      )) |>
      # dplyr::summarise(.stats = do.call(
      #   calc_stats_fun,
      #   c(list(dplyr::pick(dplyr::all_of(c(subjid_var, av_mod, ".N")))),
      #     calc_stats_fun_args)
      # )) |>
      dplyr::mutate(!!anl_var := av_label) |>
      dplyr::ungroup()

    # Extract statistics from their single column lists into their own columns
    av_df <- tidyr::unnest_wider(av_df, tidyr::all_of(".stats"))

    # Format statistics
    av_df <- format_stats(av_df, stats_fmts)

    stat_cols <- setdiff(names(av_df), c(group_by_vars, anl_var, "subjid"))

    # Transpose statistics into a single column
    av_df <- tidyr::pivot_longer(
      av_df,
      cols = stat_cols,
      names_to = stat_col,
      values_to = ".val",
    )

    # If categorical analysis, then move category into statistic name
    if (!is_anl_var_num) {
      av_df <- av_df |>
        dplyr::mutate(!!stat_col := as.character(.data[[av]])) |>
        dplyr::select(-dplyr::all_of(av))
    }

    # Replace names of statistics with their corresponding labels (for numeric analysis variables)
    if (is_anl_var_num) {
      labelled_stats <- stats_lbls[av_df[[stat_col]]]
      av_df[[stat_col]] <- ifelse(
        is.na(labelled_stats),
        av_df[[stat_col]],
        labelled_stats
      )
    }

    results_list[[av]] <- av_df
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
    values_from = dplyr::all_of(".val"),
    values_fill = list("????") # THIS DOES NOT SEEM NECESSARY!!!
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
      dplyr::mutate(!!first_col := dplyr::if_else(dplyr::row_number() == 1, TRUE, FALSE)) |>
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
      denom_df = denom_df
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

  anl_var <- paste0(SUMMTAB$VAL$SPECIAL_CHAR, "anl_var")
  stat_col <- paste0(SUMMTAB$VAL$SPECIAL_CHAR, "stat")

  # captured_lines <- capture.output(print(df, n = 500))
  # collapsed_text <- paste(captured_lines, collapse = "\n")
  #
  # return(shiny::pre(collapsed_text))


  table <- shiny::tags[["table"]]
  th <- shiny::tags[["th"]]
  # thc <- function(..., colspan = 1) {
  #   if (colspan == 1) {
  #     th(class = "text-center", style = "vertical-align: bottom; border-top: 1px solid white", ...)
  #   } else {
  #     th(class = "text-center", colspan = as.character(colspan),
  #        style = "border-bottom: 1px solid black; border-right: 6px solid green", ...)
  #   }
  # }
  thc <- function(..., colspan = 1, entry = FALSE) {
    if (entry) {
      th(class = "text-center", ...)
    } else if (colspan == 1) {
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

  title <- sprintf("Summary of %s%s",
                   paste(anl_vars, collapse = ", "),
                   ifelse(length(row_vars) == 0, "", paste(" by", paste(row_vars, collapse = ", "))))

  # df[[entry_name_col]] <- local({
  #   purrr::pmap_chr(
  #     df[c(hierarchy, hier_lvl_col)], function(...) {
  #       args <- list(...)
  #       if (args[[hier_lvl_col]] == 0) {
  #         return("Subjects with any event")
  #       }
  #       curr_lvl <- hierarchy[args[[hier_lvl_col]]]
  #       curr_label <- as.character(args[[curr_lvl]])
  #       curr_label
  #     }
  #   )
  # })

  collapse_control <- shiny::icon("table", onclick = "ec_collapse(this)")

  empty_data_cells <- replicate(length(data_columns), td(), simplify = FALSE)

  # body <- list()
  body <- vector(mode = "list", length = nrow(df))
  for (r in seq_len(nrow(df))) {
    curr_row <- df[r, , drop = FALSE]

    # Initialise indentation to zero
    indent <- 0

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

        hier_classes <- if (indent == 0) indent_class else c(indent_class, "bg-gray")

        hier_rows[[hier_i]] <- tr(
          class = hier_classes,
          indent = indent,
          hier_entry_cell,
          empty_data_cells
        )
      } else {
        hier_rows[[hier_i]] <- NULL
      }

      indent <- indent + 1
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

    # body <- c(body, hier_rows, list(stat_row))
    body[[r]] <- shiny::tagList(
      !!!hier_rows,
      stat_row
    )
  }

  html_table <- shiny::div(
    shiny::p(title),
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
                             default_total = TRUE) {

  ns <- shiny::NS(id)

  drop_menu <- shinyWidgets::dropMenu(
    #shiny::tags[["button"]](id = ns(SUMMTAB$ID$TBL_OPTIONS), SUMMTAB$LBL$TBL_OPTIONS, class = "btn btn-default"),
    tag = shiny::actionButton(
      inputId = ns(SUMMTAB$ID$TBL_OPTIONS),
      label = SUMMTAB$LBL$TBL_OPTIONS
    ),
    col_menu_UI(id = ns(SUMMTAB$ID$ANL_VARS)),
    col_menu_UI(id = ns(SUMMTAB$ID$GROUP_VARS)),
    col_menu_UI(id = ns(SUMMTAB$ID$ROW_VARS)),
    shiny::checkboxInput(ns(SUMMTAB$ID$TOTAL_FLAG), label = SUMMTAB$LBL$TOTAL_FLAG, value = default_total),
    shiny::radioButtons(ns(SUMMTAB$ID$DENOM), label = SUMMTAB$LBL$DENOM, choices = c("N", "n"))
  )

  ui <- shiny::div(
    class = "summary_table",
    shiny::tagList(
      drop_menu
    ),
    shiny::uiOutput(ns(SUMMTAB$ID$TBL_OUTPUT))
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

    inputs[[SUMMTAB$ID$TOTAL_FLAG]] <- shiny::reactive({
      input[[SUMMTAB$ID$TOTAL_FLAG]]
    })

    inputs[[SUMMTAB$ID$DENOM]] <- shiny::reactive({
      input[[SUMMTAB$ID$DENOM]]
    })

    summtab <- shiny::reactive({

      anl_vars <- inputs[[SUMMTAB$ID$ANL_VARS]]()
      group_vars <- inputs[[SUMMTAB$ID$GROUP_VARS]]()
      row_vars <- inputs[[SUMMTAB$ID$ROW_VARS]]()

      total <- inputs[[SUMMTAB$ID$TOTAL_FLAG]]()
      denom <- inputs[[SUMMTAB$ID$DENOM]]()

      pop_df <- pop_dataset()
      tbl_df <- table_dataset() #|>
        #dplyr::select(-dplyr::any_of(group_vars))

      selected_vars <- c(anl_vars, group_vars, row_vars)

      shiny::validate(
        shiny::need(
          checkmate::test_data_frame(tbl_df, min.rows = 1),
          SUMMTAB$VALIDATE$NO_TABLE_ROWS
        ),
        shiny::need(
          checkmate::test_data_frame(pop_df, min.rows = 1),
          SUMMTAB$VALIDATE$NO_POP_ROWS
        ),
        shiny::need(
          checkmate::test_character(anl_vars, min.chars = 1, min.len = 1, max.len = NULL),
          SUMMTAB$VALIDATE$NO_ANL_VARS
        ),
        shiny::need(
          checkmate::test_character(group_vars, min.chars = 1, min.len = 1, max.len = NULL),
          SUMMTAB$VALIDATE$NO_GROUP_VARS
        ),
        shiny::need(
          checkmate::test_character(row_vars, min.chars = 1, min.len = 0, max.len = 8),
          SUMMTAB$VALIDATE$TOO_MANY_ROW_VARS
        ),
        shiny::need(
          checkmate::test_set_equal(selected_vars, unique(selected_vars), ordered = TRUE),
          SUMMTAB$VALIDATE$VAR_OVERLAP
        )
      )

      summary_table <- compute_summary_table(tbl_df,
                                             pop_df,
                                             anl_vars = anl_vars,
                                             group_vars = group_vars,
                                             row_vars = row_vars,
                                             subjid_var = subjid_var,
                                             total = total,
                                             total_group_val = "Total",
                                             denom = denom)


      summary_table
    })

    output[[SUMMTAB$ID$TBL_OUTPUT]] <- shiny::renderUI({

      # on_cell_click <- sprintf(
      #   "console.log('Row:', this.closest('tr').getAttribute('row-id'), 'Col:', this.getAttribute('column')); Shiny.setInputValue('%s', {row_id: Number(this.closest('tr').getAttribute('row-id')), column : this.getAttribute('column')}, {priority: 'event'})",
      #   ns("cell_click")
      # )

      on_cell_click <- sprintf("Shiny.setInputValue('%s', {row_id: Number(this.closest('tr').getAttribute('row-id')), column: this.getAttribute('column')}, {priority: 'event'})", ns("cell_click")) # nolint

      summtab <- summtab()

      rendered_content <- build_html_table(summtab, on_cell_click)

      rendered_content
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

    res <- list(
      subj_id = shiny::reactive({
        shiny::req(checkmate::test_string(input[["clicked_sbj"]], na.ok = FALSE, min.chars = 1, null.ok = FALSE))
        input[["clicked_sbj"]]
      })
    )

    res
  }

  shiny::moduleServer(
    id = id,
    module = mod
  )
}


mod_summary_table <- function(module_id,
                              table_dataset_name,
                              pop_dataset_name,
                              subjid_var = "USUBJID",
                              # show_event_group_by = FALSE,
                              # show_time_at_risk_options = FALSE,
                              show_modal_on_click = TRUE,
                              # default_hierarchy = NULL,
                              default_summarize_on = NULL,
                              default_group_by = NULL,
                              default_row_by = NULL,
                              default_total = TRUE,
                              # default_event_group = NULL,
                              # default_event_date = NULL,
                              # default_origin_date = NULL,
                              # default_censor_date = NULL,
                              # default_risk = FALSE,
                              # hierarchy_choices = NULL,
                              summarize_on_choices = NULL,
                              group_by_choices = NULL,
                              row_by_choices = NULL,
                              # event_group_choices = NULL,
                              # event_date_choices = NULL,
                              # origin_date_choices = NULL,
                              # censor_date_choices = NULL,
                              intended_use_label = "Use only for internal review and monitoring during the conduct of clinical trials.",
                              receiver_id = NULL) {

  mod <- list(
    ui = function(module_id) {
      summary_table_ui(module_id,
                       default_total = default_total)
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


mock_summary_table <- function() {

  adlb <- pharmaverseadam::adlb |>
    dplyr::filter(.data[["LBTESTCD"]] %in% c("ALP", "ALT", "AST", "BILI"),
                  .data[["AVISITN"]] %in% c(0, 4, 5, 7))
  adsl <- pharmaverseadam::adsl

  attr(adlb, "meta") <- base::file.info("NEWS.md")
  attr(adsl, "meta") <- base::file.info("NEWS.md")

  # adlb <- pharmaverseadam::adlb |>
  #   dplyr::filter(.data[["LBTESTCD"]] %in% c("ALP"),
  #                 .data[["AVISITN"]] %in% c(0),
  #                 .data[["RACE"]] == "WHITE",
  #                 .data[["SEX"]] == "F")
  # adsl <- pharmaverseadam::adsl |>
  #   dplyr::filter(.data[["SEX"]] == "F")

  dv.manager::run_app(
    data = list(
      pharmaverseadam = list(adlb = adlb, adsl = adsl)
    ),
    module_list = list(
      "Lab Summary" = mod_summary_table(
        "lb_summtab",
        table_dataset_name = "adlb",
        pop_dataset_name = "adsl",
        #
        #default_summarize_on = c("RACE"),
        #default_summarize_on = c("AVAL"),
        #default_summarize_on = c("ANL01FL"),
        #default_summarize_on = c("DTHCAUS"),
        #default_group_by = c("SEX"),
        #default_group_by = c("DTHCAUS"),
        #default_row_by = c("PARAM", "AVISIT")
        #default_row_by = c("DTHDOM")
        #
        default_summarize_on = c("AVAL", "CHG", "RACE"),
        default_group_by = c("TRT01P", "SEX"),
        default_row_by = c("PARAM", "AVISIT")
      ),
      "Demography Summary" = mod_summary_table(
        "dm_summtab",
        table_dataset_name = "adsl",
        pop_dataset_name = "adsl",
        default_summarize_on = c("AGE", "SEX", "RACE"),
        default_group_by = c("TRT01P"),
        default_row_by = NULL
      )
    ),
    filter_data = "adsl",
    filter_key = "USUBJID",
    enableBookmarking = "url"
  )

}
