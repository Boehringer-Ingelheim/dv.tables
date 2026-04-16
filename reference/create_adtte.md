# Perform count and time at risk analysis on hierarchical data

Perform count and time at risk analysis on hierarchical data

## Usage

``` r
create_adtte(
  event_df,
  pop_df,
  hierarchy = character(),
  group_var,
  subjid_var,
  event_group_var,
  origin_date_var,
  censor_date_var,
  event_date_var
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
  holding the origin date.

- censor_date_var:

  `character(1)` A string representing the column name in `pop_df`
  holding the censor date.

- event_date_var:

  `character(1)` A string representing the column name in `event_df`
  holding the event date.

## Value

A data frame loosely based on ADaM ADTTE format, with count and time at
risk analysis for all hierarchy levels.
