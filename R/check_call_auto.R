# Automatically generated module API check functions. Think twice before editing them manually.
({
# styler: off

# dv.tables::mod_hierarchical_count_table
check_mod_hierarchical_count_table_auto <- function(afmm, datasets, module_id, table_dataset_name, pop_dataset_name,
    subjid_var, show_event_group_by, show_time_at_risk_options, show_modal_on_click, default_hierarchy,
    default_group, default_total, default_event_group, default_event_date, default_origin_date, default_censor_date,
    default_risk, hierarchy_choices, group_choices, event_group_choices, event_date_choices, origin_date_choices,
    censor_date_choices, intended_use_label, receiver_id, err) {
    OK <- logical(0)
    used_dataset_names <- new.env(parent = emptyenv())
    OK[["module_id"]] <- CM$check_module_id("module_id", module_id, err)
    flags <- structure(list(), names = character(0))
    OK[["table_dataset_name"]] <- CM$check_dataset_name("table_dataset_name", table_dataset_name, flags,
        datasets, used_dataset_names, err)
    flags <- structure(list(), names = character(0))
    OK[["pop_dataset_name"]] <- CM$check_dataset_name("pop_dataset_name", pop_dataset_name, flags, datasets,
        used_dataset_names, err)
    subkind <- list(kind = "factor")
    flags <- list(subjid_var = TRUE)
    OK[["subjid_var"]] <- OK[["pop_dataset_name"]] && CM$check_dataset_colum_name("subjid_var", subjid_var,
        subkind, flags, pop_dataset_name, datasets[[pop_dataset_name]], err)
    "NOTE: show_event_group_by (logical) has no associated automated checks"
    "      The expectation is that it either does not require them or that"
    "      the caller of this function has written manual checks near the call site."
    "NOTE: show_time_at_risk_options (logical) has no associated automated checks"
    "      The expectation is that it either does not require them or that"
    "      the caller of this function has written manual checks near the call site."
    "NOTE: show_modal_on_click (logical) has no associated automated checks"
    "      The expectation is that it either does not require them or that"
    "      the caller of this function has written manual checks near the call site."
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(zero_or_more = TRUE, optional = TRUE)
    OK[["default_hierarchy"]] <- OK[["table_dataset_name"]] && CM$check_dataset_colum_name("default_hierarchy",
        default_hierarchy, subkind, flags, table_dataset_name, datasets[[table_dataset_name]], err)
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(optional = TRUE)
    OK[["default_group"]] <- OK[["pop_dataset_name"]] && CM$check_dataset_colum_name("default_group",
        default_group, subkind, flags, pop_dataset_name, datasets[[pop_dataset_name]], err)
    "NOTE: default_total (logical) has no associated automated checks"
    "      The expectation is that it either does not require them or that"
    "      the caller of this function has written manual checks near the call site."
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(optional = TRUE)
    OK[["default_event_group"]] <- OK[["table_dataset_name"]] && CM$check_dataset_colum_name("default_event_group",
        default_event_group, subkind, flags, table_dataset_name, datasets[[table_dataset_name]], err)
    subkind <- list(kind = "date")
    flags <- list(optional = TRUE)
    OK[["default_event_date"]] <- OK[["table_dataset_name"]] && CM$check_dataset_colum_name("default_event_date",
        default_event_date, subkind, flags, table_dataset_name, datasets[[table_dataset_name]], err)
    subkind <- list(kind = "date")
    flags <- list(optional = TRUE)
    OK[["default_origin_date"]] <- OK[["pop_dataset_name"]] && CM$check_dataset_colum_name("default_origin_date",
        default_origin_date, subkind, flags, pop_dataset_name, datasets[[pop_dataset_name]], err)
    subkind <- list(kind = "date")
    flags <- list(optional = TRUE)
    OK[["default_censor_date"]] <- OK[["pop_dataset_name"]] && CM$check_dataset_colum_name("default_censor_date",
        default_censor_date, subkind, flags, pop_dataset_name, datasets[[pop_dataset_name]], err)
    "NOTE: default_risk (logical) has no associated automated checks"
    "      The expectation is that it either does not require them or that"
    "      the caller of this function has written manual checks near the call site."
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(zero_or_more = TRUE, optional = TRUE)
    OK[["hierarchy_choices"]] <- OK[["table_dataset_name"]] && CM$check_dataset_colum_name("hierarchy_choices",
        hierarchy_choices, subkind, flags, table_dataset_name, datasets[[table_dataset_name]], err)
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(zero_or_more = TRUE, optional = TRUE)
    OK[["group_choices"]] <- OK[["pop_dataset_name"]] && CM$check_dataset_colum_name("group_choices",
        group_choices, subkind, flags, pop_dataset_name, datasets[[pop_dataset_name]], err)
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(zero_or_more = TRUE, optional = TRUE)
    OK[["event_group_choices"]] <- OK[["table_dataset_name"]] && CM$check_dataset_colum_name("event_group_choices",
        event_group_choices, subkind, flags, table_dataset_name, datasets[[table_dataset_name]], err)
    subkind <- list(kind = "date")
    flags <- list(zero_or_more = TRUE, optional = TRUE)
    OK[["event_date_choices"]] <- OK[["table_dataset_name"]] && CM$check_dataset_colum_name("event_date_choices",
        event_date_choices, subkind, flags, table_dataset_name, datasets[[table_dataset_name]], err)
    subkind <- list(kind = "date")
    flags <- list(zero_or_more = TRUE, optional = TRUE)
    OK[["origin_date_choices"]] <- OK[["pop_dataset_name"]] && CM$check_dataset_colum_name("origin_date_choices",
        origin_date_choices, subkind, flags, pop_dataset_name, datasets[[pop_dataset_name]], err)
    subkind <- list(kind = "date")
    flags <- list(zero_or_more = TRUE, optional = TRUE)
    OK[["censor_date_choices"]] <- OK[["pop_dataset_name"]] && CM$check_dataset_colum_name("censor_date_choices",
        censor_date_choices, subkind, flags, pop_dataset_name, datasets[[pop_dataset_name]], err)
    "NOTE: intended_use_label (character) has no associated automated checks"
    "      The expectation is that it either does not require them or that"
    "      the caller of this function has written manual checks near the call site."
    "NOTE: receiver_id (character) has no associated automated checks"
    "      The expectation is that it either does not require them or that"
    "      the caller of this function has written manual checks near the call site."
    for (ds_name in names(used_dataset_names)) {
        OK[["subjid_var"]] <- OK[["subjid_var"]] && CM$check_subjid_col(datasets, ds_name, get(ds_name),
            "subjid_var", subjid_var, err)
    }
    return(OK)
}

# dv.tables::mod_summary_table
check_mod_summary_table_auto <- function(afmm, datasets, module_id, table_dataset_name, pop_dataset_name,
    subjid_var, show_pop_flag_selection, show_aggregate_method, show_modal_on_click, stats_functions,
    stats_formats, stats_labels, stats_replace, default_summarize_on, default_group_by, default_row_by,
    default_total, default_drop_na, default_drop_empty_rows, default_drop_empty_cols, default_show_category_n,
    default_denom, default_stats, default_aggregate_method, default_pop_flags, default_pop_flags_after_groups,
    choices_summarize_on, choices_group_by, choices_row_by, choices_aggregate_method, choices_pop_flags,
    total_group_val, receiver_id, err) {
    OK <- logical(0)
    used_dataset_names <- new.env(parent = emptyenv())
    OK[["module_id"]] <- CM$check_module_id("module_id", module_id, err)
    flags <- structure(list(), names = character(0))
    OK[["table_dataset_name"]] <- CM$check_dataset_name("table_dataset_name", table_dataset_name, flags,
        datasets, used_dataset_names, err)
    flags <- structure(list(), names = character(0))
    OK[["pop_dataset_name"]] <- CM$check_dataset_name("pop_dataset_name", pop_dataset_name, flags, datasets,
        used_dataset_names, err)
    subkind <- list(kind = "factor")
    flags <- list(subjid_var = TRUE)
    OK[["subjid_var"]] <- OK[["pop_dataset_name"]] && CM$check_dataset_colum_name("subjid_var", subjid_var,
        subkind, flags, pop_dataset_name, datasets[[pop_dataset_name]], err)
    "NOTE: show_pop_flag_selection (logical) has no associated automated checks"
    "      The expectation is that it either does not require them or that"
    "      the caller of this function has written manual checks near the call site."
    "NOTE: show_aggregate_method (logical) has no associated automated checks"
    "      The expectation is that it either does not require them or that"
    "      the caller of this function has written manual checks near the call site."
    "NOTE: show_modal_on_click (logical) has no associated automated checks"
    "      The expectation is that it either does not require them or that"
    "      the caller of this function has written manual checks near the call site."
    "NOTE: stats_functions (character) has no associated automated checks"
    "      The expectation is that it either does not require them or that"
    "      the caller of this function has written manual checks near the call site."
    "NOTE: stats_formats (character) has no associated automated checks"
    "      The expectation is that it either does not require them or that"
    "      the caller of this function has written manual checks near the call site."
    "NOTE: stats_labels (character) has no associated automated checks"
    "      The expectation is that it either does not require them or that"
    "      the caller of this function has written manual checks near the call site."
    "NOTE: stats_replace (character) has no associated automated checks"
    "      The expectation is that it either does not require them or that"
    "      the caller of this function has written manual checks near the call site."
    subkind <- list(kind = "or", options = list(list(kind = "numeric", min = NA, max = NA), list(kind = "integer",
        min = NA, max = NA), list(kind = "character"), list(kind = "factor")))
    flags <- list(one_or_more = TRUE, optional = TRUE)
    OK[["default_summarize_on"]] <- OK[["table_dataset_name"]] && CM$check_dataset_colum_name("default_summarize_on",
        default_summarize_on, subkind, flags, table_dataset_name, datasets[[table_dataset_name]], err)
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(one_or_more = TRUE, optional = TRUE)
    OK[["default_group_by"]] <- OK[["pop_dataset_name"]] && CM$check_dataset_colum_name("default_group_by",
        default_group_by, subkind, flags, pop_dataset_name, datasets[[pop_dataset_name]], err)
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(one_or_more = TRUE, optional = TRUE)
    OK[["default_row_by"]] <- OK[["table_dataset_name"]] && CM$check_dataset_colum_name("default_row_by",
        default_row_by, subkind, flags, table_dataset_name, datasets[[table_dataset_name]], err)
    "NOTE: default_total (logical) has no associated automated checks"
    "      The expectation is that it either does not require them or that"
    "      the caller of this function has written manual checks near the call site."
    "NOTE: default_drop_na (logical) has no associated automated checks"
    "      The expectation is that it either does not require them or that"
    "      the caller of this function has written manual checks near the call site."
    "NOTE: default_drop_empty_rows (logical) has no associated automated checks"
    "      The expectation is that it either does not require them or that"
    "      the caller of this function has written manual checks near the call site."
    "NOTE: default_drop_empty_cols (logical) has no associated automated checks"
    "      The expectation is that it either does not require them or that"
    "      the caller of this function has written manual checks near the call site."
    "NOTE: default_show_category_n (logical) has no associated automated checks"
    "      The expectation is that it either does not require them or that"
    "      the caller of this function has written manual checks near the call site."
    "NOTE: default_denom (character) has no associated automated checks"
    "      The expectation is that it either does not require them or that"
    "      the caller of this function has written manual checks near the call site."
    "NOTE: default_stats (character) has no associated automated checks"
    "      The expectation is that it either does not require them or that"
    "      the caller of this function has written manual checks near the call site."
    "NOTE: default_aggregate_method (character) has no associated automated checks"
    "      The expectation is that it either does not require them or that"
    "      the caller of this function has written manual checks near the call site."
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(one_or_more = TRUE, optional = TRUE)
    OK[["default_pop_flags"]] <- OK[["pop_dataset_name"]] && CM$check_dataset_colum_name("default_pop_flags",
        default_pop_flags, subkind, flags, pop_dataset_name, datasets[[pop_dataset_name]], err)
    "NOTE: default_pop_flags_after_groups (logical) has no associated automated checks"
    "      The expectation is that it either does not require them or that"
    "      the caller of this function has written manual checks near the call site."
    subkind <- list(kind = "or", options = list(list(kind = "numeric", min = NA, max = NA), list(kind = "integer",
        min = NA, max = NA), list(kind = "character"), list(kind = "factor")))
    flags <- list(one_or_more = TRUE, optional = TRUE)
    OK[["choices_summarize_on"]] <- OK[["table_dataset_name"]] && CM$check_dataset_colum_name("choices_summarize_on",
        choices_summarize_on, subkind, flags, table_dataset_name, datasets[[table_dataset_name]], err)
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(one_or_more = TRUE, optional = TRUE)
    OK[["choices_group_by"]] <- OK[["pop_dataset_name"]] && CM$check_dataset_colum_name("choices_group_by",
        choices_group_by, subkind, flags, pop_dataset_name, datasets[[pop_dataset_name]], err)
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(one_or_more = TRUE, optional = TRUE)
    OK[["choices_row_by"]] <- OK[["table_dataset_name"]] && CM$check_dataset_colum_name("choices_row_by",
        choices_row_by, subkind, flags, table_dataset_name, datasets[[table_dataset_name]], err)
    "NOTE: choices_aggregate_method (character) has no associated automated checks"
    "      The expectation is that it either does not require them or that"
    "      the caller of this function has written manual checks near the call site."
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(one_or_more = TRUE, optional = TRUE)
    OK[["choices_pop_flags"]] <- OK[["pop_dataset_name"]] && CM$check_dataset_colum_name("choices_pop_flags",
        choices_pop_flags, subkind, flags, pop_dataset_name, datasets[[pop_dataset_name]], err)
    "NOTE: total_group_val (character) has no associated automated checks"
    "      The expectation is that it either does not require them or that"
    "      the caller of this function has written manual checks near the call site."
    "NOTE: receiver_id (character) has no associated automated checks"
    "      The expectation is that it either does not require them or that"
    "      the caller of this function has written manual checks near the call site."
    for (ds_name in names(used_dataset_names)) {
        OK[["subjid_var"]] <- OK[["subjid_var"]] && CM$check_subjid_col(datasets, ds_name, get(ds_name),
            "subjid_var", subjid_var, err)
    }
    return(OK)
}

})
# styler: on
