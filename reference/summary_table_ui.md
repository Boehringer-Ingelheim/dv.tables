# UI for the summary table module

UI for the summary table module

## Usage

``` r
summary_table_ui(
  module_id,
  show_pop_flag_selection = FALSE,
  show_aggregate_method = FALSE,
  default_pop_flags_after_groups = FALSE,
  default_total = TRUE,
  default_drop_na = FALSE,
  default_drop_empty_rows = FALSE,
  default_drop_empty_cols = FALSE,
  default_show_category_n = TRUE,
  default_denom = "N",
  default_stats = NULL,
  default_aggregate_method = NULL,
  choices_aggregate_method = NULL,
  choices_stats = NULL
)
```

## Arguments

- module_id:

  `[character(1)]`

  A string that serves as a unique identifier for the module.

- show_pop_flag_selection:

  `[logical(1)]`

  A flag to indicate whether to show the population flag selection.
  Other associated arguments are `default_pop_flags` and
  `choices_pop_flags`.

- show_aggregate_method:

  `[logical(1)]`

  A flag to indicate whether to show (and apply) aggregate methods. If
  more than one row per subject exists after population grouping and row
  categorization has been applied then aggreation of those rows can be
  applied using a selected method. Other associated arguments are
  `default_aggregate_method` and `choices_aggregate_method`.

- default_pop_flags_after_groups:

  `[logical(1)]`

  A flag specifying the default value for the checkbox that determines
  whether to show the population flags after the group variables.

- default_total:

  `[logical(1)]`

  A flag specifying the default value for the checkbox that determines
  whether to add a total group column.

- default_drop_na:

  `[logical(1)]`

  A flag specifying the default value for the checkbox that determines
  whether to drop NA values from selected 'group by' and 'row by'
  variables.

- default_drop_empty_rows:

  `[logical(1)]`

  A flag specifying the default value for the checkbox that determines
  whether to remove rows with no data from the analysis results.

- default_drop_empty_cols:

  `[logical(1)]`

  A flag specifying the default value for the checkbox that determines
  whether to remove cols with no subject data. analysis results.

- default_show_category_n:

  `[logical(1)]`

  A flag specifying the default value for the checkbox that determines
  whether to show the 'n' category when summarizing categorical data.

- default_denom:

  `["N" | "n"]`

  A string, either "N" or "n", indicating the default of whether the
  denominator for categorical data should be taken as the number of
  subjects from the population grouping ("N") or the number of subjects
  from the 'row by' grouping for each population grouping ("n"). If the
  user selects to drop `NA` values then those values will be excluded
  from determining the "n" denominator.

- default_stats:

  `[character(1+) | NULL]`

  A vector of strings from the names of the list elements in
  `stats_formats` or `stats_functions`, used as the default selection of
  statistics for summarizing numerical data.

- default_aggregate_method:

  `[character(1) | NULL]`

  A string indicating the function name defined in
  `choices_aggregate_method` to use as the default for aggregating rows
  when `show_aggregate_method = TRUE`. The function is applied to the
  analysis variable when more than one row per subject exists after
  population grouping and row categorization has been applied. The
  double colon (`::`) namespace resolution operator can be used to
  specify a function from a specific package, e.g., `"dplyr::first"`.

- choices_aggregate_method:

  `[character(1+) | NULL]`

  A vector of named strings indicating the functions that can be used
  for aggregating rows when `show_aggregate_method = TRUE`. The
  functions apply to the analysis variable when more than one row per
  subject exists after population grouping and row categorization has
  been applied. The double colon (`::`) namespace resolution operator
  can be used to specify functions from specific packages, e.g.,
  `"dplyr::first"`. The names associated to the vector elements are
  displayed in the UI radio button selections.

- choices_stats:

  `[character(1+) | NULL]`

  A vector of strings from the names of the list elements from
  [`summary_table_server()`](https://boehringer-ingelheim.github.io/dv.tables/reference/summary_table_server.md)
  arguments, `stats_formats` and `stats_functions`, used as the choice
  of statistics for summarizing numerical data.

## Value

A
[`shiny::tagList`](https://rstudio.github.io/htmltools/reference/tagList.html)
containing the user interface for selecting hierarchy, group, and
minimum percentage for event counting.
