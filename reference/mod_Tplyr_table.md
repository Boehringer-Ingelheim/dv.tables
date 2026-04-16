# Tplyr table module for DaVinci's module manager

This module integrates Tplyr-based table generation into the DaVinci
module manager framework. It allows users to define and render summary
tables using `Tplyr`, with support for custom table-building functions
and dataset listings.

## Usage

``` r
mod_Tplyr_table(
  module_id,
  output_list,
  subjid_var = "USUBJID",
  default_vars = NULL,
  pagination = NULL,
  intended_use_label =
    "Use only for internal review and monitoring during the conduct of clinical trials.",
  receiver_id = NULL,
  review = NULL,
  title_layout = c("dropdown", "tabs")
)
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

- subjid_var:

  `[character(1) | NULL]` Column corresponding to subject ID. Default
  value is 'USUBJID'.

- default_vars:

  An argument of
  [listings_server](https://boehringer-ingelheim.github.io/dv.listings/reference/listings_UI.html)
  of `{dv.listings}` will be passed through.

- pagination:

  An argument of
  [listings_server](https://boehringer-ingelheim.github.io/dv.listings/reference/listings_UI.html)
  of `{dv.listings}` will be passed through.

- intended_use_label:

  An argument of
  [listings_server](https://boehringer-ingelheim.github.io/dv.listings/reference/listings_UI.html)
  of `{dv.listings}` will be passed through.

- receiver_id:

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

## Examples

``` r
if (FALSE) { # \dontrun{
dm <- pharmaversesdtm::dm
ae <- pharmaversesdtm::ae

my_tplyr_fun <- function(dm) {
  tab <- Tplyr::tplyr_table(dm, ARM) |>
    Tplyr::add_layer(Tplyr::group_desc(AGE, by = "Age (years)")) |>
    Tplyr::add_layer(Tplyr::group_count(SEX, by = "Sex")) |>
    Tplyr::add_layer(Tplyr::group_count(RACE, by = "Race"))
  return(tab)
}

build_func <- function(tab) {
  Tplyr::build(tab, metadata = TRUE) |>
    dplyr::mutate(row_label2 = ifelse(row_label2 == row_label1, "Total (%)", row_label2)) |>
    Tplyr::apply_row_masks(row_breaks = TRUE)
}

my_tplyr_fun2 <- function(dm, ae) {
  dm_arm <- dm |> dplyr::select(USUBJID, ARM)
  ae_arm <- ae |> dplyr::inner_join(dm_arm, by = "USUBJID")

  tab <- Tplyr::tplyr_table(ae_arm, ARM) |>
    Tplyr::set_pop_data(dm) |>
    Tplyr::set_pop_treat_var(ARM) |>
    Tplyr::add_layer(
      Tplyr::group_count("All subjects") |>
        Tplyr::set_distinct_by(USUBJID) |>
        Tplyr::set_format_strings(Tplyr::f_str("xx", distinct_total))
    ) |>
    Tplyr::add_layer(
      Tplyr::group_count("Subjects with adverse events") |>
        Tplyr::set_distinct_by(USUBJID) |>
        Tplyr::set_format_strings(Tplyr::f_str("xx (xx %)", distinct_n, distinct_pct))
    ) |>
    Tplyr::add_layer(
      Tplyr::group_count(AESEV, by = "Adverse event severity") |>
        Tplyr::set_distinct_by(USUBJID) |>
        Tplyr::set_format_strings(Tplyr::f_str("xx (xx %)", distinct_n, distinct_pct))
    ) |>
    Tplyr::add_layer(
      Tplyr::group_count("Subjects with serious AE", where = AESER == "Y") |>
        Tplyr::set_distinct_by(USUBJID) |>
        Tplyr::set_format_strings(Tplyr::f_str("xx (xx %)", distinct_n, distinct_pct))
    )
  return(tab)
}

build_func2 <- function(tab) {
  Tplyr::build(tab, metadata = TRUE) |>
    Tplyr::apply_row_masks(row_breaks = TRUE)
}

output_list <- list(
  "Demographic" = list(
    tplyr_tab_fun = my_tplyr_fun,
    build_fun = build_func
  ),
  "Adverse Events" = list(
    tplyr_tab_fun = my_tplyr_fun2,
    build_fun = build_func
  ),
  "Listing" = list(
    dataset_names = c("dm", "ae")
  )
)

module_list <- list(
  "Table" = dv.tables::mod_Tplyr_table(
    module_id = "tplyr_table",
    output_list = output_list
  )
)

dv.manager::run_app(
  data = list("My data" = list(ae = ae, dm = dm)),
  module_list = module_list,
  filter_data = "dm",
  filter_type = "datasets"
)
} # }
```
