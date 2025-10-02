TPLYR_TBL <- pack_of_constants( #nolint
  TABLE_ID = "table_output",
  LISTINGS_ID = "listings",
  LISTINGS_HEADER_ID = "listings_header",
  LISTINGS_DIV_ID = "listings_div",
  SEL_OUTPUT_ID = "sel_output",
  SEL_OUTPUT_LABEL = "Select Output:",
  TABLE_TITLE_ID = "table title"
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

    #Considerations: Long name goes to the next line since its aligned from center
    # Maybe titles can be provided as attributes of the datasets used by tplyr table
    # But what happens when multiple datasets are used?
    # what about adding explicit argument in the output list?
    # Switching to listings, should we disable that ui generation?
    # Use output list name for it and cut it off after some characters? Or just replace it with generic name?
    # Check line plot implementation

    shiny::div(
      style = "display: flex; gap: 20px; align-items: center;",

      shiny::div(
        style = "flex: 1;",
        shiny::selectizeInput(
          ns(TPLYR_TBL$SEL_OUTPUT_ID),
          label = TPLYR_TBL$SEL_OUTPUT_LABEL,
          choices = names(output_list)
        )
      ),

      shiny::div(
        style = "flex: 1;",
        shiny::uiOutput(ns(TPLYR_TBL$TABLE_TITLE_ID))
      )
    ),

    #shiny::uiOutput(ns(TPLYR_TBL$SEL_OUTPUT_ID)),
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
      dataset_list_droppedlevels <- lapply(dataset_list(), function(df) {
        lbls <- get_lbls(df)
        df <- droplevels(df)
        df <- set_lbls(df, lbls)
      })

      dataset_list_droppedlevels
    })

    ## table part start ---

    # Table title

    title_ui <- local({

      drop_menu_helper <- function(id, label, ...) { # NOTE: not the drop_menu_helper in R/util-selectors.R
        shiny::tagAppendAttributes(
          shinyWidgets::dropMenu(
            shiny::actionButton(id, label),
            ...,
            arrow = TRUE
          ),
          style = "display:inline"
        )
      }

      output_menu <- drop_menu_helper(
        ns("")
      )

      output_ui <- function(id){
        ns <- shiny::NS(id)
        shiny::tagList(
          shiny::uiOutput(ns("title_menu"))
        )
      }
      output_server <- function(id, data){
        mod <- function(input, output, session) {

          ns <- session[["ns"]]

          output[["cat_menu"]] <- shiny::renderUI({
            shiny::tagList(
              shiny::tags[["style"]](shiny::HTML(paste0(
                "#",
                ns("cat_val"),
                " + div.selectize-control div.selectize-input.items {max-height:200px; overflow-y:auto;}"
              ))),
              shiny::selectizeInput(
                inputId = ns("cat_val"),
                label = cat_label,
                choices = NULL,
                multiple = FALSE,
                selected = NULL,
                options = options_cat
              )
            )
          })

        }
      }



   })

    output[[TPLYR_TBL$SEL_OUTPUT_ID]] <- shiny::renderUI({
      paste(input[[TPLYR_TBL$SEL_OUTPUT_ID]])
    })

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

    shiny::observeEvent(list(input[[TPLYR_TBL$SEL_OUTPUT_ID]], v_dataset_list()), {
      r_dataset_list <- v_dataset_list()
      selected_output_id <- input[[TPLYR_TBL$SEL_OUTPUT_ID]]
      selected_output <- output_list[[selected_output_id]]
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
                  "For output", input[[TPLYR_TBL$SEL_OUTPUT_ID]],
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


    shiny::observeEvent(sel_data(), {

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
    }, ignoreInit = TRUE) # To not overwrite the click_info_contents at start of the app

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


library(shiny)
library(shinyWidgets)

# Define UI
ui <- fluidPage(



  titlePanel("Dynamic String Input Example"),
  # Placeholder for the title menu
  shiny::uiOutput("title_menu")
)

# Define Server
server <- function(input, output, session) {


  ns <- session[["ns"]]

  drop_menu_helper <- function(id, label, ...) {
    shiny::tagAppendAttributes(
      shinyWidgets::dropMenu(
        shiny::actionButton(id, label),
        ...,
        arrow = TRUE
      ),
      style = "display:inline"
    )
  }

  # Create the output menu
  output_menu <- drop_menu_helper(
    id = ns("menu_button"),
    label = "Click Me",
    output_ui("output_list")  # Pass the module UI
  )

  # Interactive title
  title_ui <- it_interactive_title(
    "Title:",
    output_menu
  )

  # Render the title menu
  output$title_menu <- shiny::renderUI({
    title_ui
  })

  output_server("output_list")

}

output_ui <- function(id) {
  ns <- shiny::NS(id)
  shiny::tagList(
    shiny::uiOutput(ns("output_selector"))
  )
}

output_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    # Render the UI for the selector
    output$output_selector <- shiny::renderUI({
      shiny::tagList(
        shiny::tags$style(shiny::HTML(paste0(
          "#",
          ns("output_vals"),
          " + div.selectize-control div.selectize-input.items {max-height:200px; overflow-y:auto;}"
        ))),
        shiny::selectizeInput(
          inputId = ns("output_vals"),
          label = "Select output",
          choices = c("Option 1", "Option 2"),
          multiple = FALSE
        )
      )
    })

  })
}


it_custom_styles <- shiny::tags[["head"]](
  # nolint start
  shiny::tags[["style"]](
    "
    .nopad { display: inline-block; }                                 /* horizontal layout */
    .selector_as_link .selectize-input { border:0px; padding:0}             /* horizontally aligned with rest of text */
    .selector_as_link .shiny-input-container { width:auto; margin: 0 }
    .selector_as_link.shiny-input-container { width:auto; }
    .selector_as_link .selectize-control.single .selectize-input:after { display: none }
    .selector_as_link .control-label {display: none}
    .nopad .selectize-control { display: inline-block; vertical-align: top; margin: 0}

    .selector_as_link .item { color:#069; }                                    /* link-ish color */
    .selector_as_link .item:hover { text-decoration: underline; }              /* link-ish behavior */

    .selector_as_link .selectize-dropdown.single { width:auto !important }     /* wider drop-down options */

    .button_as_link.drop-menu-input .action-button { /* horizontally aligned with rest of text */
      vertical-align:top; border:0px; padding: 0; color:#069
    }

    .centered_flex_row { display:flex;flex-direction:row;justify-content:center;align-items:baseline;gap:0.5rem; }
    "
  )
  # nolint end
)

it_as_link <- function(tag) {
  res <- NULL
  checkmate::assert_class(tag, "shiny.tag")

  if (length(grep("\\<drop-menu-input\\>", tag$attribs[["class"]])) > 0) {
    res <- shiny::tagAppendAttributes(tag, class = "button_as_link")
  } else { # FIXME: Assumes (probably mistakenly, that anything that is not a drop menu is a selector)
    res <- shiny::tagAppendAttributes(tag, class = "selector_as_link nopad")
  }
  res
}

it_interactive_title <- function(...) {
  l <- list(...)
  for (i in seq_along(l)) {
    e <- l[[i]]
    if (is.character(e)) {
      e <- shiny::p(e)
    } else {
      e <- it_as_link(e)
    }
    l[[i]] <- e
  }

  div <- do.call(shiny::div, l) |> shiny::tagAppendAttributes(class = "centered_flex_row")

  return(shiny::tagList(it_custom_styles, div))
}


# Run the app
shinyApp(ui = ui, server = server)
