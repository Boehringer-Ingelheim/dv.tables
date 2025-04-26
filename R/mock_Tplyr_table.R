#' Mock app integrated in the module manager
#'
#' \code{mock_Tplyr_table} launches a mock app for the Tplyr_table shiny module by means of
#' the module manager (dv.manager).
#' @export
#'
mock_Tplyr_table_mm <- function() {

  adsl <- pharmaverseadam::adsl
  adae <- pharmaverseadam::adae




  my_tplyr_fun <- function(adsl) {
    # Create summary table object
    tab <- Tplyr::tplyr_table(adsl, ARM) |>
      Tplyr::add_layer(
        Tplyr::group_desc(AGE, by = "Age (years)")
      ) |>
      Tplyr::add_layer(
        Tplyr::group_count(EOSSTT, by = "End of Study status (%)")
      ) #|>
      # Tplyr::add_layer(
      #   Tplyr::group_count(vars(DCDECOD, DCSREAS))
      # )
    return(tab)
  }

  build_func <- function(tab) {
    Tplyr::build(tab, metadata = TRUE) |>
      dplyr::mutate(row_label2 = ifelse(row_label2 == row_label1, "Total (%)",
                                        row_label2
      )) |>
      Tplyr::apply_row_masks(row_breaks = TRUE)
  }

  my_tplyr_fun2 <- function(adsl, adae) {
    tab <- Tplyr::tplyr_table(adae, TRT01A) |>
      Tplyr::set_pop_data(adsl) |>
      Tplyr::set_pop_treat_var(TRT01A) |>
      Tplyr::add_layer(
        Tplyr::group_count("All subject") |>
          Tplyr::set_distinct_by(USUBJID) |>
          Tplyr::set_format_strings(Tplyr::f_str(
            "xx",
            distinct_total
          ))
      ) |>
      Tplyr::add_layer(
        Tplyr::group_count("Subjects with adverse events") |>
          Tplyr::set_distinct_by(USUBJID) |>
          Tplyr::set_format_strings(Tplyr::f_str(
            "xx (xx %)",
            distinct_n, distinct_pct
          ))
      ) |>
      Tplyr::add_layer(
        Tplyr::group_count(AESEV, by = "Adverse event severity") |>
          Tplyr::set_distinct_by(USUBJID) |>
          Tplyr::set_format_strings(Tplyr::f_str(
            "xx (xx %)",
            distinct_n, distinct_pct
          ))
      ) |>
      Tplyr::add_layer(
        Tplyr::group_count("Subjects with severe AE", where = AESER == "Y") |>
          Tplyr::set_distinct_by(USUBJID) |>
          Tplyr::set_format_strings(Tplyr::f_str(
            "xx (xx %)",
            distinct_n, distinct_pct
          ))
      )

    return(tab)
  }

  build_func2 <- function(tab) {

    Tplyr::build(tab, metadata = TRUE) |>
      Tplyr::apply_row_masks(row_breaks = TRUE)
  }

  papo <- dv.papo::mod_patient_profile(
    module_id = "papo",
    subject_level_dataset_name = "adsl",
    subjid_var = "USUBJID",
    sender_ids = c("test", "test2"),
    summary = list(
      vars = c("AGE", "RACE", "ETHNIC"),
      column_count = 3L
    ),
    listings = list(
      "Demographics" = list(
        dataset = "adsl"
      ),
      "Adverse Events" = list(
        dataset = "adae"
      )
    )
  )


  module_list <- list(
    "cqm" = mod_Tplyr_table(
      "test",
      my_tplyr_fun,
      build_func,
      receiver_id = "papo"
    ),
    "cqm2" = mod_Tplyr_table(
      "test2",
      my_tplyr_fun2,
      build_func2,
      receiver_id = "papo"
    ),
    "Papo" = papo
  )

  dv.manager::run_app(
    data = list("test" = list(adae = adae, adsl = adsl)),
    module_list = module_list,
    filter_data = "adsl"
  )
}

mock_Tplyr_table <- function(){

  adsl <- pharmaverseadam::adsl
  adae <- pharmaverseadam::adae

  my_tplyr_fun <- function(adsl) {
    # Create summary table object
    tab <- Tplyr::tplyr_table(adsl, ARM) |>
      Tplyr::add_layer(
        Tplyr::group_desc(AGE, by = "Age (years)")
      ) |>
      Tplyr::add_layer(
        Tplyr::group_count(EOSSTT, by = "End of Study status (%)")
      )
    return(tab)
  }

  build_func <- function(tab) {
    Tplyr::build(tab, metadata = TRUE) |>
      dplyr::mutate(row_label2 = ifelse(row_label2 == row_label1, "Total (%)",
                                        row_label2
      )) |>
      Tplyr::apply_row_masks(row_breaks = TRUE)
  }


  ui = function(id) {

    ns <- ifelse(is.character(id), shiny::NS(id), shiny::NS(NULL))
    shiny::fluidPage(Tplyr_table_UI(ns("mock_tplyr")))
  }



  server = function(input, output, session) {

    needed_datasets <- names(formals(my_tplyr_fun))

    Tplyr_table_server(
    module_id = "mock_tplyr",
    dataset_list = shiny::reactive({
      list("adsl" = adsl)
      }),
    tplyr_tab_fun = my_tplyr_fun,
    build_fun = build_func,
    dataset_metadata = list(
      name = shiny::reactive("test_name"),
      date_range = shiny::reactive({
        c("2022-01-01", "2022-12-03")
      })
    ),
    subjid_var = "USUBJID",
    default_vars = NULL,
    intended_use_label = "Test Label",
    pagination = NULL,
    receiver_id = NULL,
    afmm_param = NULL
  )
  }

  shiny::shinyApp(
    ui,
    server
  )

}
