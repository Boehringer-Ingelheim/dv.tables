# Sorts the wide-format event table by the overall subject count ranking

Sorts the wide-format event table by the overall subject count ranking

## Usage

``` r
sort_wider_formatter_events_table(event_d, sort_df)
```

## Arguments

- event_d:

  `list` A list returned from
  [`pivot_wide_format_events_table()`](pivot_wide_format_events_table.md)
  containing the wide-format event data and metadata.

- sort_df:

  `data.frame` A data frame returned from
  [`compute_order_events_table()`](compute_order_events_table.md)
  containing the sorted event data by subject counts.

## Value

A list containing:

- `df`: A sorted wide-format data frame of event counts and percentages.

- `meta`: Metadata updated with the ranking information.
