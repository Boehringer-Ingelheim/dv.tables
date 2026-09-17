# nolint start
specs <- list()

specs[["summary_table"]] <- list(
  summary_table_display = "An HTML summary table is displayed.",
  numerical_summary = "Calculate statistics for numerical analysis variables.",
  categorical_summary = "Calculate count and percent for categorical analysis variables.",
  pop_groups = "Results grouped into columns for one or more variables from population dataset.",
  row_groups = "Results grouped into rows for zero or more variables from analysis dataset.",
  stats_functions = "Statistics can be specified as functions in the call to the app.",
  stats_format = "Statistics can be combined and formatted in the call to the app.",
  stats_labels = "Combined/formatted/unformatted statistics can be labelled in the call to the app.",
  stats_replace = "Regex replacements to combined/formatted statistics can be specified in the call to the app.",
  analysis_var_defaults = "Analysis variable selection defaults can be specified in the call to the app.",
  analysis_var_choices = "Pool of analysis variable choices can be specified in the call to the app.",
  pop_group_var_defaults = "Population group variable selection defaults can be specified in the call to the app.",
  pop_group_var_choices = "Population group pool of variable choices can be specified in the call to the app.",
  row_group_var_defaults = "Row group variable selection defaults can be specified in the call to the app.",
  row_group_var_choices = "Row group pool of variable choices can be specified in the call to the app.",
  expanded_pop_groups = "A subject may have more than one population group value - multiple rows per subject - for crossover, etc.",
  population_flag_vars = "Population flag variables can be specified in the call to the app.",
  total_pop_group = "Total column can optionally be displayed for population groups.",
  total_pop_group_label = "The label of the total column can be specified in the call to the app.",
  drop_categorical_na = "Missing values in population groups, row groups, and categorical analysis can optionally be dropped.",
  drop_numerical_na = "Missing values are dropped from numerical analysis.",
  cell_click = "Clicking a cell reveals the underlying subject identifiers that contribute to the cell result.",
  categorical_n = "A subject count across all categories of a categorical analysis variable can optionally be displayed.",
  denominator = "Either total population size, N, or categorical subject count, n, can be used as denominator for categorical analysis variable percent calculations.",
  row_aggregate = "After grouping, aggregate multiple rows per subject into one using a chosen aggregation function.",
  jumping_feature = "The module can communicate subject values to other modules."
)

specs[["hierarchical_count_table"]] <- list(
  event_count_display = "The event count module displays event counts grouped by selected hierarchy and population grouping variables. It calculates the number of unique subjects within each group and hierarchy level.",
  events_table_display = "A table will be displayed, showing the event counts and the percentage of subjects that meet the criteria for each combination of hierarchy and group variable.",
  cell_interactivity = "Each cell in the table supports interactivity. Clicking a cell triggers an action that gives access to the the list of subjects included in the cell.",
  event_count = "Counts the number of subjects that had a given event at least once. Its percentage is calculated using as denominator the total number of participants in a given group.",
  event_group_by_display = "A table will be displayed, showing counts and percentages, for each combination of hierarchy, group, and event group variable.",
  time_at_risk = "Time at risk and incidence rate are calculated using event, origin and censor dates.",
  time_at_risk_display = "A table will be displayed, showing counts, percentages, time at risk and incidence rate of subjects summarised over two hierarchy levels, and group variable.",
  minimum_percentage_filter = "A minimum percentage filter can be applied to the event table. The filter will hide rows where the percentage of subjects is below the specified threshold.",
  subjid_var_exclusion = "Subject identifier variable is excluded from hierarchy and group variables choices.",
  group_hierarchy_clash = "Alert when the selected group variable is also selected as a hierarchy variable.",
  hierarchy_selection = "The user can select one or two hierarchy variables from the event dataset.",
  group_selection = "The user can select a group variable from the population dataset.",
  total_column_display = "The app includes a 'Total' column in the event table, which shows the total event count for all groups combined.",
  sorted_table_display = "The event table is sorted by the highest number of subjects with an event within each hierarchy level. The overall hierarchy is ranked based on the highest event counts.",
  jumping_feature = "The module can communicate subject values to other modules."
)

specs[["export_count_table"]] <- list(
  export_add_new_row = "Data Preprocessing function for exporting adds a new row at the beginning of the data frame for indicating overall number of patients which is shown in HTML table.",
  export_replace_special_char = "There are special characters in the dataframe which shows Total values which doesn't show well in excel. It is replaced by Total.",
  export_separate_cols = "The table shows count and relative percentage in the parentheses. It is separated into two columns for exported table.",
  export_remove_parantheses = "Continuation of export_separate_cols, the leading and trailing parentheses after column separator is removed from exported table.",
  export_label_event_cols = "Each event column for Excel named with event variable name suffixed with an assocoiated label in square-brackets if one exists.",
  export_indent_values = "Event columns combined as indented hierarchy of event values.",
  export_single_n_pct_cols = "Combined count and percentage kept in single columns for exported table."
)

specs[["export_time_at_risk_table"]] <- list(
  export_tar_add_new_row = "Data Preprocessing function for exporting adds a new row at the beginning of the data frame for indicating overall number of patients which is shown in HTML table.",
  export_tar_replace_special_char = "There are special characters in the dataframe which shows Total values which doesn't show well in excel. It is replaced by Total.",
  export_tar_separate_cols = "The table shows count and relative percentage in the parentheses. It is separated into two columns for exported table.",
  export_tar_remove_parantheses = "Continuation of export_separate_cols, the leading and trailing parentheses after column separator is removed from exported table.",
  export_tar_label_event_cols = "Each event column for Excel named with event variable name suffixed with an assocoiated label in square-brackets if one exists.",
  export_tar_indent_values = "Event columns combined as indented hierarchy of event values.",
  export_tar_single_n_pct_cols = "Combined count and percentage kept in single columns for exported table."
)

specs[["Tplyr_tables"]] <- list(
  framework = "Tplyr table provided in the function correctly renders summary table at initialization.",
  clickevent = "User clicking on summary table generates drilldown using dv.listings module.",
  error = "Clicking in wrong area returns no drill down listing.",
  output_switching = "The user can provide mutliple output, which can be selected in the module.",
  only_listing = " The module can only display a listing without a corresponding table.",
  global_filter = "The module works with the global filter used in dv.manager."
)


specs
# nolint end


# Clicktable initialization, "framework as dv module initialization is correct
# Global filter correctly updates the output summary table
