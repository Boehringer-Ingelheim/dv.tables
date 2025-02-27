# Automatically generated module API check functions. Think twice before editing them manually.
({
# styler: off

# dv.tables::mod_hierarchical_count_table
check_mod_hierarchical_count_table_auto <- function(afmm, datasets, module_id, table_dataset_name, pop_dataset_name,
    subjid_var, show_modal_on_click, default_hierarchy, default_group, intended_use_label, receiver_id,
    warn, err) {
    OK <- logical(0)
    used_dataset_names <- new.env(parent = emptyenv())
    OK[["module_id"]] <- CM$check_module_id("module_id", module_id, warn, err)
    flags <- structure(list(), names = character(0))
    OK[["table_dataset_name"]] <- CM$check_dataset_name("table_dataset_name", table_dataset_name, flags,
        datasets, used_dataset_names, warn, err)
    flags <- structure(list(), names = character(0))
    OK[["pop_dataset_name"]] <- CM$check_dataset_name("pop_dataset_name", pop_dataset_name, flags, datasets,
        used_dataset_names, warn, err)
    subkind <- list(kind = "factor")
    flags <- list(subjid_var = TRUE)
    OK[["subjid_var"]] <- OK[["pop_dataset_name"]] && CM$check_dataset_colum_name("subjid_var", subjid_var,
        subkind, flags, pop_dataset_name, datasets[[pop_dataset_name]], warn, err)
    "NOTE: show_modal_on_click (logical) has no associated automated checks"
    "      The expectation is that it either does not require them or that"
    "      the caller of this function has written manual checks near the call site."
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(zero_or_more = TRUE, optional = TRUE)
    OK[["default_hierarchy"]] <- OK[["table_dataset_name"]] && CM$check_dataset_colum_name("default_hierarchy",
        default_hierarchy, subkind, flags, table_dataset_name, datasets[[table_dataset_name]], warn,
        err)
    subkind <- list(kind = "or", options = list(list(kind = "character"), list(kind = "factor")))
    flags <- list(optional = TRUE)
    OK[["default_group"]] <- OK[["pop_dataset_name"]] && CM$check_dataset_colum_name("default_group",
        default_group, subkind, flags, pop_dataset_name, datasets[[pop_dataset_name]], warn, err)
    "NOTE: intended_use_label (character) has no associated automated checks"
    "      The expectation is that it either does not require them or that"
    "      the caller of this function has written manual checks near the call site."
    "NOTE: receiver_id (character) has no associated automated checks"
    "      The expectation is that it either does not require them or that"
    "      the caller of this function has written manual checks near the call site."
    for (ds_name in names(used_dataset_names)) {
        OK[["subjid_var"]] <- OK[["subjid_var"]] && CM$check_subjid_col(datasets, ds_name, get(ds_name),
            "subjid_var", subjid_var, warn, err)
    }
    return(OK)
}

})
# styler: on
