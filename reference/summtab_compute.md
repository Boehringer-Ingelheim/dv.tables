# Perform summary table computations

Perform summary table computations

## Usage

``` r
summtab_compute(
  tbl_df,
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
  drop_empty_cols = NULL,
  show_category_n = NULL,
  denom = NULL,
  aggregate_func_name = NULL
)
```

## Arguments

- tbl_df:

  A data frame containing the data for analysis.

- pop_df:

  A data frame containing the population data.

- anl_vars:

  A vector of names of analysis variables from `tbl_df`.

- group_vars:

  A vector of names of population grouping variables from `pop_df`.

- row_vars:

  A vector of names of row categorization variables from `tbl_df`.

- pop_flag_vars:

  A vector of names of population flag variables from `pop_df`.

- subjid_var:

  A string representing the subject identifier column in both datasets.

- stats_functions:

  A named list defining the functions used for summarizing numerical
  data.

- stats_formats:

  A named list of lists defining the combination and formatting of the
  function results from summarizing numerical data.

- stats_labels:

  A named vector of statistics labels that should be used in the summary
  table.

- stats_replace:

  A named list of lists of `list(pattern =, replacement =)` pairs
  defining replacements that should be applied, in order, to the
  formatted results from `stats_formats`.

- total:

  A flag that determines whether to add a total group column.

- total_group_val:

  A string indicating the label for the total group column.

- drop_na:

  A flag that determines whether to drop NA values from selected 'group
  by' and 'row by' variables.

- drop_empty_rows:

  A flag that determines whether to remove rows with no data from the
  analysis results.

- drop_empty_cols:

  A flag that determines whether to remove columns with no data from the
  analysis results.

- show_category_n:

  A flag that determines whether to show the 'n' category when
  summarizing categorical data.

- denom:

  A string, either "N" or "n", indicating whether the denominator for
  categorical data should be taken as the number of subjects from the
  population grouping ("N") or the number of subjects from the 'row by'
  grouping for each population grouping ("n"). If `drop_na == TRUE` then
  `NA` values will be excluded from determining the "n" denominator.

- aggregate_func_name:

  A string representing the name of the function used to aggregate
  multiple rows per subject into one.

## Value

A list containing:

- `df`: A data frame of the analysed data. Columns: row variables,
  analysis variable name, statistics for each population group
  combination, ".first" flags for rendering.

- `meta`: A list of metadata:

  - `anl_var`: A vector of analysis variable names.

  - `group_vars`: A vector of group variable names.

  - `row_vars`: A vector of row variable names.

  - `flag_columns`: A vector of names of columns holding the ".first"
    flags for rendering.

  - `data_columns`: A vector of names of columns holding the statistics
    for each population group combination.

  - `total_group_val`: A string indicating the label for the total group
    column.

  - `denom_df`: A data frame of population group denominator data.

  - `denom`: A string, either "N" or "n", indicating the denominator
    used.

  - `aggregate_flag`: A flag indicating whether rows have been
    aggregated.

  - `aggregate_func_name`: A string indicating the name of the function
    used for aggregating.
