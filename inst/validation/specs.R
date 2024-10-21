# nolint start
spewcs <- list()
specs[["event_count"]] <- list(
  "event_count_display" = "The event count module displays event counts grouped by selected hierarchy and population grouping variables. It calculates the number of unique subjects within each group and hierarchy level.",
  "events_table_display" = "A table will be displayed, showing the event counts and the percentage of subjects that meet the criteria for each combination of hierarchy and group variable.",
  "cell_interactivity" = "Each cell in the table supports interactivity. Clicking a cell triggers an action that gives access to the the list of subjects included in the cell.",
  "event_count" = "Counts the number of subjects that had a given event at least once. Its percentage is calculated using as denominator the total number of participants in a given group.",  
  "minimum_percentage_filter" = "A minimum percentage filter can be applied to the event table. The filter will hide rows where the percentage of subjects is below the specified threshold.",
  "hierarchy_selection" = "The user can select one or two hierarchy variables from the event dataset.",
  "group_selection" = "The user can select a group variable from the population dataset.",
  "total_column_display" = "The app includes a 'Total' column in the event table, which shows the total event count for all groups combined.",
  "sorted_table_display" = "The event table is sorted by the highest number of subjects with an event within each hierarchy level. The overall hierarchy is ranked based on the highest event counts."
)
specs
# nolint end