# Set several labels in a data frame

Set several labels in a data frame

## Usage

``` r
possibly_set_lbls(df, lbls)
```

## Arguments

- df:

  a data frame.

- lbls:

  a named list. Each entry will have as name the name of a given column
  in df and as value the expected label of the given column. If df has
  no column with the name of the entry, the entry is ignored.

## Value

A data frame with the set labels
