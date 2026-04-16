# Preprocess table for download as Excel (.xlsx) or Word (.rtf)

Preprocess table for download as Excel (.xlsx) or Word (.rtf)

## Usage

``` r
preprocess_download_table(count_table, download_type, split_columns)
```

## Arguments

- count_table:

  A reactive list containing dataset containing the event data and other
  metadata.

- download_type:

  A string specifying the download type as a file extension, either
  `.xlsx` for Excel or `.rtf` for Word.

- split_columns:

  A logical indicating if count and percent should be split into
  separate columns.

## Value

Processed data frame.

## Details

Each entry in the group columns of the `count_table` data frame is a
2-element list of `count` (formatted as count and percent) and
`subjid` - the count and percent information is extracted into the
processed data.

Overall patient numbers are extracted from the metadata and added as a
separate line at the beginning.

If the option to split count and percentage into separate columns is
selected, then the column with the count will be suffixed with `" [N]"`
and the column with the percentage will be suffixed with `" [%]"`.

When processing data for Word, dual event columns are merged into an
indented hierarchy of event values.
