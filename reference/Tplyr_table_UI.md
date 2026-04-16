# UI for the Tplyr_table module

UI for the Tplyr_table module

## Usage

``` r
Tplyr_table_UI(module_id, output_list)
```

## Arguments

- module_id:

  `[character(1)]` A character string that serves as a unique identifier
  for the module.

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
