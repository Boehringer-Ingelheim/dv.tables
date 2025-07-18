EXP <- poc(
  ID = poc(
    EXPORT_BUTTON = "export_button",
    DOWNLOAD_BUTTON = "download_button",
    CANCEL_BUTTON = "cancel_button",
    DOWNLOAD_TYPE = "download_type",
    COUNTPCT_BOX = "countpct_box",
    FILENAME_BOX = "filename_box",
    DATAPROTECT_BOX = "dataprotect_box"
  ),
  MSG = poc(
    DATAPROTECT_LABEL = paste(
      "I agree to the following:"
    ),
    DATAPROTECT_WARN = "Check box needs to be checked."
  )
)

#' Create user interface for the export count table shiny module of \pkg{dv.tables}
#'
#' @param module_id `[character(1)]` A unique ID string to create a namespace. Must match the ID of
#'   \code{mod_export_counttable_server()}.
#'
#' @return A shiny \code{uiOutput} element.
#' @describeIn mod_export_counttable_UI This function creates the user interface for the export count table shiny module.
#' @keywords internal
mod_export_counttable_UI <- function(module_id) { # nolint

  # Check validity of arguments
  checkmate::assert_string(module_id, min.chars = 1)

  ns <- shiny::NS(module_id)

  ui <- shiny::tagList(
    shinyFeedback::useShinyFeedback(), # needed to use shinyFeedback functionalities
    shinyjs::useShinyjs(), # needed to use shinyjs functionalities

    shiny::actionButton(ns(EXP$ID$EXPORT_BUTTON), label = "Download")
  )

  return(ui)
}


#' Server logic for the export count table
#'
#' @param module_id The ID for the event count module instance.
#' @param dataset A reactive list containing dataset containing the event data and other metadata.
#' @inheritParams hierarchical_count_table_server
#'
#' @return Event data downloaded as an Excel (`.xlsx`) or Word (`.rtf`) file.
#' @describeIn mod_export_counttable_server This function handles the server logic for the export count table.
#' @keywords internal
mod_export_counttable_server <- function(module_id, dataset,
                                         intended_use_label) {

  checkmate::check_string(module_id, min.chars = 1)

  shiny::moduleServer(
    module_id,
    function(input, output, session) {
      ns <- session$ns

      # Download modal
      shiny::observeEvent(input[[EXP$ID$EXPORT_BUTTON]], {
        # check validity of parameters

        if (is.null(dataset()) |
            !is.list(dataset()) |
            !all(c("df", "meta") %in% names(dataset())) |
            !is.data.frame(dataset()[["df"]]) |
            !all(c("n_denominator", "hierarchy", "hier_lvl_col") %in% names(dataset()[["meta"]]))) {

          shiny::showNotification(
            "The dataset is not in the expected format or is missing necessary metadata. Please check the data and try again.",
            type = "error",
            duration = NULL,
            closeButton = TRUE,
            id = NULL
          )

        } else {
          shiny::showModal(
            shiny::modalDialog(
              shiny::tagList(
                shiny::radioButtons(ns(EXP$ID$DOWNLOAD_TYPE), "Download Type",
                                    choices = c("Excel (.xlsx)" = ".xlsx",
                                                "Word (.rtf)" = ".rtf"),
                                    selected = ".xlsx"),
                shiny::checkboxInput(
                  ns(EXP$ID$COUNTPCT_BOX),
                  "Split count and percent into separate columns",
                  value = TRUE,
                  width = "100%"
                ),
                shiny::textInput(
                  ns(EXP$ID$FILENAME_BOX),
                  "Enter file name",
                  value = "file_name"
                ),
                shiny::checkboxInput(
                  inputId = ns(EXP$ID$DATAPROTECT_BOX),
                  label = shiny::uiOutput(ns("label_id"), inline = TRUE),
                  width = "100%"
                )
              ),
              title = "Download table",
              footer = list(shiny::fluidRow(
                shiny::column(5, shinyjs::disabled(shiny::downloadButton(ns(EXP$ID$DOWNLOAD_BUTTON))), offset = 5),
                shiny::column(1, shiny::modalButton("Cancel"))
              )),
              easyClose = TRUE
            )
          )
        }
      })

      # Add/remove checkbox warning
      checkbox_label <- shiny::eventReactive(input[[EXP$ID$DATAPROTECT_BOX]], {
        if (input[[EXP$ID$DATAPROTECT_BOX]]) {
          return(paste(EXP$MSG$DATAPROTECT_LABEL, intended_use_label))
        } else {
          return(shiny::tags$embed(
            paste(EXP$MSG$DATAPROTECT_LABEL, intended_use_label),
            shiny::br(shiny::tags$span(
              style = paste("color:", "#CC3333"),
              EXP$MSG$DATAPROTECT_WARN
            ))
          ))
        }
      })

      # Update checkbox label separately (to allow testing of logic)
      output$label_id <- shiny::renderUI(checkbox_label())


      # Check if we should enable/disable download button
      shiny::observe({
        # Check if the inputs exist
        sanitized_fname <- fs::path_sanitize(input[[EXP$ID$FILENAME_BOX]])
        enable_button <- (nchar(sanitized_fname) > 0) && isTRUE(input[[EXP$ID$DATAPROTECT_BOX]])
        shinyjs::toggleState(id = EXP$ID$DOWNLOAD_BUTTON, condition = enable_button)
      })

      # Download
      output[[EXP$ID$DOWNLOAD_BUTTON]] <- shiny::downloadHandler(
        filename = function() {
          input[[EXP$ID$FILENAME_BOX]] |>
            sub("\\.[[:alnum:]]*$", "", x = _) |>
            paste0(input[[EXP$ID$DOWNLOAD_TYPE]]) |>
            fs::path_sanitize()
        },
        content = function(file) {
          shiny::removeModal() # close pop up

          # Preprocess table for download
          df_prep <- preprocess_download_table(dataset(),
                                               download_type = input[[EXP$ID$DOWNLOAD_TYPE]],
                                               split_columns = input[[EXP$ID$COUNTPCT_BOX]])

          if (input[[EXP$ID$DOWNLOAD_TYPE]] == ".rtf") {
            gt_object <- gt::gt(df_prep) |>
              gt::tab_options(page.orientation = "landscape")
            rtf_string <- gt::as_rtf(gt_object) |>
              gsub("<br>", "\\\\line ", x = _)
            writeLines(rtf_string, file)
          } else {
            openxlsx::write.xlsx(df_prep, file)
          }
        }
      )
    }
  )
}
