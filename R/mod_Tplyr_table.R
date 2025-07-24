TPLYR_TBL <- pack_of_constants( #nolint
  TABLE_ID = "table_output",
  LISTINGS_ID = "listings",
  LISTINGS_HEADER_ID = "listings_header",
  LISTINGS_DIV_ID = "listings_div",
  SEL_OUTPUT_ID = "sel_output",
  SEL_OUTPUT_LABEL = "Select Output:"
)


#' UI for the Tplyr_table module
#'
#'
#' @inheritParams Tplyr_table_server
#'
#' @export
Tplyr_table_UI <- function(module_id, output_list) {
  ns <- shiny::NS(module_id)

  ui <- shiny::tagList(
    shinyjs::useShinyjs(),
    shiny::selectizeInput(ns(TPLYR_TBL$SEL_OUTPUT_ID), label = TPLYR_TBL$SEL_OUTPUT_LABEL, choices = names(output_list)),
    reactable::reactableOutput(ns(TPLYR_TBL$TABLE_ID)),
    shiny::br(),
    shiny::uiOutput(ns(TPLYR_TBL$LISTINGS_HEADER_ID)),
    shiny::br(),
    shiny::div(id = ns(TPLYR_TBL$LISTINGS_DIV_ID), dv.listings::listings_UI(ns(TPLYR_TBL$LISTINGS_ID)))

  )

  return(ui)
}

#' Server for the Tplyr_table module
#'
#' @param module_id `[character(1)]`
#'
#' A character string that serves as unique identifier for the module.
#' @param dataset_list `[shiny::reactive(list(data.frame)]`
#'
#' A reactive list of data.framish dataset(s) that will be used to create the table and the listing(s).
#' @param output_list `[list(list())]`  A named list defining the outputs to be generated. Each element of the list
#' corresponds to a table or listing and must be a named list with one of the following structures:
#'
#' For summary tables:
#'  \describe{
#'     \item{tplyr_tab_fun}{A function that takes one or more datasets as input and returns a `tplyr_table` object.}
#'     \item{build_fun}{A function that takes the `tplyr_table` object and returns a built table (typically using `Tplyr::build()`).
#'     The metadata argument of `Tplyr::build()` needs to be set to `TURE`, so that the corresponding listing can be shown.}
#'  }
#'
#'  For listings:
#'   \describe{
#'     \item{dataset_names}{A character vector of dataset names required to generate the listing.}
#'   }
#'
#'   The names of the top-level list elements are used as identifiers for the outputs.
#'
#' @param dataset_metadata `[list(character(1), character(1+))]` A list with the following two elements:
#' \code{dataset_metadata$name()} containing a reactive string specifying the name of the selected
#' dataset and \code{dataset_metadata$date_range()} containing a reactive character vector with two entries
#' specifying the earliest and latest modification date in the dataset.
#' Usually obtained from module manager.
#' @param subjid_var `[character(1) | NULL]`
#'
#' Column corresponding to subject ID. Default value is 'USUBJID'
#' @param default_vars an argument of \link[dv.listings]{listings_server} of {dv.listings} will be passed through.
#' @param intended_use_label an argument of \link[dv.listings]{listings_server} of {dv.listings} will be passed through.
#'
#' @param pagination an argument of \link[dv.listings]{listings_server} of {dv.listings} will be passed through.
#'
#' @param on_sbj_click an argument of \link[dv.listings]{listings_server} of {dv.listings} will be passed through.
#'
#'
#' @param review an argument of \link[dv.listings]{listings_server} of {dv.listings} will be passed through.
#'
#' @export
Tplyr_table_server <- function(
    module_id,
    dataset_list,
    output_list,
    dataset_metadata,
    subjid_var,
    default_vars,
    intended_use_label,
    pagination,
    on_sbj_click = NULL,
    review = NULL
) {
  checkmate::assert(
    checkmate::check_character(module_id, min.chars = 1),
    checkmate::check_multi_class(dataset_list, c("reactive", "shinymeta_reactive")),
    checkmate::check_character(subjid_var, min.chars = 1),
    combine = "and"
  )

  if (!is.null(default_vars)) {
    checkmate::assert_names(names(default_vars), type = "unique")
  }

  checkmate::assert_list(output_list, types = "list")

  for (output in output_list) {
    if (length(output) == 1) {
      checkmate::assert(
        checkmate::check_list(output, names = "named"),
        checkmate::check_subset(names(output), choices = "dataset_names", empty.ok = FALSE),
        combine = "and"
      )
    } else if (length(output) == 2) {
      checkmate::assert(
        checkmate::check_list(output, names = "named"),
        checkmate::check_subset(names(output), choices = c("tplyr_tab_fun", "build_fun"), empty.ok = FALSE),
        checkmate::check_function(output[["tplyr_tab_fun"]]),
        checkmate::check_function(output[["build_fun"]], nargs = 1),
        combine = "and"
      )
    } else {
      message("output_list entry has too many elements")
    }
  }


  shiny::moduleServer(module_id, function(input, output, session) {
    ns <- session$ns

    v_dataset_list <- shiny::reactive({
      checkmate::assert_list(dataset_list(), types = "data.frame", null.ok = TRUE, names = "named")
      # ensure that global filter works as expected
      dataset_list_dropedlevles <- lapply(dataset_list(), function(df) {
        lbls <- get_lbls(df)
        df <- df |>
          dplyr::mutate(dplyr::across(dplyr::where(is.factor), ~ droplevels(.)))
        df <- set_lbls(df, lbls)
      })

      dataset_list_dropedlevles
    })

    is_table <- shiny::reactive({
      "tplyr_tab_fun" %in% names(output_list[[input[[TPLYR_TBL$SEL_OUTPUT_ID]]]])
    })

    needed_data <- shiny::reactive({
      if (is_table()) {
        tplyr_tab_fun <- output_list[[input[[TPLYR_TBL$SEL_OUTPUT_ID]]]][["tplyr_tab_fun"]]
        dataset_names <- names(formals(tplyr_tab_fun))
      } else {
        dataset_names <- output_list[[input[[TPLYR_TBL$SEL_OUTPUT_ID]]]][["dataset_names"]]
      }

      v_dataset_list()[dataset_names]
    })

    ## table part start ---

    tplyr_tab <- shiny::reactive({
      if (is_table()) {
        # Global filter empty, prevent crash
        if (all(sapply(needed_data(), function(tbl) nrow(tbl) == 0))) {
          return(NULL)
        }
        tplyr_tab_fun <- output_list[[input[[TPLYR_TBL$SEL_OUTPUT_ID]]]][["tplyr_tab_fun"]]
        res <- do.call(tplyr_tab_fun, needed_data())
        res
      }
    })

    tplyr_tab_build <- shiny::reactive({

      shiny::req(tplyr_tab())

      if (is_table()) {
        checkmate::assert_class(tplyr_tab(), classes = c("tplyr_table", "environment"))
        build_fun <- output_list[[input[[TPLYR_TBL$SEL_OUTPUT_ID]]]][["build_fun"]]
        tplyr_tab_build <- build_fun(tplyr_tab())
        if (!("row_id" %in% names(tplyr_tab_build))) {
          warning(
            paste(
              "For output", input[[TPLYR_TBL$SEL_OUTPUT_ID]],
              "the metadata is not set to TRUE in the build function. Drill down will not be working"
            )
          )
        }
        checkmate::assert_class(tplyr_tab_build, classes = c("tbl_df", "tbl", "data.frame"))
        tplyr_tab_build
      }
    })


    jsCode <- paste0(
      "function(rowInfo, colInfo) {
          if (window.Shiny) {
            Shiny.setInputValue('", ns("row_id"), "', { index: rowInfo.index + 1})
            Shiny.setInputValue('", ns("col_id"), "',{ column: colInfo.id })
          }
        }"
    )

    # consider using DT
    output[[TPLYR_TBL$TABLE_ID]] <- reactable::renderReactable({
      shiny::validate(
        shiny::need(
          !all(sapply(needed_data(), function(tbl) nrow(tbl) == 0)),
          "No data available, please adjust your filter settings."
        )
      )
      if (is_table()) {
        selected_columns <- dplyr::select(
          tplyr_tab_build(),
          -dplyr::any_of(c("row_id")), -dplyr::starts_with("ord")
        )

        reactable::reactable(
          selected_columns,
          sortable = FALSE,
          onClick = htmlwidgets::JS(jsCode),
          pagination = FALSE,
          columns = stats::setNames(lapply(colnames(selected_columns), function(col) {
            reactable::colDef(name = rename_columns(col))
          }), colnames(selected_columns))
        )
      }
    })

    ## table part end ---

    ## listings part start ---

    sel_output <- shiny::reactiveVal("")
    # Create reactive values for storing row and col ids
    row <- shiny::reactive({
      if (is_table() && input[[TPLYR_TBL$SEL_OUTPUT_ID]] == sel_output()) {

        if ("row_id" %in% names(tplyr_tab_build())) {
          tplyr_tab_build()[input$row_id$index, 1]$row_id
        }

      }
    })
    col <- shiny::reactive({
      if (is_table() && input[[TPLYR_TBL$SEL_OUTPUT_ID]] == sel_output()) {
        input$col_id$column
      }
    })

    output[[TPLYR_TBL$LISTINGS_HEADER_ID]] <- shiny::renderUI({
      if (!is_table()) {
        shinyjs::show(id = TPLYR_TBL$LISTINGS_DIV_ID)
        shinyjs::hide(id = TPLYR_TBL$TABLE_ID)
      } else if (!"row_id" %in% names(tplyr_tab_build())) {
        shinyjs::show(id = TPLYR_TBL$TABLE_ID)
        shinyjs::hide(id = TPLYR_TBL$LISTINGS_DIV_ID)

        shiny::showNotification(
          "Drill down is not working for this Table. Contact your app creator for more information.",
          type = "error",
          duration = 10
        )

        shiny::tags$text("Listing not available")
      } else if (
        is.null(col()) || input[[TPLYR_TBL$SEL_OUTPUT_ID]] != sel_output() ||
        !startsWith(col(), "var") || row() == ""
        || !(col() %in% names(tplyr_tab_build()) && row() %in% tplyr_tab_build()[["row_id"]])
      ) {
        shinyjs::show(id = TPLYR_TBL$TABLE_ID)
        shinyjs::hide(id = TPLYR_TBL$LISTINGS_DIV_ID)

        sel_output(input[[TPLYR_TBL$SEL_OUTPUT_ID]])
        shiny::tags$text("Click on a cell with numbers to display corresponding listing")
      } else {
        shinyjs::show(id = TPLYR_TBL$TABLE_ID)
        shinyjs::show(id = TPLYR_TBL$LISTINGS_DIV_ID)

        shiny::tagList(
          shiny::tags$h4("Corresponding listing:"),
          shiny::tags$text(
            paste(
              "Clicked element:",
              "Row:",
              do.call(
                paste,
                tplyr_tab_build() |>
                  dplyr::filter(.data[["row_id"]] == row()) |>
                  dplyr::select(dplyr::contains("row_label"))),
              "Column:",
              rename_columns(col()),
              "Value:",
              tplyr_tab_build() |>
                dplyr::filter(.data[["row_id"]] == row()) |>
                dplyr::select(col())
            )
          )
        )
      }
    })

    subject_subset <- shiny::eventReactive(list(row(), col()), {
      shiny::req(tplyr_tab())
      shiny::req(row())
      shiny::req(col())

      if (startsWith(col(), "var")) {

        if (col() %in% names(tplyr_tab_build()) && row() %in% tplyr_tab_build()[["row_id"]]) {
          subset_data <- Tplyr::get_meta_subset(tplyr_tab(), row(), col())

          subset_data[[subjid_var]]
        }
      }
    })

    listings_data <- shiny::reactive({
      if (is_table()) {
        lapply(needed_data(), function(dataframe) {
          dataframe |>
            dplyr::filter(
              .data[[subjid_var]] %in% subject_subset()
            )
        })
      } else {
        needed_data()
      }
    })

    shiny::exportTestValues(
      "subject_subset" = subject_subset,
      "listings_data" = listings_data()
    )

    dv.listings::listings_server(
      module_id = TPLYR_TBL$LISTINGS_ID,
      dataset_list = listings_data,
      dataset_metadata = dataset_metadata,
      default_vars = default_vars,
      intended_use_label = intended_use_label,
      pagination = pagination,
      on_sbj_click = on_sbj_click,
      review = review
    )
    ## listings part end ---

  })
}


#' Tplyr table module for DaVinci's module manager
#'
#' This module integrates Tplyr-based table generation into the DaVinci module manager framework.
#' It allows users to define and render summary tables using `Tplyr`, with support for custom
#' table-building functions and dataset listings.
#'
#' @inheritParams Tplyr_table_server
#'
#' @param receiver_id an argument of \link[dv.listings]{listings_server} of {dv.listings} will be passed through
#'
#' @export
#'
#' @examples
#'\dontrun{
#' dm <- pharmaversesdtm::dm
#' ae <- pharmaversesdtm::ae
#'
#' my_tplyr_fun <- function(dm) {
#'   tab <- Tplyr::tplyr_table(dm, ARM) |>
#'     Tplyr::add_layer(Tplyr::group_desc(AGE, by = "Age (years)")) |>
#'     Tplyr::add_layer(Tplyr::group_count(SEX, by = "Sex")) |>
#'     Tplyr::add_layer(Tplyr::group_count(RACE, by = "Race"))
#'   return(tab)
#' }
#'
#' build_func <- function(tab) {
#'   Tplyr::build(tab, metadata = TRUE) |>
#'     dplyr::mutate(row_label2 = ifelse(row_label2 == row_label1, "Total (%)", row_label2)) |>
#'     Tplyr::apply_row_masks(row_breaks = TRUE)
#' }
#'
#' my_tplyr_fun2 <- function(dm, ae) {
#'   dm_arm <- dm |> dplyr::select(USUBJID, ARM)
#'   ae_arm <- ae |> dplyr::inner_join(dm_arm, by = "USUBJID")
#'
#'   tab <- Tplyr::tplyr_table(ae_arm, ARM) |>
#'     Tplyr::set_pop_data(dm) |>
#'     Tplyr::set_pop_treat_var(ARM) |>
#'     Tplyr::add_layer(
#'       Tplyr::group_count("All subjects") |>
#'       Tplyr::set_distinct_by(USUBJID) |>
#'       Tplyr::set_format_strings(Tplyr::f_str("xx", distinct_total))
#'     ) |>
#'     Tplyr::add_layer(
#'       Tplyr::group_count("Subjects with adverse events") |>
#'         Tplyr::set_distinct_by(USUBJID) |>
#'         Tplyr::set_format_strings(Tplyr::f_str("xx (xx %)", distinct_n, distinct_pct))
#'     ) |>
#'     Tplyr::add_layer(
#'       Tplyr::group_count(AESEV, by = "Adverse event severity") |>
#'       Tplyr::set_distinct_by(USUBJID) |>
#'       Tplyr::set_format_strings(Tplyr::f_str("xx (xx %)", distinct_n, distinct_pct))
#'     ) |>
#'     Tplyr::add_layer(
#'       Tplyr::group_count("Subjects with serious AE", where = AESER == "Y") |>
#'         Tplyr::set_distinct_by(USUBJID) |>
#'         Tplyr::set_format_strings(Tplyr::f_str("xx (xx %)", distinct_n, distinct_pct))
#'     )
#'   return(tab)
#' }
#'
#' build_func2 <- function(tab) {
#'   Tplyr::build(tab, metadata = TRUE) |>
#'     Tplyr::apply_row_masks(row_breaks = TRUE)
#' }
#'
#' output_list <- list(
#'   "Demographic" = list(
#'     tplyr_tab_fun = my_tplyr_fun,
#'     build_fun = build_func
#'   ),
#'   "Adverse Events" = list(
#'     tplyr_tab_fun = my_tplyr_fun2,
#'     build_fun = build_func
#'   ),
#'   "Listing" = list(
#'     dataset_names = c("dm", "ae")
#'   )
#' )
#'
#' module_list <- list(
#'   "Table" = dv.tables::mod_Tplyr_table(
#'     module_id = "tplyr_table",
#'     output_list = output_list
#'   )
#' )
#'
#' dv.manager::run_app(
#'   data = list("My data" = list(ae = ae, dm = dm)),
#'   module_list = module_list,
#'   filter_data = "dm",
#'   enable_dataset_filter = TRUE
#' )
#'
#'}
#'
mod_Tplyr_table <- function(
    module_id,
    output_list,
    subjid_var = "USUBJID",
    default_vars = NULL,
    pagination = NULL,
    intended_use_label = "Use only for internal review and monitoring during the conduct of clinical trials.",
    receiver_id = NULL,
    review = NULL
) {

  checkmate::assert_list(output_list, types = "list")

  for (output in output_list) {

    if (length(output) == 1) {
      checkmate::assert(
        checkmate::check_list(output, names = "named"),
        checkmate::check_subset(names(output), choices = "dataset_names", empty.ok = FALSE),
        combine = "and"
      )
    } else if (length(output) == 2) {

      checkmate::assert(
        checkmate::check_list(output, names = "named"),
        checkmate::check_subset(names(output), choices = c("tplyr_tab_fun", "build_fun"), empty.ok = FALSE),
        checkmate::check_function(output[["tplyr_tab_fun"]]),
        checkmate::check_function(output[["build_fun"]], nargs = 1),
        combine = "and"
      )
    } else {
      message("output_list entry has too many elements")
    }
  }

  mod <- list(
    ui = function(id) {
      Tplyr_table_UI(id, output_list)
    },
    server = function(afmm) {

      on_sbj_click_fun <- NULL
      if (!is.null(receiver_id)) {
        on_sbj_click_fun <- function() afmm[["utils"]][["switch2mod"]](receiver_id)
      }

      needed_datasets <- sapply(output_list, function(tab) {
        if ("tplyr_tab_fun" %in% names(tab)) {
          names(formals(tab[["tplyr_tab_fun"]]))
        } else {
          tab[["dataset_names"]]
        }

      }, simplify = TRUE, USE.NAMES = FALSE) |>
        unlist() |>
        unique()

      dataset_present <- needed_datasets %in% shiny::isolate(names(afmm$unfiltered_dataset()))
      if (!all(dataset_present)) {
        stop(paste("Not all datasets provided in tplyr_tab_fun are present in the provided data list!",
                   needed_datasets[!dataset_present], "is missing in the provided data list"))
      }

      if (is.list(review)) {
        # These afmm fields are only required for the review functionality, so we bundle them in the `review` list
        review[["data"]] <- afmm[["data"]]
        review[["selected_dataset"]] <- afmm[["dataset_metadata"]][["name"]]
      }

      Tplyr_table_server(
        module_id = module_id,
        dataset_list = shiny::reactive(afmm$filtered_dataset()[needed_datasets]),
        output_list = output_list,
        dataset_metadata = afmm$dataset_metadata,
        subjid_var = subjid_var,
        default_vars = default_vars,
        intended_use_label = intended_use_label,
        pagination = pagination,
        on_sbj_click = on_sbj_click_fun,
        review = review
      )
    },
    module_id = module_id
  )
  return(mod)
}



