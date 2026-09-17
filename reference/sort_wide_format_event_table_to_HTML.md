# Renders the wide-format event table as an HTML table

Renders the wide-format event table as an HTML table

## Usage

``` r
sort_wide_format_event_table_to_HTML(d, var_labels, on_cell_click = NULL)
```

## Arguments

- d:

  `list` A list returned from
  [`sort_wider_formatter_events_table()`](https://boehringer-ingelheim.github.io/dv.tables/reference/sort_wider_formatter_events_table.md)
  containing the sorted wide-format event data and metadata.

- var_labels:

  `list` A list of variable labels indexed by variable names.

- on_cell_click:

  `character(0)` A JavaScript callback function to be executed when a
  table cell is clicked. Default is `NULL`.

## Value

An HTML table generated using
[`shiny::tags`](https://rstudio.github.io/htmltools/reference/builder.html)
and formatted for interactive display.
