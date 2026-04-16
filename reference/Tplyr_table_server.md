# Server for the Tplyr_table module

Server for the Tplyr_table module

## Usage

``` r
Tplyr_table_server(
  module_id,
  dataset_list,
  output_list,
  dataset_metadata,
  subjid_var,
  default_vars,
  intended_use_label,
  pagination,
  on_sbj_click = NULL,
  review = NULL,
  title_layout = c("dropdown", "tabs")
)
```

## Arguments

- module_id:

  `[character(1)]` A character string that serves as a unique identifier
  for the module.

- dataset_list:

  `[shiny::reactive(list(data.frame))]` A reactive list of
  data.frame-like dataset(s) that will be used to create the table and
  the listing(s).

- output_list:

  `[list(list())]` A named list defining the outputs to be generated.
  Each element of the list corresponds to a table or listing and must be
  a named list with one of the following structures:

  For summary tables:

  tplyr_tab_fun

  :   A function that takes one or more datasets as input and returns a
      `tplyr_table` object.

  build_fun

  :   A function that takes the `tplyr_table` object and returns a built
      table (typically using
      [`Tplyr::build()`](https://rdrr.io/pkg/Tplyr/man/build.html)). The
      metadata argument of
      [`Tplyr::build()`](https://rdrr.io/pkg/Tplyr/man/build.html) needs
      to be set to `TRUE`, so that the corresponding listing can be
      shown.

  For listings:

  dataset_names

  :   A character vector of dataset names required to generate the
      listing.

  The names of the top-level list elements are used as identifiers for
  the outputs.

- dataset_metadata:

  `[list(character(1), character(1+))]` A list with the following two
  elements: `dataset_metadata$name()` containing a reactive string
  specifying the name of the selected dataset and
  `dataset_metadata$date_range()` containing a reactive character vector
  with two entries specifying the earliest and latest modification date
  in the dataset. Usually obtained from the module manager.

- subjid_var:

  `[character(1) | NULL]` Column corresponding to subject ID. Default
  value is 'USUBJID'.

- default_vars:

  An argument of
  [listings_server](https://boehringer-ingelheim.github.io/dv.listings/reference/listings_UI.html)
  of `{dv.listings}` will be passed through.

- intended_use_label:

  An argument of
  [listings_server](https://boehringer-ingelheim.github.io/dv.listings/reference/listings_UI.html)
  of `{dv.listings}` will be passed through.

- pagination:

  An argument of
  [listings_server](https://boehringer-ingelheim.github.io/dv.listings/reference/listings_UI.html)
  of `{dv.listings}` will be passed through.

- on_sbj_click:

  An argument of
  [listings_server](https://boehringer-ingelheim.github.io/dv.listings/reference/listings_UI.html)
  of `{dv.listings}` will be passed through.

- review:

  An argument of
  [listings_server](https://boehringer-ingelheim.github.io/dv.listings/reference/listings_UI.html)
  of `{dv.listings}` will be passed through.

- title_layout:

  `[character(1)]` A character string defining how users can select the
  outputs in `output_list`. Supported values are:

  "dropdown" (default)

  :   Renders the current interactive title with a drop-down selector.

  "tabs"

  :   Renders a horizontal `tabsetPanel` with one tab per entry in
      `output_list`. Tabs will wrap to the next line if there are many.
      The rest of the module behavior is unchanged.
