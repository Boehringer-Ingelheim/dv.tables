# nolint start
specs <- list()
specs[["hierarchical_count_table"]] <- list(
  "event_count_display" = "The event count module displays event counts grouped by selected hierarchy and population grouping variables. It calculates the number of unique subjects within each group and hierarchy level.",
  "events_table_display" = "A table will be displayed, showing the event counts and the percentage of subjects that meet the criteria for each combination of hierarchy and group variable.",
  "cell_interactivity" = "Each cell in the table supports interactivity. Clicking a cell triggers an action that gives access to the the list of subjects included in the cell.",
  "event_count" = "Counts the number of subjects that had a given event at least once. Its percentage is calculated using as denominator the total number of participants in a given group.",
  "minimum_percentage_filter" = "A minimum percentage filter can be applied to the event table. The filter will hide rows where the percentage of subjects is below the specified threshold.",
  "hierarchy_selection" = "The user can select one or two hierarchy variables from the event dataset.",
  "group_selection" = "The user can select a group variable from the population dataset.",
  "total_column_display" = "The app includes a 'Total' column in the event table, which shows the total event count for all groups combined.",
  "sorted_table_display" = "The event table is sorted by the highest number of subjects with an event within each hierarchy level. The overall hierarchy is ranked based on the highest event counts.",  
  "jumping_feature" = "The module can communicate subject values to other modules."
)

specs[["export_count_table"]] <- list(
  "export_add_new_row" = "Data Preprocessing function for exporting adds a new row at the beginning of the data frame for indicating overall number of patients which is shown in HTML table.",
  "export_replace_special_char" = "There are special characters in the dataframe which shows Total values which doesn't show well in excel. It is replaced by Total.",
  "export_separate_cols" = "The table shows count and relative percentage in the parentheses. It is separated into two columns for exported table.",
  "export_remove_parantheses" = "Continuation of export_separate_cols, the leading and trailing parentheses after column separator is removed from exported table.",
  "export_label_event_cols" = "Each event column for Excel named with event variable name suffixed with an assocoiated label in square-brackets if one exists.",
  "export_indent_values" = "Event columns combined as indented hierarchy of event values.",
  "export_single_n_pct_cols" = "Combined count and percentage kept in single columns for exported table."
)

specs
# nolint end
