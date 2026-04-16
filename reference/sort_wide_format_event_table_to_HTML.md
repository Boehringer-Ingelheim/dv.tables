# Renders the wide-format event table as an HTML table

Renders the wide-format event table as an HTML table

## Usage

``` r
sort_wide_format_event_table_to_HTML(d, on_cell_click = NULL)
```

## Arguments

- d:

  `list` A list returned from
  [`sort_wider_formatter_events_table()`](sort_wider_formatter_events_table.md)
  containing the sorted wide-format event data and metadata.

- on_cell_click:

  `character(0)` A JavaScript callback function to be executed when a
  table cell is clicked. Default is `NULL`.

## Value

An HTML table generated using
[`shiny::tags`](https://rstudio.github.io/htmltools/reference/builder.html)
and formatted for interactive display.
