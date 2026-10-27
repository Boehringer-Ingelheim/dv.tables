#' Preprocess table for download as Excel (.xlsx) or Word (.rtf), or build it as a gt table
#'
#' @details
#' Each entry in the group columns of the `count_table` data frame is a list of statistics, as returned
#' by `pivot_wide_format_events_table()`. The statistics are formatted as in the HTML table with
#' `format_count_cells()`, into one column per group, event group value and statistic.
#'
#' For Excel and Word, overall patient numbers are extracted from the metadata and added as a separate
#' line at the beginning. For gt tables they are shown in the group column spanners instead.
#'
#' If the option to split count and percentage into separate columns is selected, then the column
#' with the count will be suffixed with `" [N]"` and the column with the percentage will be suffixed
#' with `" [%]"`.
#'
#' For Excel, each event column is kept and labelled. For Word and gt tables, event columns are merged
#' into a single column with the event value at the hierarchy level of each row, indented by level.
#'
#' @param count_table A reactive list containing dataset containing the event data
#'   and other metadata.
#' @param download_type A string specifying the download type, either `.xlsx` for Excel, `.rtf` for
#'   Word or `gt` for a gt table.
#' @param split_columns A logical indicating if count and percent should be split into separate
#'   columns.
#'
#' @return Processed data frame, or a `gt_tbl` object if `download_type` is `gt`.
#'
#' @keywords internal
preprocess_download_table <- function(count_table, download_type, split_columns) {

  checkmate::assert_list(count_table,
                         types = c("data.frame", "list"),
                         null.ok = TRUE,
                         names = "named")

  checkmate::assert_subset(c("df", "meta"), names(count_table))
  checkmate::assert_subset(c("denom_df", "hierarchy", "event_group_vals", "total_group_val", "event_group_total_val",
                             "table_type", "min_percent"),
                           names(count_table[["meta"]]))

  # At least one row is required to download the table, and the hierarchy level of each row to merge event columns
  checkmate::assert_data_frame(count_table[["df"]], min.rows = 1)
  checkmate::assert_names(names(count_table[["df"]]), must.include = paste0(EC$VAL$SPECIAL_CHAR, "lvl"))

  checkmate::assert_string(download_type)
  checkmate::assert_choice(download_type, c(".xlsx", ".rtf", "gt"))

  checkmate::assert_flag(split_columns)

  df <- count_table[["df"]]
  meta <- count_table[["meta"]]
  cols <- get_stat_columns(df, meta, split_columns)

  switch(download_type,
    ".xlsx" = build_xlsx_table(df, meta, cols),
    ".rtf" = build_rtf_table(df, meta, cols),
    "gt" = build_gt_table(df, meta, cols),
    stop(paste("Unsupported download type:", download_type))
  )
}

build_xlsx_table <- function(df, meta, cols) {
  hierarchy <- meta[["hierarchy"]]
  hierarchy_labels <- attr(hierarchy, "labels")
  
  overall_label <- c("Overall No. of Patients", rep(NA_character_, length(hierarchy) - 1L))
  event_cols <- purrr::map2(df[hierarchy], overall_label,
                            \(x, label) c(label, sub(EC$VAL$SPECIAL_CHAR, "Total", as.character(x))))
  names(event_cols) <- ifelse(hierarchy_labels != hierarchy,
                              paste0(hierarchy, " [", hierarchy_labels, "]"),
                              hierarchy)

  stat_cols <- format_stat_columns(df, cols, meta[["min_percent"]], count_format = "%d ( %.2f %%)") |>
    prepend_overall_n(cols) |>    
    purrr::map2(cols[["stat"]], \(x, stat) {
      x <- sub("\u2014", "", x)
      if (stat == "count") x else as.numeric(x)
    })
  names(stat_cols) <- paste0(display_group_name(cols[["group_col"]], meta), " [", cols[["stat_label"]], "]")

  as.data.frame(c(event_cols, stat_cols), check.names = FALSE)
}

build_rtf_table <- function(df, meta, cols) {
  browser()

  hierarchy <- meta[["hierarchy"]]
  hierarchy_labels <- attr(hierarchy, "labels")
  hier_lvl <- df[[paste0(EC$VAL$SPECIAL_CHAR, "lvl")]]

  event_col <- c(
    "Overall No. of Patients",
    paste0(
      strrep("  ", pmax(hier_lvl - 1L, 0L)),
      get_row_label_by_hierarchy_level(df, hierarchy, hier_lvl)
    )
  )
  # Line break code <br> will be replaced by RTF \line after RTF string is generated
  event_col_name <- paste0(
    strrep("  ", seq_along(hierarchy_labels) - 1L),
    hierarchy_labels,
    collapse = "<br>"
  )

  stat_cols <- format_stat_columns(
    df,
    cols,
    meta[["min_percent"]],
    count_format = "%d (%.2f)"
  ) |>
    prepend_overall_n(cols)
  names(stat_cols) <- paste0(
    display_group_name(cols[["group_col"]], meta),
    "<br>",
    cols[["stat_label"]]
  )

  as.data.frame(
    c(stats::setNames(list(event_col), event_col_name), stat_cols),
    check.names = FALSE
  )
}

build_gt_table <- function(df, meta, cols) {
  hierarchy <- meta[["hierarchy"]]
  hierarchy_labels <- attr(hierarchy, "labels")
  hier_lvl <- df[[paste0(EC$VAL$SPECIAL_CHAR, "lvl")]]
  has_event_group <- length(meta[["event_group_vals"]]) > 0

  stat_cols <- format_stat_columns(df, cols, meta[["min_percent"]], count_format = "%d ( %.2f %%)")
  # Names are set later
  names(stat_cols) <- paste0(cols[["group_col"]], EC$VAL$SPECIAL_CHAR, cols[["stat"]])
  # gt has special labels that are hard coded to be similar to HTML
  stat_labels <- c(count = "n (%)", n = "n", pct = "%", time_at_risk = "Time at risk", incidence_rate = "Rate/100")

  df_prep <- as.data.frame(c(list(row_label = get_row_label_by_hierarchy_level(df, hierarchy, hier_lvl)), stat_cols),
                           check.names = FALSE)

  tbl <- gt::gt(df_prep, rowname_col = "row_label") |>
    gt::tab_stubhead(
      label = paste(
        paste(hierarchy_labels, collapse = "/"),
        "by",
        paste(c(meta[["group_vars"]], meta[["event_group_var"]]), collapse = ", ")
      )
    ) |>
    gt::cols_label(.list = as.list(stats::setNames(stat_labels[cols[["stat"]]], names(stat_cols))))

  # Event group spanners, nested below the group spanners
  if (has_event_group) {
    for (group_col in unique(cols[["group_col"]])) {
      is_col <- cols[["group_col"]] == group_col
      tbl <- tbl |>
        gt::tab_spanner(
          label = display_group_name(cols[["event_group"]][is_col][[1]], meta),
          columns = dplyr::all_of(names(stat_cols)[is_col]),
          id = group_col
        )
    }
  }

  for (group in unique(cols[["group"]])) {
    is_col <- cols[["group"]] == group
    tbl <- tbl |>
      gt::tab_spanner(
        label = paste0(display_group_name(group, meta), " (N = ", cols[["group_n"]][is_col][[1]], ")"),
        columns = dplyr::all_of(names(stat_cols)[is_col]),
        id = group
      )
  }

  # gt indents rows by hierarchy level with cell styles
  for (lvl in setdiff(unique(hier_lvl), 0L)) {
    tbl <- tbl |>
      gt::tab_style(
        style = gt::cell_text(indent = gt::px(20 * lvl)),
        locations = gt::cells_stub(rows = which(hier_lvl == lvl))
      )
  }

  # The latex.header_repeat workaround belongs to the latex conversion, which is
  # done downstream, so a gt table is returned here
  tbl |>
    gt::tab_options(
      heading.align = "left",
      latex.use_longtable = TRUE,
      table.font.size = gt::px(9),
      data_row.padding = gt::px(3)
    )
}

# Based on the table type get a description of the stat columns that will be included in the table
get_stat_columns <- function(df, meta, split_columns) {
  group_n <- stats::setNames(meta[["denom_df"]][[".N"]], meta[["denom_df"]][[".lookup"]])
  groups <- intersect(names(df), names(group_n))
  has_event_group <- length(meta[["event_group_vals"]]) > 0

  event_groups <- if (has_event_group) names(df[[groups[[1]]]][[1]]) else NA_character_
  stats <- c(
    if (split_columns) c("n", "pct") else "count",
    if (meta[["table_type"]] == "time_at_risk") c("time_at_risk", "incidence_rate")
  )
  stat_labels <- c(count = "N (%)", n = "N", pct = "%",
                   time_at_risk = "Time at Risk", incidence_rate = "Incidence Rate")

  cols <- expand.grid(
    stat = stats, event_group = event_groups, group = groups,
    KEEP.OUT.ATTRS = FALSE, stringsAsFactors = FALSE
  )
  cols[["stat_label"]] <- unname(stat_labels[cols[["stat"]]])
  cols[["group_col"]] <- cols[["group"]]
  if (has_event_group) cols[["group_col"]] <- paste0(cols[["group"]], EC$VAL$SPECIAL_CHAR, cols[["event_group"]])
  cols[["group_n"]] <- unname(group_n[cols[["group"]]])

  cols
}

# Formats the statistic of each column described by `stat_columns()` as in the HTML table
format_stat_columns <- function(df, cols, min_percent, count_format) {
  stat_cols <- vector("list", nrow(cols))  
  for (i in seq_len(nrow(cols))) {
    curr_grp <- cols[["group"]][[i]]
    cells <- df[[curr_grp]]
    event_group <- cols[["event_group"]][[i]]
    # Unwrap list of statistics
    if (!is.na(event_group)) cells <- lapply(cells, \(x) x[[event_group]])
    stat_cols[[i]] <- format_count_cells(cells, cols[["stat"]][[i]], min_percent, count_format)
  }
  stat_cols
}

# Adds the overall number of patients of the group as a first row of the count statistic columns, empty for the rest
prepend_overall_n <- function(stat_cols, cols) {
  overall_n <- ifelse(cols[["stat"]] %in% c("count", "n"), as.character(cols[["group_n"]]), "")
  purrr::map2(stat_cols, overall_n, \(x, n) c(n, x))
}

# Merges event columns into the event value at the hierarchy level of each row, "Total" for the overall row
get_row_label_by_hierarchy_level <- function(df, hierarchy, hier_lvl) {  
  row_label <- rep("Total", nrow(df))
  for (lvl in setdiff(unique(hier_lvl), 0L)) {
    row_label[hier_lvl == lvl] <- as.character(df[[hierarchy[[lvl]]]][hier_lvl == lvl])
  }
  row_label
}

# Replaces totals placeholders and special separator characters in group names
display_group_name <- function(x, meta) {
  x <- gsub(EC$VAL$TOTAL, meta[["total_group_val"]], x, fixed = TRUE)
  if (!is.null(meta[["event_group_total_val"]])) {
    x <- gsub(EC$VAL$EVT_TOTAL, meta[["event_group_total_val"]], x, fixed = TRUE)
  }
  gsub(EC$VAL$SPECIAL_CHAR, "/", x, fixed = TRUE)
}
