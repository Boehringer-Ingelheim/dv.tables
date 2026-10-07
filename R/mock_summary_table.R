# Summary table mock apps ----

#' Mock summary table app
#'
#' @param dry_run Return parameters used in the call
#' @param update_query_string automatically update query string with app state
#' @param ui_defaults,srv_defaults a list of values passed to the ui/server function
#'
#' @keywords mock
#' @export
mock_app_summary_table <- function(dry_run = FALSE,
                                   update_query_string = TRUE,
                                   srv_defaults = list(),
                                   ui_defaults = list()) {

  if (!requireNamespace("pharmaverseadam")) stop("Install pharmaverseadam")

  table_dataset <- shiny::reactive({
    pharmaverseadam::adlb |>
      dplyr::filter(.data[["LBTESTCD"]] %in% c("ALP", "ALT", "AST", "BILI"),
                    .data[["AVISITN"]] %in% c(0, 4, 5, 7)) |>
      chr2factor()
  })

  pop_dataset <- shiny::reactive({
    pharmaverseadam::adsl |> chr2factor()
  })

  ui_params <- c(
    list(
      module_id = "mod"
    ),
    ui_defaults
  )

  srv_params <- c(
    list(
      module_id = "mod",
      table_dataset = table_dataset,
      pop_dataset = pop_dataset,
      subjid_var = "USUBJID"
    ),
    srv_defaults
  )

  if (dry_run) {
    return(list(ui = ui_params, srv = srv_params))
  }

  mock_app_wrap(
    update_query_string = update_query_string,
    ui = function() do.call(summary_table_ui, ui_params),
    server = function() do.call(summary_table_server, srv_params)
  )
}

#' Mock summary table app integrated in the `{dv.manager}` module manager framework
#'
#' @keywords mock
#' @export
mock_app_summary_table_mm <- function() {

  if (!requireNamespace("dv.manager")) stop("Install dv.manager")
  if (!requireNamespace("dv.papo")) stop("Install dv.papo")
  if (!requireNamespace("pharmaverseadam")) stop("Install pharmaverseadam")

  adsl <- pharmaverseadam::adsl |>
    dplyr::mutate(ENRLFL = "Y",
                  TRTFL = ifelse(is.na(TRTSDT), "N", "Y"),
                  RANDFL = ifelse(is.na(RANDDT), "N", "Y"),
                  DISCFL = ifelse(EOSSTT == "DISCONTINUED", "Y", "N"))

  adsl[["COUNTRY"]] <- ifelse(as.numeric(adsl[["SITEID"]]) < 715, adsl[["COUNTRY"]], "Canada")

  attr(adsl, "meta") <- base::file.info("NEWS.md")
  attr(adsl[["ENRLFL"]], "label") <- "Enrolled Flag"
  attr(adsl[["RANDFL"]], "label") <- "Randomized Flag"
  attr(adsl[["TRTFL"]], "label") <- "Treated Flag"
  attr(adsl[["DISCFL"]], "label") <- "Discontinued Flag"

  adlb <- pharmaverseadam::adlb |>
    dplyr::filter(.data[["LBTESTCD"]] %in% c("ALP", "ALT", "AST", "BILI"),
                  .data[["AVISITN"]] %in% c(0, 4, 5, 7))

  # Last value on treatment
  adlb <- dplyr::select(adlb, -dplyr::any_of("LVOTFL"))
  adlb <- dplyr::left_join(
    adlb,
    dplyr::filter(adlb,
                  .data[["ANL01FL"]] == "Y",
                  !is.na(.data[["ADT"]])) |>
      dplyr::arrange(dplyr::pick(dplyr::all_of(c("USUBJID", "PARAMCD", "ADT")))) |>
      dplyr::group_by(dplyr::pick(dplyr::all_of(c("USUBJID", "PARAMCD")))) |>
      dplyr::slice_tail(n = 1) |>
      dplyr::ungroup() |>
      dplyr::mutate(LVOTFL = "Y"),
    by = names(adlb)
  )

  # Minimum on treatment
  adlb <- dplyr::left_join(
    adlb,
    dplyr::filter(adlb,
                  .data[["ANL01FL"]] == "Y",
                  !is.na(.data[["ADT"]])) |>
      dplyr::arrange(dplyr::pick(dplyr::all_of(c("USUBJID", "PARAMCD", "ADT")))) |>
      dplyr::group_by(dplyr::pick(dplyr::all_of(c("USUBJID", "PARAMCD")))) |>
      dplyr::slice_min(order_by = .data[["AVAL"]], n = 1, with_ties = FALSE, na_rm = TRUE) |>
      dplyr::ungroup() |>
      dplyr::mutate(MINTRFL = "Y"),
    by = names(adlb)
  )

  # Maximum on treatment
  adlb <- dplyr::left_join(
    adlb,
    dplyr::filter(adlb,
                  .data[["ANL01FL"]] == "Y",
                  !is.na(.data[["ADT"]])) |>
      dplyr::arrange(dplyr::pick(dplyr::all_of(c("USUBJID", "PARAMCD", "ADT")))) |>
      dplyr::group_by(dplyr::pick(dplyr::all_of(c("USUBJID", "PARAMCD")))) |>
      dplyr::slice_max(order_by = .data[["AVAL"]], n = 1, with_ties = FALSE, na_rm = TRUE) |>
      dplyr::ungroup() |>
      dplyr::mutate(MAXTRFL = "Y"),
    by = names(adlb)
  )

  attr(adlb, "meta") <- base::file.info("NEWS.md")
  attr(adlb[["LVOTFL"]], "label") <- "Last Value On Treatment Record Flag"
  attr(adlb[["MINTRFL"]], "label") <- "Minimum On Treatment Flag"
  attr(adlb[["MAXTRFL"]], "label") <- "Maximum On Treatment Flag"

  dv.manager::run_app(
    data = list(
      pharmaverseadam = list(adsl = adsl, adlb = adlb)
    ),
    module_list = list(
      "Demography Summary" = mod_summary_table(
        module_id = "dm_summtab",
        table_dataset_name = "adsl",
        pop_dataset_name = "adsl",
        default_summarize_on = c("AGE", "SEX", "RACE"),
        default_group_by = c("TRT01P"),
        default_row_by = NULL,
        choices_aggregate_method = NULL,
        receiver_id = "papo"
      ),
      "Disposition Summary" = mod_summary_table(
        module_id = "ds_summtab",
        table_dataset_name = "adsl",
        pop_dataset_name = "adsl",
        default_summarize_on = c("EOSSTT", "DTHCAUS", "SAFFL"),
        default_group_by = c("TRT01P"),
        default_row_by = NULL,
        default_drop_na = TRUE,
        receiver_id = "papo"
      ),
      "Lab Summary" = mod_summary_table(
        module_id = "lb_summtab",
        table_dataset_name = "adlb",
        pop_dataset_name = "adsl",
        show_aggregate_method = TRUE,
        default_summarize_on = c("AVAL", "CHG", "ATOXGR"),
        default_group_by = c("TRT01P", "SEX"),
        default_row_by = c("PARAM", "AVISIT"),
        default_denom = "n",
        flagged_row_processing = list(
          list(flag_var = "MINTRFL",
               dependent_vars = c("USUBJID", "PARAM"),
               var_assignments = list(VISIT = "MIN ON TRT",
                                      AVISIT = "Minimum on treatment")),
          list(flag_var = "MAXTRFL",
               dependent_vars = c("USUBJID", "PARAM"),
               var_assignments = list(VISIT = "MAX ON TRT",
                                      AVISIT = "Maximum on treatment")),
          list(flag_var = "LVOTFL",
               dependent_vars = c("USUBJID", "PARAM"),
               var_assignments = list(VISIT = "LAST VAL ON TRT",
                                      AVISIT = "Last value on treatment"))
        ),
        receiver_id = "papo"
      ),
      "Population Summary" = mod_summary_table(
        module_id = "pop_summtab",
        show_pop_flag_selection = TRUE,
        table_dataset_name = "adsl",
        pop_dataset_name = "adsl",
        default_summarize_on = c("SITEID"),
        default_group_by = NULL,
        default_row_by = c("COUNTRY"),
        default_total = FALSE,
        default_drop_na = TRUE,
        default_drop_empty_rows = TRUE,
        default_show_category_n = FALSE,
        default_pop_flags = c("ENRLFL", "RANDFL", "TRTFL", "DISCFL"),
        default_pop_flags_after_groups = FALSE,
        receiver_id = "papo"
      ),
      "Patient Profile" = dv.papo::mod_patient_profile(
        module_id = "papo",
        subject_level_dataset_name = "adsl",
        subjid_var = "USUBJID",
        sender_ids = c("dm_summtab", "ds_summtab", "lb_summtab", "pop_summtab"),
        summary = list(vars = c("AGE", "SEX", "RACE", "ETHNIC", "ARM"),
                       column_count = 1)
      )
    ),
    filter_dataset_name = "adsl",
    filter_key = "USUBJID",
    enableBookmarking = "url"
  )

}
