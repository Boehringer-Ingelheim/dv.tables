TPLYR_TBL <- pack_of_constants( #nolint
  TABLE_ID = "table_output",
  LISTINGS_ID = "listings",
  LISTINGS_HEADER_ID = "listings_header",
  LISTINGS_DIV_ID = "listings_div"
)


#' UI for the Tplyr_table module
#'
#' @param module_id `[character(1)]`
#'
#' A character string that serves as unique identifier for the module.
#'
#' @return
#' @export
#'
#' @examples
Tplyr_table_UI <- function(module_id) {
  ns <- shiny::NS(module_id)

  ui <- shiny::tagList(
    shinyjs::useShinyjs(),
    reactable::reactableOutput(ns(TPLYR_TBL$TABLE_ID)),
    shiny::br(),
    shiny::uiOutput(ns(TPLYR_TBL$LISTINGS_HEADER_ID)),
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
#' @param receiver_id `[character(1) | NULL]`
#'
#' Character string defining the ID of the module to which to send a subject ID. The
#' module must exist in the module list. The default is NULL which disables communication.
#' @param afmm_param `[list(2+) | NULL]`
#'
#' Named list of a selection of arguments from module manager. Expects
#' at least two elements: \code{utils} and \code{module_names} defining a character vector
#' whose entries have the corresponding module IDs as names.
#'
#' @export
Tplyr_table_server <- function(
    module_id,
    dataset_list,
    tplyr_tab_fun,
    build_fun,
    dataset_metadata,
    subjid_var,
    default_vars,
    intended_use_label,
    pagination,
    receiver_id,
    afmm_param
) {
  checkmate::assert(
    checkmate::check_character(module_id, min.chars = 1),
    checkmate::check_multi_class(dataset_list, c("reactive", "shinymeta_reactive")),
    checkmate::check_list(default_vars, null.ok = TRUE),
    checkmate::check_function(tplyr_tab_fun),
    checkmate::check_function(build_fun, nargs = 1),
    checkmate::check_list(dataset_metadata, names = "named", types = c("reactive", "shinymeta_reactive")),
    checkmate::check_character(names(dataset_metadata), unique = TRUE),
    checkmate::check_subset(names(dataset_metadata), choices = c("name", "date_range")),
    checkmate::check_logical(pagination, null.ok = TRUE),
    checkmate::check_string(intended_use_label, null.ok = TRUE),
    checkmate::check_string(receiver_id, min.chars = 1, null.ok = TRUE),
    checkmate::check_list(afmm_param, null.ok = TRUE),
    combine = "and"
  )

  if (!is.null(default_vars)) {
    checkmate::assert_names(names(default_vars), type = "unique")
  }


  shiny::moduleServer(module_id, function(input, output, session) {
    ns <- session$ns

    v_dataset_list <- shiny::reactive({
      checkmate::assert_list(dataset_list(), types = "data.frame", null.ok = TRUE, names = "named")
      dataset_list()
    })


    tplyr_tab <- shiny::reactive({
      res <- do.call(tplyr_tab_fun, v_dataset_list())
    })

    tplyr_tab_build <- shiny::reactive({
      build_fun(tplyr_tab())
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
      selected_columns <- dplyr::select(
        tplyr_tab_build(),
        -row_id, -dplyr::starts_with("ord")
      )

      reactable::reactable(
        selected_columns,
        sortable = FALSE,
        onClick = htmlwidgets::JS(jsCode),
        defaultPageSize = 11,
        showPageSizeOptions = TRUE,
        columns = setNames(lapply(colnames(selected_columns), function(col) {
          reactable::colDef(name = rename_columns(col))
        }), colnames(selected_columns))
      )
    })

    ## listings part start

    # Create reactive values for storing row and col ids
    row <- shiny::reactive(tplyr_tab_build()[input$row_id$index, 1]$row_id)
    col <- shiny::reactive(input$col_id$column)

    output[[TPLYR_TBL$LISTINGS_HEADER_ID]] <- shiny::renderUI({
      if (is.null(col())) {
        shiny::tags$text("Click on a cell to diyplay corresponding listing")
      } else if (!startsWith(col(), "var") || row() == "") {
        shiny::tags$text("Click on a cell with values to diyplay corresponding listing")
      } else {

        shiny::tagList(
          shiny::tags$h4("Corresponding listing"),
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

    shiny::observeEvent(list(row(), col()), {
      if (is.null(col()) || !startsWith(col(), "var") || row() == "") {
        shinyjs::hide(id = TPLYR_TBL$LISTINGS_DIV_ID)
      } else {
        shinyjs::show(id = TPLYR_TBL$LISTINGS_DIV_ID)
      }
    })

    subject_subset <- shiny::eventReactive(list(row(), col()), {
      shiny::req(tplyr_tab())
      shiny::req(row())
      shiny::req(col())

      if (startsWith(col(), "var")) {

        subset_data <- Tplyr::get_meta_subset(tplyr_tab(), row(), col())

        subset_data[[subjid_var]]
      }
    })


    listings_data <- shiny::reactive({
      listings_data_list <- lapply(dataset_list(), function(dataframe) {
        dataframe |>
          dplyr::filter(
            .data[[subjid_var]] %in% subject_subset()
          )
      })
    })

    dv.listings:::listings_server(
      module_id = TPLYR_TBL$LISTINGS_ID,
      dataset_list = listings_data,
      dataset_metadata = dataset_metadata,
      default_vars = default_vars,
      intended_use_label = intended_use_label,
      receiver_id = receiver_id,
      pagination = pagination,
      afmm_param = afmm_param
    )
    ## listings part end

  })
}


#' Typlr table module for DaVinci's module manager
#'
#' @inheritParams Tplyr_table_server
#'
#' @return
#' @export
#'
#' @examples
mod_Tplyr_table <- function(
    module_id,
    tplyr_tab_fun,
    build_fun = function(tab) {
      Tplyr::build(tab, metadata = TRUE) |>
        Tplyr::apply_row_masks(row_breaks = TRUE)
    },
    subjid_var = "USUBJID",
    default_vars = NULL,
    pagination = NULL,
    intended_use_label = "Use only for internal review and monitoring during the conduct of clinical trials.",
    receiver_id = NULL
) {

  mod <- list(
    ui = function(id) {
      Tplyr_table_UI(id)
    },
    server = function(afmm) {

      needed_datasets <- names(formals(tplyr_tab_fun))

      tst <- needed_datasets %in% shiny::isolate(names(afmm$unfiltered_dataset()))
      if (!all(tst)) {
        stop(paste("Not all datasets provided in tplyr_tab_fun are present in the provided data list!",
                   needed_datasets[!tst], "is missing in the provided data list"))
      }

      Tplyr_table_server(
        module_id = module_id,
        dataset_list = shiny::reactive({afmm$filtered_dataset()[needed_datasets]}),
        tplyr_tab_fun = tplyr_tab_fun,
        build_fun = build_fun,
        dataset_metadata = afmm$dataset_metadata,
        subjid_var = subjid_var,
        default_vars = default_vars,
        intended_use_label = intended_use_label,
        pagination = pagination,
        receiver_id = receiver_id,
        afmm_param = list(utils = afmm$utils, module_names = afmm$module_names)
      )
    },
    module_id = module_id
  )
  return(mod)
}



