# UI for the event count module

UI for the event count module

## Usage

``` r
hierarchical_count_table_ui(
  id,
  show_event_group_by = FALSE,
  show_time_at_risk_options = FALSE,
  default_total = TRUE,
  default_risk = FALSE
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

  A default value for for checkbox determining whether to calculate time
  at risk. Not applicable when `show_time_at_risk_options` is `FALSE`.

## Value

A
[`shiny::tagList`](https://rstudio.github.io/htmltools/reference/tagList.html)
containing the user interface for selecting hierarchy, group, and
minimum percentage for event counting.
