# Converts the event table to wide format

Converts the event table to wide format

## Usage

``` r
pivot_wide_format_events_table(
  d,
  min_percent = 0,
  remove_rows_under_min_pct = FALSE
)
```

## Arguments

- d:

  `list` A list returned from
  [`compute_events_table()`](https://boehringer-ingelheim.github.io/dv.tables/reference/compute_events_table.md)
  containing the event data and metadata.

- min_percent:

  `numeric` The minimum percentage threshold for filtering events. Rows
  where the percentage of subjects is below this threshold will have
  their cell values replaced with a dash instead of being shown.

- remove_rows_under_min_pct:

  `logical(1)` Whether to remove entire rows (across all groups) for
  which every group's percentage of subjects falls below `min_percent`,
  instead of just replacing the cell values for those rows with a dash.

## Value

A list containing:

- `df`: A wide-format data frame with the event counts and percentages
  for each group and hierarchy level.

- `meta`: A list of metadata related to the event table.
