# UI for the event count module

UI for the event count module

## Usage

``` r
hierarchical_count_table_ui(
  id,
  show_event_group_by = FALSE,
  show_time_at_risk_options = FALSE,
  default_total = TRUE,
  default_risk = FALSE,
  default_min_percent = 0,
  default_remove_rows_under_min_percent = FALSE,
  enable_smq = FALSE
)
```

## Arguments

- id:

  `[character(0)]`

  The ID for the event count module instance.

- show_event_group_by:

  `[logical(1)]`

  A flag to indicate whether to show the event by-group selection. This
  takes precedence over `show_time_at_risk_options`, both cannot be
  shown together.

- show_time_at_risk_options:

  `[logical(1)]`

  A flag to indicate whether to show the time at risk related user
  selections (event/origin/censor date selections, and time at risk
  checkbox). This is ignored when `show_event_group_by` is `TRUE`, both
  cannot be shown together.

- default_total:

  `[logical(1)]`

  A default value for checkbox determining whether to add a total group
  column.

- default_risk:

  `[logical(1)]`

  A default value for the checkbox determining whether to calculate time
  at risk. Not applicable when `show_time_at_risk_options` is `FALSE`.

- default_min_percent:

  `[numeric(1)]`

  Initial minimum percentage threshold, between 0 and 100. The threshold
  is applied separately to each displayed group cell. Cells below the
  threshold show a dash instead of their count and percentage. The
  default is `0`.

- default_remove_rows_under_min_percent:

  `[logical(1)]`

  Initial setting controlling whether to remove hierarchy rows for which
  no displayed group cell meets `default_min_percent`. When `FALSE`, the
  rows remain visible and only cells below the threshold are replaced by
  a dash.

- enable_smq:

  `[logical(1)]`

  A flag to indicate whether to display the SMQ/UDAEC category filter
  UI. This should be enabled when the server is configured with
  `smq_vars` and `smq_name`.

## Value

A
[`shiny::div`](https://rstudio.github.io/htmltools/reference/builder.html)
containing the user interface for selecting hierarchy, group, and
minimum percentage for event counting.
