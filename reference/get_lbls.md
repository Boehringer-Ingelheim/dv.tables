# Get all labels from a data frame

It will try to read the label attribute from each of the columns.

## Usage

``` r
get_lbls(df)

get_lbls_robust(df)
```

## Arguments

- df:

  a data frame.

## Value

A named list in which name is the name of the df column and value is the
label of the column. Non-labelled columns will return NULL. In the
robust version NULL is replaced by the name of the column.

## Functions

- `get_lbls_robust()`: robust
