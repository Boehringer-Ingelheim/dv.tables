# Summary Table Module

Summary Table Module

## Usage

    mod_summary_table(
      module_id,
      table_dataset_name,
      pop_dataset_name,
      subjid_var = "USUBJID",
      show_pop_flag_selection = FALSE,
      show_aggregate_method = FALSE,
      show_modal_on_click = TRUE,
      stats_functions = list(
        n = length,
        mean = mean,
        sd = stats::sd,
        meanci = function(x) if (length(x) > 1L) stats::t.test(x, conf.level = 0.95)$conf.int else rep(NA_real_, 2L),
        geomean = function(x) if (all(x > 0)) exp(mean(log(x))) else NaN,
        median = stats::median,
        medianci = function(x) if (length(x) > 1L) stats::wilcox.test(x, exact = FALSE, conf.int = TRUE, conf.level = 0.95)$conf.int else rep(NA_real_, 2L),
        q1q3 = function(x) stats::quantile(x, c(0.25, 0.75)),
        min = min,
        max = max
      ),
      stats_formats = list(
        n = list(fmt = "%d", "n"),
        meansd = list(fmt = "%.1f (%.1f)", "mean", "sd"),
        meanci = list(fmt = "(%.2f, %.2f)", "meanci.1", "meanci.2"),
        geomean = list(fmt = "%.1f", "geomean"),
        median = list(fmt = "%.1f", "median"),
        medianci = list(fmt = "(%.2f, %.2f)", "medianci.1", "medianci.2"),
        q1q3 = list(fmt = "%.1f - %.1f", "q1q3.1", "q1q3.2"),
        minmax = list(fmt = "%.1f - %.1f", "min", "max")
      ),
      stats_labels = c(
        n = "n",
        meansd = "Mean (SD)",
        meanci = "Mean 95% CI",
        geomean = "Geometric Mean",
        median = "Median",
        medianci = "Median 95% CI",
        q1q3 = "25% and 75%-ile",
        minmax = "Min - Max"
      ),
      stats_replace = list(
        n = list(list(pattern = "^NA$", replacement = "0")),
        meansd = list(
          list(pattern = "^NA \(NA\)$", replacement = "—"),
          list(pattern = "\(NA\)$", replacement = sprintf("(%s)", "—"))
        ),
        meanci = list(list(pattern = "^\(NA, NA\)$", replacement = "—")),
        geomean = list(
          list(pattern = "^NA$", replacement = "—"),
          list(pattern = "^NaN$", replacement = "NE")
        ),
        median = list(list(pattern = "^NA$", replacement = "—")),
        medianci = list(list(pattern = "^\(NA, NA\)$", replacement = "—")),
        q1q3 = list(list(pattern = "^NA - NA$", replacement = "—")),
        minmax = list(list(pattern = "^NA - NA$", replacement = "—"))
      ),
      default_summarize_on = NULL,
      choices_summarize_on = NULL,
      default_group_by = NULL,
      choices_group_by = NULL,
      default_row_by = NULL,
      choices_row_by = NULL,
      default_total = TRUE,
      default_drop_na = FALSE,
      default_drop_empty_rows = FALSE,
      default_drop_empty_cols = FALSE,
      default_show_category_n = TRUE,
      default_denom = "N",
      default_stats = c("n", "meansd", "minmax"),
      default_aggregate_method = NULL,
      choices_aggregate_method = c(
        Mean = "mean",
        Minimum = "min",
        Maximum = "max",
        `First Row` = "dplyr::first",
        `Last Row` = "dplyr::last"
      ),
      default_pop_flags = NULL,
      choices_pop_flags = NULL,
      default_pop_flags_after_groups = FALSE,
      total_group_val = "Total",
      receiver_id = NULL
    )

## Arguments

- module_id:

  `[character(1)]`

  A string that serves as a unique identifier for the module.

- table_dataset_name:

  `[character(1)]`

  The name of the analysis dataset to be summarized. This can be the
  same as the population dataset.

- pop_dataset_name:

  `[character(1)]`

  The name of the population dataset. Typically this will have one row
  per subject, but multiple rows per subject is also valid for
  summarizing data where a subject may appear in more than one grouping,
  e.g. for crossover trials where a subject can take different
  treatments in different phases, or for population flag summaries
  (pre-processing of CDISC subject-level data would be required to
  transpose the flags to a grouping column).

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

- choices_summarize_on:

  `[character(1+) | NULL]`

  A vector of variable names from the analysis dataset, specifying the
  possible choices for the variables to summarize on (optional). If it
  is not specified then all variables from the analysis dataset,
  excluding `Date` and `POSIXt` class variables, will be used.

- default_group_by:

  `[character(1+) | NULL]`

  A vector of variable names from the population dataset, used as the
  default for selected variables to group by (optional).

- choices_group_by:

  `[character(1+) | NULL]`

  A vector of variable names from the population dataset, specifying the
  possible choices for the variables to group by (optional). If it is
  not specified then all factor and character variables from the
  population dataset will be used.

- default_row_by:

  `[character(1+) | NULL]`

  A vector of variable names from the dataset specified by
  `table_dataset_name`, used as the default for selected variables to
  categorize on (optional).

- choices_row_by:

  `[character(1+) | NULL]`

  A vector of variable names from the analysis dataset, specifying the
  possible choices for the variables to categorize on (optional). If it
  is not specified then all factor and character variables from the
  analysis dataset will be used.

- default_total:

  `[logical(1)]`

  A flag specifying the default value for the checkbox that determines
  whether to add a total group column.

- default_drop_na:

  `[logical(1)]`

  A flag specifying the default value for the checkbox that determines
  whether to drop NA values from selected 'group by' and 'row by'
  variables.

- default_drop_empty_rows:

  `[logical(1)]`

  A flag specifying the default value for the checkbox that determines
  whether to remove rows with no data from the analysis results.

- default_drop_empty_cols:

  `[logical(1)]`

  A flag specifying the default value for the checkbox that determines
  whether to remove cols with no subject data. analysis results.

- default_show_category_n:

  `[logical(1)]`

  A flag specifying the default value for the checkbox that determines
  whether to show the 'n' category when summarizing categorical data.

- default_denom:

  `["N" | "n"]`

  A string, either "N" or "n", indicating the default of whether the
  denominator for categorical data should be taken as the number of
  subjects from the population grouping ("N") or the number of subjects
  from the 'row by' grouping for each population grouping ("n"). If the
  user selects to drop `NA` values then those values will be excluded
  from determining the "n" denominator.

- default_stats:

  `[character(1+) | NULL]`

  A vector of strings from the names of the list elements in
  `stats_formats` or `stats_functions`, used as the default selection of
  statistics for summarizing numerical data.

- default_aggregate_method:

  `[character(1) | NULL]`

  A string indicating the function name defined in
  `choices_aggregate_method` to use as the default for aggregating rows
  when `show_aggregate_method = TRUE`. The function is applied to the
  analysis variable when more than one row per subject exists after
  population grouping and row categorization has been applied. The
  double colon (`::`) namespace resolution operator can be used to
  specify a function from a specific package, e.g., `"dplyr::first"`.

- choices_aggregate_method:

  `[character(1+) | NULL]`

  A vector of named strings indicating the functions that can be used
  for aggregating rows when `show_aggregate_method = TRUE`. The
  functions apply to the analysis variable when more than one row per
  subject exists after population grouping and row categorization has
  been applied. The double colon (`::`) namespace resolution operator
  can be used to specify functions from specific packages, e.g.,
  `"dplyr::first"`. The names associated to the vector elements are
  displayed in the UI radio button selections.

- default_pop_flags:

  `[character(1+) | NULL]`

  A vector of variable names from the population dataset, used as the
  default for selected population flag variables (optional).

  Subjects are identified as being within a population when the value of
  the flag variable is `"Y"`.

- choices_pop_flags:

  `[character(1+) | NULL]`

  A vector of variable names from the population dataset, specifying the
  possible choices for the population flag variables (optional). If it
  is not specified then all `FL` suffixed factor and character variables
  from the population dataset will be used.

  Subjects are identified as being within a population when the value of
  the flag variable is `"Y"`.

- default_pop_flags_after_groups:

  `[logical(1)]`

  A flag specifying the default value for the checkbox that determines
  whether to show the population flags after the group variables.

- total_group_val:

  `[character(1)]`

  A string indicating the label for the total group column.

- receiver_id:

  `[character(1) | NULL]`

  Unique identifier for the module receiving the selected subject ID in
  the data listing. This ID must be present in the app or be NULL.

## Value

A list containing the following elements to be used by the dv.manager:

- `ui`: Shiny module UI function.

- `server`: Shiny module server function.

- `module_id`: Shiny module unique identifier.
