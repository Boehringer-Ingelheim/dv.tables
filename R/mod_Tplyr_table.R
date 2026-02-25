TPLYR_TBL <- pack_of_constants( # nolint
  TABLE_ID = "table_output",
  LISTINGS_ID = "listings",
  LISTINGS_HEADER_ID = "listings_header",
  LISTINGS_DIV_ID = "listings_div",
  SEL_OUTPUT_ID = "sel_output",
  SEL_OUTPUT_LABEL = "Select Output:",
  TITLE_OUTPUT_ID = "title_id",
  TITLE_OUTPUT_LABEL = "Output:",
  SEL_ACT_ID = "menu_button",
  TABS_ID = "title_tabs"
)


#' UI for the Tplyr_table module
#'
#'
#' @inheritParams Tplyr_table_server
#'
#' @keywords main
#' @export
Tplyr_table_UI <- function(module_id, output_list) {
  ns <- shiny::NS(module_id)

  ui <- shiny::tagList(
    shinyjs::useShinyjs(),
    shiny::uiOutput(ns(TPLYR_TBL$TITLE_OUTPUT_ID)),
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
#' @param output_list `[list(list())]`
#'
#' A named list defining the outputs to be generated. Each element of the list
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
#' @param title_layout `[character(1)]`
#'
#' A character string defining how users can select the outputs in `output_list`.
#' Supported values are:
#' \describe{
#'   \item{`"dropdown"` (default)}{Renders the current interactive title with a drop-down selector.}
#'   \item{`"tabs"`}{Renders a horizontal `tabsetPanel` with one tab per entry in `output_list`.
#'     Tabs will wrap to the next line if there are many. The rest of the module behavior is unchanged.}
#' }
#'
#' @param dataset_metadata `[list(character(1), character(1+))]` A list with the following two elements:
#' \code{dataset_metadata$name()} containing a reactive string specifying the name of the selected
#' dataset and \code{dataset_metadata$date_range()} containing a reactive character vector with two entries
#' specifying the earliest and latest modification date in the dataset.
#' Usually obtained from module manager.
#' @param subjid_var `[character(1) | NULL]`
#'
#' Column corresponding to subject ID. Default value is 'USUBJID'
#' @param default_vars an argument of [listings_server](https://boehringer-ingelheim.github.io/dv.listings/reference/listings_UI.html) of {dv.listings} will be passed through.
#' @param intended_use_label an argument of [listings_server](https://boehringer-ingelheim.github.io/dv.listings/reference/listings_UI.html) of {dv.listings} will be passed through.
#'
#' @param pagination an argument of [listings_server](https://boehringer-ingelheim.github.io/dv.listings/reference/listings_UI.html) of {dv.listings} will be passed through.
#'
#' @param on_sbj_click an argument of [listings_server](https://boehringer-ingelheim.github.io/dv.listings/reference/listings_UI.html) of {dv.listings} will be passed through.
#'
#'
#' @param review an argument of [listings_server](https://boehringer-ingelheim.github.io/dv.listings/reference/listings_UI.html) of {dv.listings} will be passed through.
#'
#'
#' @keywords main
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
  review = NULL,
  title_layout = c("dropdown", "tabs")
) {
  title_layout <- match.arg(title_layout)

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
    })

    ### Table title start --

    # Central selected output id

    selected_output_id <- shiny::reactive({
      if (identical(title_layout, "tabs")) {
        # If single output

        input[[TPLYR_TBL$TABS_ID]] %||% names(output_list)[1]
      } else {
        input[[TPLYR_TBL$SEL_OUTPUT_ID]] %||% names(output_list)[1]
      }
    })


    # define action button & output selector
    title_ui <- local({
      if (identical(title_layout, "dropdown")) {
        output_menu <- shiny::tagAppendAttributes(
          shinyWidgets::dropMenu(
            shiny::actionButton(
              inputId = ns(TPLYR_TBL$SEL_ACT_ID),
              label = TPLYR_TBL$TITLE_OUTPUT_LABEL
            ),
            shiny::tagList(
              shiny::tags$style(shiny::HTML(paste0(
                "#",
                ns(TPLYR_TBL$SEL_OUTPUT_ID),
                " + div.selectize-control div.selectize-input.items {max-height:200px; overflow-y:auto;}"
              ))),
              shiny::selectizeInput(
                inputId = ns(TPLYR_TBL$SEL_OUTPUT_ID),
                label = TPLYR_TBL$SEL_OUTPUT_LABEL,
                choices = names(output_list),
                selected = names(output_list)[1],
                multiple = FALSE
              )
            ),
            arrow = TRUE
          ),
          style = "display:inline"
        )


        # Interactive title
        interactive_title <- it_interactive_title(
          output_menu
        )
        interactive_title
      } else {
        # Single output no tabs (avoid wasted space)
        if (length(output_list) == 1) {
          shiny::tags$div(class = "dv-tplyr-single-output-title", names(output_list)[1])
        } else {
          # Standard Shiny tabs; wraps to next line
          tabs <- lapply(names(output_list), function(nm) {
            shiny::tabPanel(title = nm, value = nm)
          })
          do.call(
            shiny::tabsetPanel,
            c(
              list(id = ns(TPLYR_TBL$TABS_ID), selected = names(output_list)[1]),
              tabs
            )
          )
        }
      }
    })


    output[[TPLYR_TBL$TITLE_OUTPUT_ID]] <- shiny::renderUI({
      title_ui
    })

    shiny::outputOptions(output, TPLYR_TBL$TITLE_OUTPUT_ID,
      suspendWhenHidden = FALSE
    )

    # Update the action button label (only if its interactive dropdown)
    if (identical(title_layout, "dropdown")) {
      shiny::observeEvent(input[[TPLYR_TBL$SEL_OUTPUT_ID]], {
        selected_value <- input[[TPLYR_TBL$SEL_OUTPUT_ID]]
        shiny::updateActionButton(
          session = session,
          inputId = TPLYR_TBL$SEL_ACT_ID,
          label = selected_value
        )
      })
    }


    ### Table title end ---

    ## table part start ---

    # consider using DT
    output[[TPLYR_TBL$TABLE_ID]] <- reactable::renderReactable({
      is_table <- state()[["is_table"]]
      tplyr_tab_build <- state()[["tplyr_tab_build"]]
      needed_data <- state()[["needed_data"]]

      shiny::validate(
        shiny::need(
          !all(sapply(needed_data, function(tbl) nrow(tbl) == 0)),
          "No data available, please adjust your filter settings."
        )
      )

      if (is_table) {
        selected_columns <- dplyr::select(
          tplyr_tab_build,
          -dplyr::any_of(c("row_id")), -dplyr::starts_with("ord")
        )

        paging <- nrow(selected_columns) > 50

        cell_click_input_js <- paste0(
          "function(rowInfo, colInfo) {
          if (window.Shiny) {
            Shiny.setInputValue('", ns("row_id"), "', { index: rowInfo.index + 1})
            Shiny.setInputValue('", ns("col_id"), "',{ column: colInfo.id })
          }
        }"
        )

        reactable::reactable(
          selected_columns,
          sortable = FALSE,
          onClick = htmlwidgets::JS(cell_click_input_js),
          pagination = paging,
          showPageSizeOptions = paging,
          columns = stats::setNames(lapply(colnames(selected_columns), function(col) {
            reactable::colDef(name = rename_columns(col))
          }), colnames(selected_columns))
        )
      }
    })

    ## table part end ---

    ## listings part start ---

    sel_data <- shiny::reactiveVal(list(cell = NULL, listings_data = NULL))

    state <- shiny::reactiveVal(
      list(
        tplyr_tab = NULL,
        needed_data = NULL,
        tplyr_tab_build = NULL,
        is_table = FALSE
      )
    )

    shiny::observeEvent(list(input[["row_id"]], input[["col_id"]]), {
      tplyr_tab_build <- state()[["tplyr_tab_build"]]
      tplyr_tab <- state()[["tplyr_tab"]]
      needed_data <- state()[["needed_data"]]

      if (
        !is.null(input[["row_id"]]) &&
          !is.null(input[["col_id"]]) &&
          ("row_id" %in% names(tplyr_tab_build))
      ) {
        row_name <- tplyr_tab_build[input[["row_id"]][["index"]], 1][["row_id"]]
        col_name <- input[["col_id"]]$column

        if (startsWith(col_name, "var") && checkmate::test_string(row_name, min.chars = 1)) {
          subset_data <- Tplyr::get_meta_subset(tplyr_tab, row_name, col_name)
          subject_subset <- subset_data[[subjid_var]]
          listings_data <- lapply(needed_data, function(dataframe) {
            dataframe |>
              dplyr::filter(
                .data[[subjid_var]] %in% subject_subset
              )
          })

          sel_data(list(cell = list(row_name, col_name), listings_data = listings_data))
        } else {
          sel_data(list(cell = NULL, listings_data = NULL))
        }
      }
    })

    click_info_contents <- shiny::reactiveVal(NULL)

    shiny::observeEvent(list(
      selected_output_id(),
      v_dataset_list()
    ), {
      shiny::req(selected_output_id())

      r_dataset_list <- v_dataset_list()

      sel_id <- selected_output_id()
      selected_output <- output_list[[sel_id]]

      tplyr_tab_fun <- selected_output[["tplyr_tab_fun"]]

      new_state <- list(tplyr_tab = NULL, needed_data = NULL, tplyr_tab_build = NULL, is_table = FALSE)

      # Reset clicked cell info when another table output is selected
      sel_data(list(cell = NULL, listings_data = NULL))

      is_table <- "tplyr_tab_fun" %in% names(selected_output)

      dataset_names <- local({
        if (is_table) {
          names(formals(tplyr_tab_fun))
        } else {
          selected_output[["dataset_names"]]
        }
      })

      l_needed_data <- r_dataset_list[dataset_names]

      l_tplyr_tab <- local({
        if (is_table) {
          # Global filter empty, prevent crash
          if (all(sapply(l_needed_data, function(tbl) nrow(tbl) == 0))) {
            return(NULL)
          }
          res <- do.call(tplyr_tab_fun, l_needed_data)
          checkmate::assert_class(res, classes = c("tplyr_table", "environment"))
          res
        }
      })

      l_tplyr_tab_build <- local({
        if (!is.null(l_tplyr_tab)) {
          if (is_table) {
            build_fun <- selected_output[["build_fun"]]
            res <- build_fun(l_tplyr_tab)
            checkmate::assert_class(res, classes = c("tbl_df", "tbl", "data.frame"))
            if (!("row_id" %in% names(res))) {
              warning(
                paste(
                  "For output", sel_id,
                  "the metadata is not set to TRUE in the build function. Drill down will not be working"
                )
              )
            }
            res
          }
        } else {
          NULL
        }
      })

      new_state[["is_table"]] <- is_table
      new_state[["needed_data"]] <- l_needed_data
      new_state[["tplyr_tab"]] <- l_tplyr_tab
      new_state[["tplyr_tab_build"]] <- l_tplyr_tab_build
      state(new_state)

      ## UI information

      contents <- NULL

      if (!is_table) { # If not a table only show the listing
        shinyjs::show(id = TPLYR_TBL$LISTINGS_DIV_ID)
        shinyjs::hide(id = TPLYR_TBL$TABLE_ID)
      } else if (!"row_id" %in% names(l_tplyr_tab_build)) { # Metatada not configured
        shiny::showNotification(
          "Drill down is not working for this Table. Contact your app creator for more information.",
          type = "error",
          duration = 10
        )
        shinyjs::show(id = TPLYR_TBL$TABLE_ID)
        shinyjs::hide(id = TPLYR_TBL$LISTINGS_DIV_ID)

        contents <- shiny::tags$text("Listing not available")
      } else {
        shinyjs::show(id = TPLYR_TBL$TABLE_ID)
        shinyjs::hide(id = TPLYR_TBL$LISTINGS_DIV_ID)

        contents <- shiny::tags$text("Click on a cell with numbers to display corresponding listing")
      }
      click_info_contents(contents)
    })


    shiny::observeEvent(sel_data(),
      {
        contents <- NULL
        sel_cell <- sel_data()[["cell"]]
        tplyr_tab_build <- state()[["tplyr_tab_build"]]

        if (!is.null(sel_cell)) {
          shinyjs::show(id = TPLYR_TBL$TABLE_ID)
          shinyjs::show(id = TPLYR_TBL$LISTINGS_DIV_ID)

          row_label <- do.call(
            paste,
            tplyr_tab_build |>
              dplyr::filter(.data[["row_id"]] == sel_cell[[1]]) |>
              dplyr::select(dplyr::contains("row_label"))
          )

          column_label <- rename_columns(sel_cell[[2]])
          value <- tplyr_tab_build |>
            dplyr::filter(.data[["row_id"]] == sel_cell[[1]]) |>
            dplyr::select(sel_cell[[2]])

          contents <- shiny::tagList(
            shiny::tags$h4("Corresponding listing:"),
            shiny::tags$text(
              paste(
                "Clicked element: Row:", row_label,
                "Column:", column_label,
                "Value:", value
              )
            )
          )

          click_info_contents(contents)
        }
      },
      ignoreInit = TRUE
    ) # To not overwrite the click_info_contents at start of the app

    output[[TPLYR_TBL$LISTINGS_HEADER_ID]] <- shiny::renderUI({
      click_info_contents()
    })

    listings_data <- shiny::reactive({
      is_table <- state()[["is_table"]]
      if (is_table) {
        shiny::req(!is.null(sel_data()[["listings_data"]]))
        sel_data()[["listings_data"]]
      } else {
        state()[["needed_data"]]
      }
    })

    shiny::exportTestValues(
      "state" = state(),
      "sel_data" = sel_data(),
      "listings_data" = listings_data()
    )

    res_listings <- dv.listings::listings_server(
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

    return(res_listings)
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
#' @param receiver_id an argument of [listings_server](https://boehringer-ingelheim.github.io/dv.listings/reference/listings_UI.html) of {dv.listings} will be passed through
#'
#' @keywords main
#' @export
#'
#' @examples
#' \dontrun{
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
#'         Tplyr::set_distinct_by(USUBJID) |>
#'         Tplyr::set_format_strings(Tplyr::f_str("xx", distinct_total))
#'     ) |>
#'     Tplyr::add_layer(
#'       Tplyr::group_count("Subjects with adverse events") |>
#'         Tplyr::set_distinct_by(USUBJID) |>
#'         Tplyr::set_format_strings(Tplyr::f_str("xx (xx %)", distinct_n, distinct_pct))
#'     ) |>
#'     Tplyr::add_layer(
#'       Tplyr::group_count(AESEV, by = "Adverse event severity") |>
#'         Tplyr::set_distinct_by(USUBJID) |>
#'         Tplyr::set_format_strings(Tplyr::f_str("xx (xx %)", distinct_n, distinct_pct))
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
#'   filter_type = "datasets"
#' )
#' }
#'
mod_Tplyr_table <- function(
  module_id,
  output_list,
  subjid_var = "USUBJID",
  default_vars = NULL,
  pagination = NULL,
  intended_use_label = "Use only for internal review and monitoring during the conduct of clinical trials.",
  receiver_id = NULL,
  review = NULL,
  title_layout = c("dropdown", "tabs")
) {
  title_layout <- match.arg(title_layout)
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

      if (is.list(review)) {
        # Prevent and warn against multiple `dv.tables` instances with active review functionality.
        #
        # This block of code takes advantage of the way `dv.manager` incrementally populates afmm[["module_output"]].
        # At this point in (non-reactive) time, `dv.manager` has run the server functions of only the modules that
        # precede this one in the `module_list` declaration of the DaVinci app. As long as one of them has declared
        # that it offers the review interface, we will refuse to start our own.
        # The mod_output[["enabled_review]] flag is set by `dv.listings::listings_server`.
        for (mod_output in afmm[["module_output"]]()) {
          if (is.list(mod_output) && isTRUE(mod_output[["enabled_review"]])) {
            this_tab_name <- afmm[["module_names"]][[module_id]]

            shiny::showNotification(
              {
                paste(
                  "This app is configured to review listings in more than one tab. However,",
                  "only one instance of the `dv.tables` module can offer review functionality on any given app.<br>",
                  sprintf(
                    'We have <b>disabled the review interface on the tab labeled "%s" (with module ID "%s")</b>',
                    this_tab_name, module_id
                  ), "to sidestep this issue. Sorry for the inconvenience."
                ) |> htmltools::HTML()
              },
              duration = NULL,
              type = "error"
            )

            review <- NULL
            break
          }
        }
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

      dataset_present <- needed_datasets %in% shiny::isolate(names(afmm$unfiltered_dataset_list()))
      if (!all(dataset_present)) {
        stop(paste(
          "Not all datasets provided in tplyr_tab_fun are present in the provided data list!",
          needed_datasets[!dataset_present], "is missing in the provided data list"
        ))
      }

      if (is.list(review)) {
        # These afmm fields are only required for the review functionality, so we bundle them in the `review` list
        review[["data"]] <- afmm[["data"]]
        review[["selected_dataset"]] <- afmm[["dataset_metadata"]][["name"]]
      }

      Tplyr_table_server(
        module_id = module_id,
        dataset_list = shiny::reactive(afmm$filtered_dataset_list()[needed_datasets]),
        output_list = output_list,
        dataset_metadata = afmm$dataset_metadata,
        subjid_var = subjid_var,
        default_vars = default_vars,
        intended_use_label = intended_use_label,
        pagination = pagination,
        on_sbj_click = on_sbj_click_fun,
        review = review,
        title_layout = title_layout
      )
    },
    module_id = module_id
  )
  return(mod)
}

dataset_info_Tplyr_table <- function(...) NULL # TODO: Return datasets used according to parameterization of the module

check_mod_Tplyr_table <- function(
    afmm, datasets, module_id, output_list, subjid_var, default_vars, pagination, intended_use_label,
    receiver_id, review, title_layout) {
  warn <- CM$container()
  err <- CM$container()

  # TODO: Write the API spec for the module and generate the check function below. Complement that with manual checks
  #       for parameters not representable by the API spec description language
  # nolint start
  # OK <- check_mod_Tplyr_table_auto(
  #   afmm, datasets, module_id, output_list, subjid_var, default_vars, pagination, intended_use_label,
  #   receiver_id, review, warn, err
  # )
  # nolint stop

  dv.listings::check_review_parameter(
    datasets = datasets,
    dataset_names = names(review[["datasets"]]),
    review,
    err
  )

  res <- list(warnings = warn[["messages"]], errors = err[["messages"]])
  return(res)
}

mod_Tplyr_table <- CM$module(
  mod_Tplyr_table, check_mod_Tplyr_table, dataset_info_Tplyr_table
)
