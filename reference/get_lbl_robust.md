# Robust getter for data frame labels

It returns the label of the column of a data frame if it is not NULL.
Otherwise it returns the name of the column.

## Usage

``` r
get_lbl_robust(df, var)
```

## Arguments

- df:

  a data frame.

- var:

  a column of the data frame

## Value

The label attribute or the name of the column if the label attribute is
NULL.
