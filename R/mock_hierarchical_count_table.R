#' Mock hierarchy table app
#' @keywords mock
#' @param dry_run Return parameters used in the call
#' @param update_query_string automatically update query string with app state
#' @param ui_defaults,srv_defaults a list of values passed to the ui/server function
#' @export
mock_app_hierarchical_count_table <- function(dry_run = FALSE,
                                              update_query_string = TRUE,
                                              srv_defaults = list(),
                                              ui_defaults = list()) {

  if (!requireNamespace("pharmaverseadam")) stop("Install pharmaverseadam")

  table_dataset <- shiny::reactive({
    pharmaverseadam::adae |> chr2factor()
  })

  pop_dataset <- shiny::reactive({
    pharmaverseadam::adsl |> chr2factor()
  })

  ui_params <- c(
    list(
      id = "mod"
    ),
    ui_defaults
  )

  srv_params <- c(
    list(
      id = "mod",
      table_dataset = table_dataset,
      pop_dataset = pop_dataset,
      subjid_var = "SUBJID"
    ),
    srv_defaults
  )

  if (dry_run) {
    return(list(ui = ui_params, srv = srv_params))
  }

  mock_app_wrap(
    update_query_string = update_query_string,
    ui = function() do.call(hierarchical_count_table_ui, ui_params),
    server = function() {
      do.call(hierarchical_count_table_server, srv_params)
    }
  )
}

#' Mock hierarchy table app in dv.manager
#' @keywords mock
#' @export
mock_app_hierarchical_count_table_mm <- function() {

  if (!requireNamespace("dv.manager")) stop("Install dv.manager")
  if (!requireNamespace("dv.papo")) stop("Install dv.papo")
  if (!requireNamespace("pharmaverseadam")) stop("Install pharmaverseadam")

  adsl <- pharmaverseadam::adsl |>
    dplyr::filter(!is.na(.data[["RANDDT"]]))

  adae <- pharmaverseadam::adae |>
    dplyr::mutate(SMQ01NAM = ifelse(substr(.data[["AEDECOD"]], 1, 1) == "A", "SMQ 01", NA)) |>
    dplyr::mutate(SMQ02NAM = ifelse(substr(.data[["AEDECOD"]], 2, 2) == "P", "SMQ 02", NA))

  attr(adsl, "meta") <- base::file.info("NEWS.md")
  attr(adae, "meta") <- base::file.info("NEWS.md")

  udaec_list <- list(
    "UDAEC 01" = list(
      smq_vars = c("SMQ01NAM", "SMQ02NAM"),
      pt_var = "AEDECOD",
      pt_values = c("DIZZINESS", "ENURESIS", "DIARRHOEA")
    ),
    "UDAEC 02" = list(
      pt_var = "AEDECOD",
      pt_values = c("DIZZINESS", "ENURESIS", "DIARRHOEA")
    )
  )

  dv.manager::run_app(
    data = list(
      pharmaverseadam = list(adae = adae, adsl = adsl)
    ),
    module_list = list(
      "Hierarchy Table" = mod_hierarchical_count_table(
        module_id = "hier_table",
        table_dataset_name = "adae",
        pop_dataset_name = "adsl",
        show_pop_flag_selection = TRUE,
        show_modal_on_click = TRUE,
        default_hierarchy = c("AEBODSYS", "AEDECOD"),
        default_group = "TRT01P",
        default_total = TRUE,
        receiver_id = "papo"
      ),
      "Time at Risk Hierarchy Table" = mod_hierarchical_count_table(
        module_id = "hier_time_at_risk",
        table_dataset_name = "adae",
        pop_dataset_name = "adsl",
        show_pop_flag_selection = TRUE,
        show_time_at_risk_options = TRUE,
        show_modal_on_click = TRUE,
        default_hierarchy = c("AEBODSYS", "AEDECOD"),
        default_group = "TRT01P",
        default_event_date = "ASTDT",
        default_origin_date = "TRTSDT",
        default_censor_date = "EOSDT",
        default_total = FALSE,
        default_risk = TRUE,
        receiver_id = "papo"
      ),
      "Hierarchy Table by Event Group" = mod_hierarchical_count_table(
        module_id = "hier_event_group",
        table_dataset_name = "adae",
        pop_dataset_name = "adsl",
        show_pop_flag_selection = TRUE,
        show_event_group_by = TRUE,
        show_modal_on_click = TRUE,
        default_hierarchy = c("AEBODSYS", "AEDECOD"),
        default_group = "TRT01P",
        default_total = FALSE,
        default_event_group = "AESEV",
        receiver_id = "papo"
      ),
      "UDAEC/SMQ Hierarchy Table" = mod_hierarchical_count_table(
        module_id = "hier_smq_udaec",
        table_dataset_name = "adae",
        pop_dataset_name = "adsl",
        show_modal_on_click = TRUE,
        default_hierarchy = c("UDAEC", "SMQ", "AEDECOD"),
        default_group = "TRT01P",
        default_total = TRUE,
        smq_vars = c("SMQ01NAM", "SMQ02NAM"),
        udaec_list = udaec_list,
        receiver_id = "papo"
      ),
      "Patient Profile" = dv.papo::mod_patient_profile(
        module_id = "papo",
        subject_level_dataset_name = "adsl",
        subjid_var = "USUBJID",
        sender_ids = c("hier_table", "hier_time_at_risk", "hier_event_group", "hier_smq_udaec"),
        summary = list(vars = c("AGE", "SEX", "RACE", "ETHNIC", "ARM"),
                       column_count = 1)
      )
    ),
    filter_dataset_name = "adsl",
    filter_key = "USUBJID",
    enableBookmarking = "url"
  )
}
