# Process flagged rows in the analysis data creating additional categories

Process flagged rows in the analysis data creating additional categories

## Usage

``` r
process_flagged_rows(
  filtered_df,
  pop_df,
  unfiltered_df,
  flagged_row_processing,
  group_vars,
  row_vars,
  subjid_var
)
```

## Arguments

- filtered_df:

  `[data.frame]` A data frame containing the filtered analysis data.

- pop_df:

  `[data.frame]` A data frame containing the filtered population data.

- unfiltered_df:

  `[data.frame | NULL]` A data frame containing the unfiltered analysis
  data.

- flagged_row_processing:

  `[list(1+) | NULL]` A list of lists defining the processing and
  categorization of flagged rows.

- group_vars:

  `[character(1+)]` A vector of names of population grouping variables.

- row_vars:

  `[character(0+)]` A vector of names of row categorization variables.

- subjid_var:

  `[character(1)]` A string representing the subject identifier column.

## Value

Analysis data frame with additional rows added corresponding to flagged
rows. Flagged row variable names are added to the attribute named
`flagged_row_vars`.
