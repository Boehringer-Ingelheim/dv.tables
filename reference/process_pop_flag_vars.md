# Transpose population flag variables into single group variable subsetting on "Y" values

Transpose population flag variables into single group variable
subsetting on "Y" values

## Usage

``` r
process_pop_flag_vars(pop_df, pop_flag_vars)
```

## Arguments

- pop_df:

  A data frame containing the population data.

- pop_flag_vars:

  A vector of population flag variable names.

## Value

Population data frame with `.pop_group` and `.pop_flag` added.
