# Create HTML summary table

Create HTML summary table

## Usage

``` r
summtab_html_table(summtab_list, var_labels, on_cell_click = NULL)
```

## Arguments

- summtab_list:

  A list of the data frame of the analysed data and metadata from
  [`summtab_compute()`](https://boehringer-ingelheim.github.io/dv.tables/reference/summtab_compute.md).

- var_labels:

  A list of variable labels indexed by variable names.

- on_cell_click:

  A string holding the JavaScript callback function to be executed when
  a table cell is clicked.

## Value

An HTML table generated using
[`shiny::tags`](https://rstudio.github.io/htmltools/reference/builder.html)
and formatted for interactive display.
