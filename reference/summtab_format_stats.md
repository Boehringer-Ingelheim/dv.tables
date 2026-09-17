# Combine and format calculated statistics using provided templates

Combine and format calculated statistics using provided templates

## Usage

``` r
summtab_format_stats(analysis_df, stats_fmts, replace, stats_element_names)
```

## Arguments

- analysis_df:

  A data frame containing the analysis data with statistics elements in
  separate columns.

- stats_fmts:

  A named list of lists defining the combination and formatting of the
  statistics elements from `analysis_df`. Each element of `stats_fmts`
  lists the argument values passed to `sprintf`, the result being
  assigned to the element name.

- replace:

  A named list of lists of `list(pattern =, replacement =)` pairs,
  applied in order to the formatted results from `stats_fmts` (`pattern`
  is a regular expression matched against the formatted result;
  `replacement` is the string to substitute in). The names of the outer
  list should match the names of the list elements in `stats_fmts`.

- stats_element_names:

  A vector of all statistics element names, used to determine elements
  that have not been used in `stats_fmts` and therefore have basic
  formatting applied (conversion to character).

## Value

A data frame of combined and formatted statistics.
