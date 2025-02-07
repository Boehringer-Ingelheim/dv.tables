EXP <- poc(
  ID = poc(
    EXPORT_BUTTON = "export_button",
    DOWNLOAD_BUTTON = "download_button",
    CANCEL_BUTTON = "cancel_button",
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

#' @describeIn mod_export_counttable_UI
#' Create user interface for the export count table shiny module of \pkg{dv.tables}
#'
#' @param module_id `[character(1)]` A unique ID string to create a namespace. Must match the ID of
#'   \code{mod_exp_listings_server()}.
#'
#' @return A shiny \code{uiOutput} element.
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


#' @describeIn mod_export_counttable_server
#' Server logic for the export count table
#'
#' @param module_id The ID for the event count module instance.
#' @param dataset A reactive list containing dataset containing the event data
#' and other meta data
#' @param intended_use_label Either a string indicating the intended use for export, or
#' NULL. The provided label will be displayed prior to the download and will also be included in the exported file.
#'
#' @return Event dataset downloaded as a excel
#'
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


        checkmate::assert(
          checkmate::check_list(dataset),
          checkmate::check_subset(names(dataset), choices = c("df", "meta")),
          checkmate::check_data_frame(dataset[["df"]]),
          all(c("n_denominator", "hierarchy", "hier_lvl_col") %in% names(dataset[["meta"]])),
          combine = "and"
        )

        if (is.null(dataset)) {
          shiny::showNotification(
            "There is no dataset displayed currently. This may arise due to your filter choices or because the dataset is still loading.",
            type = "message",
            duration = NULL,
            closeButton = TRUE,
            id = NULL,
            placement = "top-right"
          )
        } else {
          shiny::showModal(
            shiny::modalDialog(
              shiny::tagList(
                shiny::textInput(
                  ns(EXP$ID$FILENAME_BOX),
                  "Insert file name",
                  value = "file_name"
                ),
                shiny::checkboxInput(
                  inputId = ns(EXP$ID$DATAPROTECT_BOX),
                  label = shiny::uiOutput(ns("label_id"), inline = TRUE),
                  width = "100%"
                )
              ),
              title = "Download box",
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
        if (!is.null(input[[EXP$ID$FILENAME_BOX]]) && !is.null(input[[EXP$ID$DATAPROTECT_BOX]])) {
          # Check if the conditions are met
          if (input[[EXP$ID$FILENAME_BOX]] != "" && input[[EXP$ID$DATAPROTECT_BOX]]) {
            shinyjs::enable(EXP$ID$DOWNLOAD_BUTTON)
          } else {
            shinyjs::disable(EXP$ID$DOWNLOAD_BUTTON)
          }
        }
      })

      # Download
      output[[EXP$ID$DOWNLOAD_BUTTON]] <- shiny::downloadHandler(
        filename = function() {
          paste0(input[[EXP$ID$FILENAME_BOX]], ".xlsx")
        },
        content = function(file) {
          shiny::removeModal() # close pop up

          excelfile <- preprocess_download_table(dataset)

          writexl::write_xlsx(excelfile, file)
        }
      )
    }
  )
}
