# Hierarchical Count Table Module

Hierarchical Count Table Module

## Usage

``` r
mod_hierarchical_count_table(
  module_id,
  table_dataset_name,
  pop_dataset_name,
  subjid_var = "USUBJID",
  show_event_group_by = FALSE,
  show_time_at_risk_options = FALSE,
  show_modal_on_click = TRUE,
  default_hierarchy = NULL,
  default_group = NULL,
  default_total = TRUE,
  default_event_group = NULL,
  default_event_date = NULL,
  default_origin_date = NULL,
  default_censor_date = NULL,
  default_risk = FALSE,
  hierarchy_choices = NULL,
  group_choices = NULL,
  event_group_choices = NULL,
  event_date_choices = NULL,
  origin_date_choices = NULL,
  censor_date_choices = NULL,
  intended_use_label =
    "Use only for internal review and monitoring during the conduct of clinical trials.",
  receiver_id = NULL
)
```

## Arguments

- module_id:

  `[character(1)]`

  Module Shiny id.

- table_dataset_name:

  `[character(1)]`

  Name of the event dataset.

- pop_dataset_name:

  `[character(1)]`

  Name of the population dataset.

- subjid_var:

  `[character(1)]`

  A string representing the subject identifier column in both datasets.

- show_event_group_by:

  `[logical(1)]`

  A flag to indicate whether to show the event by-group selection. This
  takes precedence over `show_time_at_risk_options`, both cannot be
  shown together.

- show_time_at_risk_options:

  `[logical(1)]`

  A flag to indicate whether to show the time at risk related user
  selections (event/origin/censor date selections, and time at risk
  checkbox). This is ignored when `show_event_group_by` is `TRUE`, both
  cannot be shown together.

- show_modal_on_click:

  `[logical(1)]`

  A flag to indicate whether clicking a table cell should display a
  modal dialog with the subject IDs.

- default_hierarchy:

  `[character(1|2)|NULL]`

  A default value for the hierarchy variables selection (optional).

- default_group:

  `[character(1)|NULL]`

  A default value for the group variable selection (optional).

- default_total:

  `[logical(1)]`

  A default value for checkbox determining whether to add a total group
  column.

- default_event_group:

  `[character(1)|NULL]`

  A default value for the event group variable selection.

- default_event_date:

  `[character(1)|NULL]`

  A default value for the event date variable selection (optional). Not
  applicable when `show_time_at_risk_options` is `FALSE`.

- default_origin_date:

  `[character(1)|NULL]`

  A default value for the origin date variable selection (optional). Not
  applicable when `show_time_at_risk_options` is `FALSE`.

- default_censor_date:

  `[character(1)|NULL]`

  A default value for the censor date variable selection (optional). Not
  applicable when `show_time_at_risk_options` is `FALSE`.

- default_risk:

  `[logical(1)]`

  A default value for for checkbox determining whether to calculate time
  at risk. Not applicable when `show_time_at_risk_options` is `FALSE`.

- hierarchy_choices:

  `[character(1+)|NULL]`

  A character vector specifying the possible choices for the hierarchy
  variables selection (optional). If it is not specified then all factor
  and character variables from the event data will be used.

- group_choices:

  `[character(1+)|NULL]`

  A character vector specifying the possible choices for the group
  variable selection (optional). If it is not specified then all factor
  and character variables from the population data will be used.

- event_group_choices:

  `[character(1+)|NULL]`

  A character vector specifying the possible choices for the event group
  variable selection (optional). If it is not specified then all factor
  and character variables from the event data will be used.

- event_date_choices:

  `[character(1+)|NULL]`

  A character vector specifying the possible choices for the event date
  variable selection (optional). If it is not specified then all
  variables of class "Date" from the event data will be used. Not
  applicable when `show_time_at_risk_options` is `FALSE`.

- origin_date_choices:

  `[character(1+)|NULL]`

  A character vector specifying the possible choices for the origin date
  variable selection (optional). If it is not specified then all
  variables of class "Date" from the population data will be used. Not
  applicable when `show_time_at_risk_options` is `FALSE`.

- censor_date_choices:

  `[character(1+)|NULL]`

  A character vector specifying the possible choices for the censor date
  variable selection (optional). If it is not specified then all
  variables of class "Date" from the population data will be used. Not
  applicable when `show_time_at_risk_options` is `FALSE`.

- intended_use_label:

  `[character(1)|NULL]`

  Either a string indicating the intended use for export, or NULL. The
  provided label will be displayed prior to the download and will also
  be included in the exported file.

- receiver_id:

  `[character(1)]`

  Shiny ID of the module receiving the selected subject ID in the data
  listing. This ID must be present in the app or be NULL.
