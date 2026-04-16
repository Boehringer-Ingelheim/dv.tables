# Function to rename columns Replaces any column name that starts with "row_label" with an empty string. Removes everything before the underscore for columns starting with "var" followed by one or more digits and an underscore.

Function to rename columns Replaces any column name that starts with
"row_label" with an empty string. Removes everything before the
underscore for columns starting with "var" followed by one or more
digits and an underscore.

## Usage

``` r
rename_columns(column_names)
```

## Arguments

- column_names:

  vector of column names

## Value

modified column names.
