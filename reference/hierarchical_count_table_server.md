# Server logic for the event count module

Server logic for the event count module

## Usage

``` r
hierarchical_count_table_server(
  id,
  table_dataset,
  pop_dataset,
  subjid_var,
  show_pop_flag_selection = FALSE,
  show_event_group_by = FALSE,
  show_time_at_risk_options = FALSE,
  show_modal_on_click = TRUE,
  on_sbj_click_fun = function() NULL,
  default_hierarchy = NULL,
  hierarchy_choices = NULL,
  default_group = NULL,
  group_choices = NULL,
  default_pop_flags = NULL,
  pop_flag_choices = NULL,
  default_event_group = NULL,
  event_group_choices = NULL,
  default_event_date = NULL,
  event_date_choices = NULL,
  default_origin_date = NULL,
  origin_date_choices = NULL,
  default_censor_date = NULL,
  censor_date_choices = NULL,
  smq_name = NULL,
  smq_vars = NULL,
  smq_na_label = "Other",
  udaec_name = NULL,
  udaec_list = NULL,
  udaec_na_label = "Other",
  any_event_text = "Participants with any event",
  intended_use_label = NULL
)
```

## Arguments

- id:

  `[character(0)]`

  The ID for the event count module instance.

- table_dataset:

  `[data.frame]`

  A reactive dataset containing the event data.

- pop_dataset:

  `[data.frame]`

  A reactive dataset containing the population data.

- subjid_var:

  `[character(1)]`

  A string representing the participant identifier column in both
  datasets.

- show_pop_flag_selection:

  `[logical(1)]`

  A flag to indicate whether to show the population flag selection.
  Other associated arguments are `default_pop_flags` and
  `pop_flag_choices`.

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
  modal dialog with the participant IDs.

- on_sbj_click_fun:

  `[function]`

  Function to invoke when a participant identifier is clicked

- default_hierarchy:

  `[character(1:4)|NULL]`

  Optional character vector specifying the default hierarchy variables.
  Variables must be columns in `table_dataset_name`. Up to four
  variables can be selected, and their order determines the nesting
  order in the table.

- hierarchy_choices:

  `[character(1+)|NULL]`

  A character vector specifying the possible choices for the hierarchy
  variables selection (optional). If it is not specified then all factor
  and character variables from the event data will be used.

- default_group:

  `[character(1|2)|NULL]`

  A default value for the group variables selection (optional).

- group_choices:

  `[character(1+)|NULL]`

  A character vector specifying the possible choices for the group
  variables selection (optional). If it is not specified then all factor
  and character variables from the population data will be used.

- default_pop_flags:

  `[character(1+) | NULL]`

  A vector of variable names from the population dataset, used as the
  default for selected population flag variables (optional).

  Participants are identified as being within a population when the
  value of the flag variable is `"Y"`.

  Not applicable when `show_pop_flag_selection` is `FALSE`.

- pop_flag_choices:

  `[character(1+) | NULL]`

  A vector of variable names from the population dataset, specifying the
  possible choices for the population flag variables (optional). If it
  is not specified then all `FL` suffixed factor and character variables
  from the population dataset will be used.

  Participants are identified as being within a population when the
  value of the flag variable is `"Y"`.

  Not applicable when `show_pop_flag_selection` is `FALSE`.

- default_event_group:

  `[character(1)|NULL]`

  A default value for the event group variable selection.

- event_group_choices:

  `[character(1+)|NULL]`

  A character vector specifying the possible choices for the event group
  variable selection (optional). If it is not specified then all factor
  and character variables from the event data will be used.

- default_event_date:

  `[character(1)|NULL]`

  A default value for the event date variable selection (optional). Not
  applicable when `show_time_at_risk_options` is `FALSE`.

- event_date_choices:

  `[character(1+)|NULL]`

  A character vector specifying the possible choices for the event date
  variable selection (optional). If it is not specified then all
  variables of class "Date" from the event data will be used. Not
  applicable when `show_time_at_risk_options` is `FALSE`.

- default_origin_date:

  `[character(1)|NULL]`

  A default value for the origin date variable selection (optional). Not
  applicable when `show_time_at_risk_options` is `FALSE`.

- origin_date_choices:

  `[character(1+)|NULL]`

  A character vector specifying the possible choices for the origin date
  variable selection (optional). If it is not specified then all
  variables of class "Date" from the population data will be used. Not
  applicable when `show_time_at_risk_options` is `FALSE`.

- default_censor_date:

  `[character(1)|NULL]`

  A default value for the censor date variable selection (optional). Not
  applicable when `show_time_at_risk_options` is `FALSE`.

- censor_date_choices:

  `[character(1+)|NULL]`

  A character vector specifying the possible choices for the censor date
  variable selection (optional). If it is not specified then all
  variables of class "Date" from the population data will be used. Not
  applicable when `show_time_at_risk_options` is `FALSE`.

- smq_name:

  `[character(1)]`

  Name of the derived SMQ hierarchy variable. The variable is created
  from the columns listed in `smq_vars`. Defaults to `"SMQ"`.

- smq_vars:

  `[character(1+)|NULL]`

  Optional character vector of columns in `table_dataset_name`
  containing SMQ indicators or categories. When supplied together with
  `smq_name`, an additional SMQ hierarchy variable is available for
  selection. If `NULL`, no SMQ hierarchy is created.

- smq_na_label:

  `[character(1)]`

  Label used for the derived SMQ hierarchy variable (`smq_name`) when
  the source values in `smq_vars` are missing/`NA` for a participant.
  Defaults to `"Other"`.

- udaec_name:

  `[character(1)]`

  Name of the derived UDAEC hierarchy variable. Defaults to `"UDAEC"`.
  This argument is used together with `udaec_list`.

- udaec_list:

  `[list|NULL]`

  Optional named list defining UDAEC categories. The names of the list
  are the UDAEC category labels, and must be unique and non-empty. Each
  element must be a list containing at least one of the following
  definitions: No other entries are allowed.

  - `smq_vars`: A character vector of SMQ source column names. These
    columns must also be included in the top-level `smq_vars` argument.

  - `pt_var` and `pt_values`: The event-data column containing preferred
    terms and an atomic vector of values identifying the preferred terms
    for the category. `pt_var` must be a column in `table_dataset_name`,
    and both fields must be supplied together.

  A category may contain either definition or both definitions. The
  `udaec_list` argument requires a non-`NULL` top-level `smq_vars`
  argument, and `udaec_name` defines the name of the derived UDAEC
  hierarchy variable. For example:

      udaec_list <- list(
        "Cardiac disorders" = list(
          smq_vars = "SMQ01NAM",
          pt_var = "AEDECOD",
          pt_values = c("Atrial fibrillation", "Myocardial infarction")
        ),
        "Renal disorders" = list(
          pt_var = "AEDECOD",
          pt_values = c("Acute kidney injury")
        )
      )

  When supplied, the derived UDAEC variable is available as a hierarchy
  selection and its categories can be filtered in the module UI.

- udaec_na_label:

  `[character(1)]`

  Label used for the derived UDAEC hierarchy variable (`udaec_name`) for
  participants that do not match any of the categories defined in
  `udaec_list`. Defaults to `"Other"`.

- any_event_text:

  `[character(1)]`

  A string specifying the text to be displayed in the table row for
  participants with any event. Defaults to
  `"Participants with any event"`.

- intended_use_label:

  `[character(1)|NULL]`

  Either a string indicating the intended use for export, or NULL. The
  provided label will be displayed prior to the download and will also
  be included in the exported file.

## Value

A reactive value containing the list of participant identifiers in the
clicked cell, if applicable.
