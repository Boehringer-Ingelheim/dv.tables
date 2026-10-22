# Automatically generated module API check functions. Think twice before editing them manually.
({
# styler: off

# dv.tables::mod_hierarchical_count_table
check_mod_hierarchical_count_table_auto <- function(afmm, datasets, module_id, table_dataset_name, pop_dataset_name,
    subjid_var, show_pop_flag_selection, show_event_group_by, show_time_at_risk_options, show_modal_on_click,
    default_hierarchy, hierarchy_choices, default_group, group_choices, default_total, default_min_percent,
    default_remove_rows_under_min_percent, default_pop_flags, pop_flag_choices, default_pop_flags_after_groups,
    default_event_group, event_group_choices, event_group_totals, worst_event_group_vars, default_event_date,
    event_date_choices, default_origin_date, origin_date_choices, default_censor_date, censor_date_choices,
    default_risk, smq_name, smq_vars, smq_na_label, udaec_name, udaec_list, udaec_na_label, any_event_text,
    intended_use_label, receiver_id, err) {
    OK <- logical(0)
    used_dataset_names <- new.env(parent = emptyenv())
    OK[["module_id"]] <- CM$check_module_id("module_id", module_id, err)
    flags <- structure(list(), names = character(0))
    OK[["table_dataset_name"]] <- CM$check_dataset_name("table_dataset_name", table_dataset_name, flags,
        datasets, used_dataset_names, err)
    flags <- structure(list(), names = character(0))
    OK[["pop_dataset_name"]] <- CM$check_dataset_name("pop_dataset_name", pop_dataset_name, flags, datasets,
        used_dataset_names, err)
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(subjid_var = TRUE)
    OK[["subjid_var"]] <- OK[["pop_dataset_name"]] && CM$check_dataset_colum_name("subjid_var", subjid_var,
        subkind, flags, pop_dataset_name, datasets[[pop_dataset_name]], err)
    flags <- structure(list(), names = character(0))
    OK[["show_pop_flag_selection"]] <- CM$check_type("show_pop_flag_selection", show_pop_flag_selection,
        "logical", flags, err)
    flags <- structure(list(), names = character(0))
    OK[["show_event_group_by"]] <- CM$check_type("show_event_group_by", show_event_group_by, "logical",
        flags, err)
    flags <- structure(list(), names = character(0))
    OK[["show_time_at_risk_options"]] <- CM$check_type("show_time_at_risk_options", show_time_at_risk_options,
        "logical", flags, err)
    flags <- structure(list(), names = character(0))
    OK[["show_modal_on_click"]] <- CM$check_type("show_modal_on_click", show_modal_on_click, "logical",
        flags, err)
    "NOTE: default_hierarchy (character) tagged as \"manual_check\""
    "      The expectation is that it either does not require automated checks or that"
    "      the caller of this function has written manual checks near the call site."
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(zero_or_more = TRUE, optional = TRUE)
    OK[["hierarchy_choices"]] <- OK[["table_dataset_name"]] && CM$check_dataset_colum_name("hierarchy_choices",
        hierarchy_choices, subkind, flags, table_dataset_name, datasets[[table_dataset_name]], err)
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(optional = TRUE)
    OK[["default_group"]] <- OK[["pop_dataset_name"]] && CM$check_dataset_colum_name("default_group",
        default_group, subkind, flags, pop_dataset_name, datasets[[pop_dataset_name]], err)
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(zero_or_more = TRUE, optional = TRUE)
    OK[["group_choices"]] <- OK[["pop_dataset_name"]] && CM$check_dataset_colum_name("group_choices",
        group_choices, subkind, flags, pop_dataset_name, datasets[[pop_dataset_name]], err)
    flags <- structure(list(), names = character(0))
    OK[["default_total"]] <- CM$check_type("default_total", default_total, "logical", flags, err)
    "NOTE: default_min_percent (numeric) has no associated automated checks"
    "      The expectation is that it either does not require them or that"
    "      the caller of this function has written manual checks near the call site."
    flags <- structure(list(), names = character(0))
    OK[["default_remove_rows_under_min_percent"]] <- CM$check_type("default_remove_rows_under_min_percent",
        default_remove_rows_under_min_percent, "logical", flags, err)
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(zero_or_more = TRUE, optional = TRUE)
    OK[["default_pop_flags"]] <- OK[["pop_dataset_name"]] && CM$check_dataset_colum_name("default_pop_flags",
        default_pop_flags, subkind, flags, pop_dataset_name, datasets[[pop_dataset_name]], err)
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(zero_or_more = TRUE, optional = TRUE)
    OK[["pop_flag_choices"]] <- OK[["pop_dataset_name"]] && CM$check_dataset_colum_name("pop_flag_choices",
        pop_flag_choices, subkind, flags, pop_dataset_name, datasets[[pop_dataset_name]], err)
    flags <- structure(list(), names = character(0))
    OK[["default_pop_flags_after_groups"]] <- CM$check_type("default_pop_flags_after_groups", default_pop_flags_after_groups,
        "logical", flags, err)
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(optional = TRUE)
    OK[["default_event_group"]] <- OK[["table_dataset_name"]] && CM$check_dataset_colum_name("default_event_group",
        default_event_group, subkind, flags, table_dataset_name, datasets[[table_dataset_name]], err)
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(zero_or_more = TRUE, optional = TRUE)
    OK[["event_group_choices"]] <- OK[["table_dataset_name"]] && CM$check_dataset_colum_name("event_group_choices",
        event_group_choices, subkind, flags, table_dataset_name, datasets[[table_dataset_name]], err)
    flags <- list(one_or_more = TRUE, optional = TRUE)
    OK[["event_group_totals"]] <- CM$check_type("event_group_totals", event_group_totals, "character",
        flags, err)
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(zero_or_more = TRUE, optional = TRUE)
    OK[["worst_event_group_vars"]] <- OK[["table_dataset_name"]] && CM$check_dataset_colum_name("worst_event_group_vars",
        worst_event_group_vars, subkind, flags, table_dataset_name, datasets[[table_dataset_name]], err)
    subkind <- list(kind = "date")
    flags <- list(optional = TRUE)
    OK[["default_event_date"]] <- OK[["table_dataset_name"]] && CM$check_dataset_colum_name("default_event_date",
        default_event_date, subkind, flags, table_dataset_name, datasets[[table_dataset_name]], err)
    subkind <- list(kind = "date")
    flags <- list(zero_or_more = TRUE, optional = TRUE)
    OK[["event_date_choices"]] <- OK[["table_dataset_name"]] && CM$check_dataset_colum_name("event_date_choices",
        event_date_choices, subkind, flags, table_dataset_name, datasets[[table_dataset_name]], err)
    subkind <- list(kind = "date")
    flags <- list(optional = TRUE)
    OK[["default_origin_date"]] <- OK[["pop_dataset_name"]] && CM$check_dataset_colum_name("default_origin_date",
        default_origin_date, subkind, flags, pop_dataset_name, datasets[[pop_dataset_name]], err)
    subkind <- list(kind = "date")
    flags <- list(zero_or_more = TRUE, optional = TRUE)
    OK[["origin_date_choices"]] <- OK[["pop_dataset_name"]] && CM$check_dataset_colum_name("origin_date_choices",
        origin_date_choices, subkind, flags, pop_dataset_name, datasets[[pop_dataset_name]], err)
    subkind <- list(kind = "date")
    flags <- list(optional = TRUE)
    OK[["default_censor_date"]] <- OK[["pop_dataset_name"]] && CM$check_dataset_colum_name("default_censor_date",
        default_censor_date, subkind, flags, pop_dataset_name, datasets[[pop_dataset_name]], err)
    subkind <- list(kind = "date")
    flags <- list(zero_or_more = TRUE, optional = TRUE)
    OK[["censor_date_choices"]] <- OK[["pop_dataset_name"]] && CM$check_dataset_colum_name("censor_date_choices",
        censor_date_choices, subkind, flags, pop_dataset_name, datasets[[pop_dataset_name]], err)
    flags <- structure(list(), names = character(0))
    OK[["default_risk"]] <- CM$check_type("default_risk", default_risk, "logical", flags, err)
    flags <- list(optional = TRUE)
    OK[["smq_name"]] <- CM$check_type("smq_name", smq_name, "character", flags, err)
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(zero_or_more = TRUE, optional = TRUE)
    OK[["smq_vars"]] <- OK[["table_dataset_name"]] && CM$check_dataset_colum_name("smq_vars", smq_vars,
        subkind, flags, table_dataset_name, datasets[[table_dataset_name]], err)
    flags <- list(optional = TRUE)
    OK[["smq_na_label"]] <- CM$check_type("smq_na_label", smq_na_label, "character", flags, err)
    flags <- list(optional = TRUE)
    OK[["udaec_name"]] <- CM$check_type("udaec_name", udaec_name, "character", flags, err)
    "NOTE: udaec_list (character) tagged as \"manual_check\""
    "      The expectation is that it either does not require automated checks or that"
    "      the caller of this function has written manual checks near the call site."
    flags <- list(optional = TRUE)
    OK[["udaec_na_label"]] <- CM$check_type("udaec_na_label", udaec_na_label, "character", flags, err)
    "NOTE: any_event_text (character) tagged as \"manual_check\""
    "      The expectation is that it either does not require automated checks or that"
    "      the caller of this function has written manual checks near the call site."
    flags <- list(optional = TRUE)
    OK[["intended_use_label"]] <- CM$check_type("intended_use_label", intended_use_label, "character",
        flags, err)
    flags <- list(optional = TRUE)
    OK[["receiver_id"]] <- CM$check_type("receiver_id", receiver_id, "character", flags, err)
    for (ds_name in names(used_dataset_names)) {
        OK[["subjid_var"]] <- OK[["subjid_var"]] && CM$check_subjid_col(datasets, ds_name, get(ds_name),
            "subjid_var", subjid_var, err)
    }
    return(OK)
}

# dv.tables::mod_summary_table
check_mod_summary_table_auto <- function(afmm, datasets, module_id, table_dataset_name, pop_dataset_name,
    subjid_var, show_pop_flag_selection, show_aggregate_method, show_modal_on_click, stats_functions,
    stats_formats, stats_labels, stats_replace, default_summarize_on, choices_summarize_on, default_group_by,
    choices_group_by, default_row_by, choices_row_by, default_total, default_drop_na, default_drop_empty_rows,
    default_drop_empty_cols, default_show_category_n, default_denom, default_stats, default_aggregate_method,
    choices_aggregate_method, default_pop_flags, choices_pop_flags, default_pop_flags_after_groups, flagged_row_processing,
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
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(subjid_var = TRUE)
    OK[["subjid_var"]] <- OK[["pop_dataset_name"]] && CM$check_dataset_colum_name("subjid_var", subjid_var,
        subkind, flags, pop_dataset_name, datasets[[pop_dataset_name]], err)
    flags <- structure(list(), names = character(0))
    OK[["show_pop_flag_selection"]] <- CM$check_type("show_pop_flag_selection", show_pop_flag_selection,
        "logical", flags, err)
    flags <- structure(list(), names = character(0))
    OK[["show_aggregate_method"]] <- CM$check_type("show_aggregate_method", show_aggregate_method, "logical",
        flags, err)
    flags <- structure(list(), names = character(0))
    OK[["show_modal_on_click"]] <- CM$check_type("show_modal_on_click", show_modal_on_click, "logical",
        flags, err)
    "NOTE: stats_functions (group) tagged as \"manual_check\""
    "      The expectation is that it either does not require automated checks or that"
    "      the caller of this function has written manual checks near the call site."
    "NOTE: stats_formats (group) unsupported as the check generator cannot handle nested elements yet"
    "      The expectation is that it either does not require automated checks or that"
    "      the caller of this function has written manual checks near the call site."
    flags <- list(zero_or_more = TRUE)
    OK[["stats_labels"]] <- CM$check_type("stats_labels", stats_labels, "character", flags, err)
    "NOTE: stats_replace (group) unsupported as the check generator cannot handle nested elements yet"
    "      The expectation is that it either does not require automated checks or that"
    "      the caller of this function has written manual checks near the call site."
    subkind <- list(kind = "or", options = list(list(kind = "numeric", min = NA, max = NA), list(kind = "integer",
        min = NA, max = NA), list(kind = "character"), list(kind = "factor")))
    flags <- list(one_or_more = TRUE, optional = TRUE)
    OK[["default_summarize_on"]] <- OK[["table_dataset_name"]] && CM$check_dataset_colum_name("default_summarize_on",
        default_summarize_on, subkind, flags, table_dataset_name, datasets[[table_dataset_name]], err)
    subkind <- list(kind = "or", options = list(list(kind = "numeric", min = NA, max = NA), list(kind = "integer",
        min = NA, max = NA), list(kind = "character"), list(kind = "factor")))
    flags <- list(one_or_more = TRUE, optional = TRUE)
    OK[["choices_summarize_on"]] <- OK[["table_dataset_name"]] && CM$check_dataset_colum_name("choices_summarize_on",
        choices_summarize_on, subkind, flags, table_dataset_name, datasets[[table_dataset_name]], err)
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(one_or_more = TRUE, optional = TRUE)
    OK[["default_group_by"]] <- OK[["pop_dataset_name"]] && CM$check_dataset_colum_name("default_group_by",
        default_group_by, subkind, flags, pop_dataset_name, datasets[[pop_dataset_name]], err)
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(one_or_more = TRUE, optional = TRUE)
    OK[["choices_group_by"]] <- OK[["pop_dataset_name"]] && CM$check_dataset_colum_name("choices_group_by",
        choices_group_by, subkind, flags, pop_dataset_name, datasets[[pop_dataset_name]], err)
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(one_or_more = TRUE, optional = TRUE)
    OK[["default_row_by"]] <- OK[["table_dataset_name"]] && CM$check_dataset_colum_name("default_row_by",
        default_row_by, subkind, flags, table_dataset_name, datasets[[table_dataset_name]], err)
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(one_or_more = TRUE, optional = TRUE)
    OK[["choices_row_by"]] <- OK[["table_dataset_name"]] && CM$check_dataset_colum_name("choices_row_by",
        choices_row_by, subkind, flags, table_dataset_name, datasets[[table_dataset_name]], err)
    flags <- structure(list(), names = character(0))
    OK[["default_total"]] <- CM$check_type("default_total", default_total, "logical", flags, err)
    flags <- structure(list(), names = character(0))
    OK[["default_drop_na"]] <- CM$check_type("default_drop_na", default_drop_na, "logical", flags, err)
    flags <- structure(list(), names = character(0))
    OK[["default_drop_empty_rows"]] <- CM$check_type("default_drop_empty_rows", default_drop_empty_rows,
        "logical", flags, err)
    flags <- structure(list(), names = character(0))
    OK[["default_drop_empty_cols"]] <- CM$check_type("default_drop_empty_cols", default_drop_empty_cols,
        "logical", flags, err)
    flags <- structure(list(), names = character(0))
    OK[["default_show_category_n"]] <- CM$check_type("default_show_category_n", default_show_category_n,
        "logical", flags, err)
    flags <- structure(list(), names = character(0))
    OK[["default_denom"]] <- CM$check_type("default_denom", default_denom, "character", flags, err)
    flags <- list(zero_or_more = TRUE)
    OK[["default_stats"]] <- CM$check_type("default_stats", default_stats, "character", flags, err)
    flags <- list(zero_or_more = TRUE)
    OK[["default_aggregate_method"]] <- CM$check_type("default_aggregate_method", default_aggregate_method,
        "character", flags, err)
    flags <- list(zero_or_more = TRUE)
    OK[["choices_aggregate_method"]] <- CM$check_type("choices_aggregate_method", choices_aggregate_method,
        "character", flags, err)
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(one_or_more = TRUE, optional = TRUE)
    OK[["default_pop_flags"]] <- OK[["pop_dataset_name"]] && CM$check_dataset_colum_name("default_pop_flags",
        default_pop_flags, subkind, flags, pop_dataset_name, datasets[[pop_dataset_name]], err)
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(one_or_more = TRUE, optional = TRUE)
    OK[["choices_pop_flags"]] <- OK[["pop_dataset_name"]] && CM$check_dataset_colum_name("choices_pop_flags",
        choices_pop_flags, subkind, flags, pop_dataset_name, datasets[[pop_dataset_name]], err)
    flags <- structure(list(), names = character(0))
    OK[["default_pop_flags_after_groups"]] <- CM$check_type("default_pop_flags_after_groups", default_pop_flags_after_groups,
        "logical", flags, err)
    "NOTE: flagged_row_processing (group) unsupported as the check generator cannot handle nested elements yet"
    "      The expectation is that it either does not require automated checks or that"
    "      the caller of this function has written manual checks near the call site."
    flags <- structure(list(), names = character(0))
    OK[["total_group_val"]] <- CM$check_type("total_group_val", total_group_val, "character", flags,
        err)
    flags <- list(optional = TRUE)
    OK[["receiver_id"]] <- CM$check_type("receiver_id", receiver_id, "character", flags, err)
    for (ds_name in names(used_dataset_names)) {
        OK[["subjid_var"]] <- OK[["subjid_var"]] && CM$check_subjid_col(datasets, ds_name, get(ds_name),
            "subjid_var", subjid_var, err)
    }
    return(OK)
}

})
# styler: on
