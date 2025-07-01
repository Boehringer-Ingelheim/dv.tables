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
  
  output_list <- list(
    "Table 1" = list(
      tplyr_tab_fun = my_tplyr_fun,
      build_fun = build_func
    ),
    "Tabel 2" = list(
      tplyr_tab_fun = my_tplyr_fun2,
      build_fun = build_func
      # listings_default_values
    ),
    "Listing" = list(
      dataset_names = c("adsl", "adae")
    )
  )

  module_list <- list(
    "Table" = mod_Tplyr_table(
      module_id = "test",
      output_list = output_list,
      review = list(
        datasets = list(
          adsl = list(
            id_vars = "USUBJID",
            tracked_vars = c("RFENDTC", "RFXENDTC")
          ),
          adae = list(
            id_vars = c("USUBJID", "AESEQ"),
            tracked_vars = c("AESEV")
          )
        ),
        choices = c("Pending", "Reviewed with no issues", "Action required", "Resolved"),
        roles = c("TSTAT", "SP", "Safety", "CTL")#,
        # store_path = '/mnt/path/to/app/storage'
      )
    )
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

  output_list <- list(
    "table" =
      list(
        tplyr_tab_fun = my_tplyr_fun,
        build_fun = build_func
      )
  )
  

  ui = function(id) {

    ns <- ifelse(is.character(id), shiny::NS(id), shiny::NS(NULL))
    shiny::fluidPage(Tplyr_table_UI(ns("mock_tplyr"), output_list = output_list))
  }



  server = function(input, output, session) {

    needed_datasets <- names(formals(my_tplyr_fun))

    Tplyr_table_server(
    module_id = "mock_tplyr",
    dataset_list = shiny::reactive({
      list("adsl" = adsl)
      }),
    output_list = output_list,
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
