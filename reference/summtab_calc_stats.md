# Calculate statistics for the "current" `dplyr::summarize` group

Categorical data analysis (count and percentage of denominator) is
signified by a dummy analysis variable, `.dummy`, where count is just
the number of rows in the group. The denominator is stored in the
environmental variable, `summtab_meta_env$n_denom`, during the
processing of the first special total category group, and therefore is
available to the subsequent processing of proper categories.

## Usage

``` r
summtab_calc_stats(
  analysis_df,
  subjid_var,
  anl_var,
  stats_functions,
  aggregate_func_name,
  denom = "N"
)
```

## Arguments

- analysis_df:

  A data frame containing
  [`dplyr::summarize`](https://dplyr.tidyverse.org/reference/summarise.html)
  group rows from the analysis data frame.

- subjid_var:

  A string representing the subject identifier column.

- anl_var:

  A string representing the name of the analysis variable to calculate
  the statistics on. For categorical analysis it should be `.dummy`.

- stats_functions:

  A named list defining the functions used for summarizing the data.

- aggregate_func_name:

  A string representing the name of the function used to aggregate
  multiple rows per subject into one.

- denom:

  A string, either "N" or "n", indicating the denominator to use for
  percent (`pct`) calculation.

## Value

A list containing:

- `<stat>[.x]`, ...: One or more statistics calculated from
  `stats_functions`. The `<stat>` part matches the function name. The
  optional `.x` (`.1`, `.2`, etc.) is used when the function returns
  multiple values.

- `subjid`: A list of subject identifiers summarized in the group.
