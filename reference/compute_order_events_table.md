# Provide hierarchy ordering based on descending counts and alphabetical values

Provide hierarchy ordering based on descending counts and alphabetical
values

## Usage

``` r
compute_order_events_table(d)
```

## Arguments

- d:

  `list` A list returned from
  [`compute_events_table()`](compute_events_table.md) containing the
  event data and metadata.

## Value

A data frame with the event data sorted by subject counts within each
hierarchy level.
