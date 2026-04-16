# Computes an event table with subject counts and percentages

Computes an event table with subject counts and percentages

## Usage

``` r
compute_events_table(
  event_df,
  pop_df,
  hierarchy = NULL,
  group_var = NULL,
  subjid_var = NULL,
  event_group_var = NULL,
  origin_date_var = NULL,
  censor_date_var = NULL,
  event_date_var = NULL,
  total = TRUE,
  total_group_val = "Total",
  compute_risk = FALSE
)
```

## Arguments

- event_df:

  `data.frame` A data frame containing the event data. It should have
  columns corresponding to subjects, hierarchy levels, and group
  variables.

- pop_df:

  `data.frame` A data frame containing the population data. It must have
  columns corresponding to subjects and group variables.

- hierarchy:

  `character(1|2)` A character vector of column names from `event_df` to
  use as the hierarchy. Can be one or two levels.

- group_var:

  `character(1)` A string representing the column name in `pop_df` used
  for grouping the population data.

- subjid_var:

  `character(1)` A string representing the subject identifier column
  name. This column must be present in both `event_df` and `pop_df`.

- event_group_var:

  `character(1)` A string representing the column name in `event_df`
  used for grouping the event data.

- origin_date_var:

  `character(1)` A string representing the column name in `pop_df`
  holding the origin date (optional).

- censor_date_var:

  `character(1)` A string representing the column name in `pop_df`
  holding the censor date (optional).

- event_date_var:

  `character(1)` A string representing the column name in `event_df`
  holding the event date.

- total:

  `logical(1)` A logical indicating whether to add a total group column.

- total_group_val:

  `character(0|1)` A string representing the value to assign to the
  `group_var` column for totals.

- compute_risk:

  `logical(1)` A logical indicating whether to calculate time at risk
  and incidence rate.

## Value

A list containing:

- `df`: A data frame with the processed event data, including counts and
  percentages.

- `meta`: A list containing metadata related to the hierarchy, group
  variable, and subject counts.
