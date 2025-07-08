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
#' @param module_id `[character(1)]`
#'
#' A character string that serves as unique identifier for the module.
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
    shiny::div(id = ns(TPLYR_TBL$LISTINGS_DIV_ID), dv.listings:::listings_UI(ns(TPLYR_TBL$LISTINGS_ID)))

  )

  return(ui)
}

#' Server for the Tplyr_table module
#'
#' @inheritParams Tplyr_table_UI
#' @param dataset_list `[shiny::reactive(list(data.frame)]`
#'
#' A reactive list of data.framish dataset(s) that will be used to create the table and the listing(s).
#' @param tplyr_tab_fun `[function]` A function giving instructions how to build a Tplyr table.
#' The arguments of the function need to be the name of the datasets used for the table.
#' The Tplyr build part needs to be an extra function passed to \code{build_fun}
#' @param build_fun `[function]` A function containing the build part of the Tplyr table constructed in \code{tplyr_Tab_fun}.
#' Takes as argument the table object from the \code{tplyr_Tab_fun}.
#' @param dataset_metadata `[list(character(1), character(1+))]` A list with the following two elements:
#' \code{dataset_metadata$name()} containing a reactive string specifying the name of the selected
#' dataset and \code{dataset_metadata$date_range()} containing a reactive character vector with two entries
#' specifying the earliest and latest modification date in the dataset.
#' Usually obtained from module manager.
#' @param subjid_var `[character(1) | NULL]`
#'
#' Column corresponding to subject ID. Default value is 'USUBJID'
#' @param default_vars `[list(characters(1+)) | NULL]`
#'
#' A list of character vectors which contain the variable names to be displayed as default per
#'   dataset. Named according to the datasets in the \code{tplyr_tab_fun}. If `NULL`, the first six variables are displayed for each
#'   dataset.
#' @param intended_use_label `[character(1) | NULL]` Either a string indicating the intended use for export, or
#' NULL. The provided label will be displayed prior to the download and will also be included in the exported file.
#'
#' @param pagination `[logical(1) | NULL]` Either a boolean indicating if pagination should be activated, or
#' NULL for which pagination will be activated for large datasets (nrows > 1000) automatically.
#'
#'  @param on_sbj_click `[function()]`
#'
#' Function to invoke when a subject ID is clicked in a listing
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
    checkmate::check_list(default_vars, null.ok = TRUE),
    checkmate::check_list(dataset_metadata, names = "named", types = c("reactive", "shinymeta_reactive")),
    checkmate::check_character(names(dataset_metadata), unique = TRUE),
    checkmate::check_subset(names(dataset_metadata), choices = c("name", "date_range")),
    checkmate::check_logical(pagination, null.ok = TRUE),
    checkmate::check_string(intended_use_label, null.ok = TRUE),
    # checkmate::check_string(receiver_id, min.chars = 1, null.ok = TRUE),
    # checkmate::check_list(afmm_param, null.ok = TRUE),
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
        v_dataset_list()[names(formals(tplyr_tab_fun))]
      } else {
        dataset_names <- output_list[[input[[TPLYR_TBL$SEL_OUTPUT_ID]]]][["dataset_names"]]
        v_dataset_list()[dataset_names]
      }
    })

    ## table part start ---

    tplyr_tab <- shiny::reactive({
      if (is_table()) {
        #Global filter empty, prevent crash
        if (all(sapply(needed_data(), function(tbl) nrow(tbl) == 0))) {
          return(NULL)
        }

        tplyr_tab_fun <- output_list[[input[[TPLYR_TBL$SEL_OUTPUT_ID]]]][["tplyr_tab_fun"]]
        res <- do.call(tplyr_tab_fun, needed_data())
      }
    })

    tplyr_tab_build <- shiny::reactive({

      shiny::req(tplyr_tab())

      if (is_table()) {
        build_fun <- output_list[[input[[TPLYR_TBL$SEL_OUTPUT_ID]]]][["build_fun"]]
        tplyr_tab_build <- build_fun(tplyr_tab())
        if (!("row_id" %in% names(tplyr_tab_build))) {
          warning(
            paste("For output" , input[[TPLYR_TBL$SEL_OUTPUT_ID]],
                  "the metadata is not set to TRUE in the build function. Drill down will not be working"
            )
          )
        }
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
          # defaultPageSize = 11,
          # showPageSizeOptions = TRUE,
          columns = setNames(lapply(colnames(selected_columns), function(col) {
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
        } else {
          # warning(paste("For output" , , "the metadata is not set to TRUE in the build function"))
          shiny::showNotification(
            "Drill down is not working for this Table. Contact your app creator for more information.",
            type = "error",
            duration = 10
          )
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

        shiny::tags$text("Listing:")
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
            paste( "Clicked element:",
                   "Row:",
                   do.call(paste, tplyr_tab_build() |>
                             dplyr::filter(row_id == row()) |>
                             dplyr::select(dplyr::contains("row_label"))),
                   "Column:",
                   rename_columns(col()),
                   "Value:",
                   tplyr_tab_build() |>
                     dplyr::filter(row_id == row()) |>
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
        listings_data_list <- lapply(needed_data(), function(dataframe) {
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

    dv.listings:::listings_server(
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


#' Typlr table module for DaVinci's module manager
#'
#' @inheritParams Tplyr_table_server
#'
#' @param receiver_id `[character(1) | NULL]`
#'
#' Character string defining the ID of the module to which to send a subject ID. The
#' module must exist in the module list. The default is NULL which disables communication.
#'
#' @export
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
        dataset_list = shiny::reactive({afmm$filtered_dataset()[needed_datasets]}),
        output_list = output_list,
        dataset_metadata = afmm$dataset_metadata,
        subjid_var = subjid_var,
        default_vars = default_vars,
        intended_use_label = intended_use_label,
        pagination = pagination,
        # receiver_id = receiver_id,
        on_sbj_click = on_sbj_click_fun,
        review = review
        # afmm_param = list(utils = afmm$utils, module_names = afmm$module_names)
      )
    },
    module_id = module_id
  )
  return(mod)
}



