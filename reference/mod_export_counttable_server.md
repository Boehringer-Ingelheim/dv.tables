# Server logic for the export count table

Server logic for the export count table

## Usage

``` r
mod_export_counttable_server(module_id, dataset, intended_use_label)
```

## Arguments

- module_id:

  The ID for the event count module instance.

- dataset:

  A reactive list containing dataset containing the event data and other
  metadata.

- intended_use_label:

  `[character(1)|NULL]`

  Either a string indicating the intended use for export, or NULL. The
  provided label will be displayed prior to the download and will also
  be included in the exported file.

## Value

Event data downloaded as an Excel (`.xlsx`) or Word (`.rtf`) file.

## Functions

- `mod_export_counttable_server()`: This function handles the server
  logic for the export count table.
