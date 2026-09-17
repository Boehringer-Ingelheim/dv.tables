# Server logic for the summary table module

Server logic for the summary table module

## Usage

``` r
summary_table_server(
  module_id,
  table_dataset,
  pop_dataset,
  subjid_var,
  show_pop_flag_selection = FALSE,
  show_aggregate_method = FALSE,
  show_modal_on_click = TRUE,
  on_sbj_click_fun = function() NULL,
  stats_functions = NULL,
  stats_formats = NULL,
  stats_labels = NULL,
  stats_replace = NULL,
  default_summarize_on = NULL,
  default_group_by = NULL,
  default_row_by = NULL,
  default_pop_flags = NULL,
  choices_summarize_on = NULL,
  choices_group_by = NULL,
  choices_row_by = NULL,
  choices_pop_flags = NULL,
  total_group_val = "Total",
  allow_aggregation = FALSE
)
```

## Arguments

- module_id:

  `[character(1)]`

  A string that serves as a unique identifier for the module.

- table_dataset:

  `[data.frame]`

  A reactive dataset containing the data for analysis.

- pop_dataset:

  `[data.frame]`

  A reactive dataset containing the population data.

- subjid_var:

  `[character(1)]`

  A string representing the subject identifier column in both datasets.

- show_pop_flag_selection:

  `[logical(1)]`

  A flag to indicate whether to show the population flag selection.
  Other associated arguments are `default_pop_flags` and
  `choices_pop_flags`.

- show_aggregate_method:

  `[logical(1)]`

  A flag to indicate whether to show (and apply) aggregate methods. If
  more than one row per subject exists after population grouping and row
  categorization has been applied then aggreation of those rows can be
  applied using a selected method. Other associated arguments are
  `default_aggregate_method` and `choices_aggregate_method`.

- show_modal_on_click:

  `[logical(1)]`

  A flag to indicate whether clicking a table cell should display a
  modal dialog with the subject IDs.

- on_sbj_click_fun:

  `[function]`

  Function to invoke when a subject is clicked.

- stats_functions:

  `[list(1+) | NULL]`

  A named list defining the functions used for summarizing numerical
  data. The functions must either return a single numeric value (e.g.
  `mean`, [`stats::sd`](https://rdrr.io/r/stats/sd.html), etc.) or a
  vector of numeric values (e.g.
  `\(x) stats::quantile(x, c(0.25, 0.75))`). Note that the functions
  will not be applied to empty groupings, but if a function requires
  more than one data point (e.g.
  [`stats::t.test`](https://rdrr.io/r/stats/t.test.html)) then the error
  cases must be dealt with using a wrapper function; see module
  documentation for further information.

- stats_formats:

  `[list(1+) | NULL]`

  A named list of lists defining the combination and formatting of the
  function results from summarizing numerical data. Each element lists
  the argument values passed to `sprintf`, the result being assigned to
  the element name (internally corresponding to an interim results data
  frame column name). The names from the list elements of
  `stats_functions` correspond to column names that can be used in the
  `sprintf` arguments, but note that if a function returns more than one
  value, those values must be referred to using a dot followed by an
  integer suffix, e.g. if the function named `meanci` returns two values
  then use `"meanci.1"`, and `"meanci.2"`. The name of each element list
  should be a keyword conveying the meaning of the combined statistics,
  e.g. `minmax` for the minimum to maximum range. The name can also be
  the same as the name from `stats_functions`, e.g. `meanci` for the
  mean confidence interval.

  Any results from functions given in `stats_functions` that do not
  appear in the formatting will be automatically formatted as character.

- stats_labels:

  `[list(1+) | NULL]`

  A named vector of statistics labels that should be used in the summary
  table. The names correspond to the names assigned in the
  `stats_formats` list, or otherwise the names in the `stats_functions`
  list.

  Labels apply to UI statistics checkbox labels and table statistics
  labels. Note that if a function defined in `stats_functions` returns
  more than one value, e.g.
  [`stats::quantile`](https://rdrr.io/r/stats/quantile.html), and those
  values are not combined in `stats_formats`, then they appear
  separately in the table statistics, but the UI statistics checkbox
  will reflect the name given to the function definition. Labels can be
  applied to both cases; see module documentation for further
  information.

- stats_replace:

  `[list(1+) | NULL]`

  A named list of lists of `list(pattern =, replacement =)` pairs
  defining replacements that should be applied, in order, to the
  formatted results from `stats_formats`. `pattern` is a regular
  expression matched against the formatted result, and `replacement` is
  the string substituted in. The names of the outer list should match
  the names of the list elements in `stats_formats`.

- default_summarize_on:

  `[character(1+) | NULL]`

  A vector of variable names from the analysis dataset, used as the
  default for selected variables to summarize on (optional).

- default_group_by:

  `[character(1+) | NULL]`

  A vector of variable names from the population dataset, used as the
  default for selected variables to group by (optional).

- default_row_by:

  `[character(1+) | NULL]`

  A vector of variable names from the dataset specified by
  `table_dataset_name`, used as the default for selected variables to
  categorize on (optional).

- default_pop_flags:

  `[character(1+) | NULL]`

  A vector of variable names from the population dataset, used as the
  default for selected population flag variables (optional).

  Subjects are identified as being within a population when the value of
  the flag variable is `"Y"`.

- choices_summarize_on:

  `[character(1+) | NULL]`

  A vector of variable names from the analysis dataset, specifying the
  possible choices for the variables to summarize on (optional). If it
  is not specified then all variables from the analysis dataset,
  excluding `Date` and `POSIXt` class variables, will be used.

- choices_group_by:

  `[character(1+) | NULL]`

  A vector of variable names from the population dataset, specifying the
  possible choices for the variables to group by (optional). If it is
  not specified then all factor and character variables from the
  population dataset will be used.

- choices_row_by:

  `[character(1+) | NULL]`

  A vector of variable names from the analysis dataset, specifying the
  possible choices for the variables to categorize on (optional). If it
  is not specified then all factor and character variables from the
  analysis dataset will be used.

- choices_pop_flags:

  `[character(1+) | NULL]`

  A vector of variable names from the population dataset, specifying the
  possible choices for the population flag variables (optional). If it
  is not specified then all `FL` suffixed factor and character variables
  from the population dataset will be used.

  Subjects are identified as being within a population when the value of
  the flag variable is `"Y"`.

- total_group_val:

  `[character(1)]`

  A string indicating the label for the total group column.

## Value

A reactive value containing the list of subjects in the clicked cell, if
applicable.
