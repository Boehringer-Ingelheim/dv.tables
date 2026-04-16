# Converts the event table to wide format

Converts the event table to wide format

## Usage

``` r
pivot_wide_format_events_table(d, min_percent = 0)
```

## Arguments

- d:

  `list` A list returned from
  [`compute_events_table()`](compute_events_table.md) containing the
  event data and metadata.

- min_percent:

  `numeric` The minimum percentage threshold for filtering events. Rows
  where the percentage of subjects is below this threshold will be
  removed from the output.

## Value

A list containing:

- `df`: A wide-format data frame with the event counts and percentages
  for each group and hierarchy level.

- `meta`: A list of metadata related to the event table.
