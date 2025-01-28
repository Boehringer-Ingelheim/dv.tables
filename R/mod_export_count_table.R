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
      "I agree to the following: Use only for internal review and monitoring during the conduct of clinical trials."
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
#'
#' @return Event dataset downloaded as a csv
#'
#' @keywords internal
mod_export_counttable_server <- function(module_id, dataset) {
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

        # If there is no dataset being displayed
        if (is.null(dataset)) {
          shinyFeedback::showToast(
            "info", "There is no dataset displayed currently. This may arise due to your filter choices or
            because the dataset is still loading.",
            .options = list(positionClass = "toast-top-right")
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
          return(paste(EXP$MSG$DATAPROTECT_LABEL))
        } else {
          return(shiny::tags$embed(
            paste(EXP$MSG$DATAPROTECT_LABEL),
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
      download_enable <- shiny::eventReactive(
        c(input[[EXP$ID$FILENAME_BOX]], input[[EXP$ID$DATAPROTECT_BOX]]),
        {
          if (
            (input[[EXP$ID$FILENAME_BOX]] != "") &
              input[[EXP$ID$DATAPROTECT_BOX]]
          ) { # nolint end
            return(TRUE)
          } else {
            return(FALSE)
          }
        }
      )

      # Enable/disable download button separately (to allow testing of logic)
      shiny::observeEvent(download_enable(), {
        if (download_enable()) {
          shinyjs::enable(EXP$ID$DOWNLOAD_BUTTON)
        } else {
          shinyjs::disable(EXP$ID$DOWNLOAD_BUTTON)
        }
      })

      # Download
      output[[EXP$ID$DOWNLOAD_BUTTON]] <- shiny::downloadHandler(
        filename = function() {
          paste0(input[[EXP$ID$FILENAME_BOX]], ".csv")
        },
        content = function(file) {
          shiny::removeModal() # close pop up

          # Dataframe contains summary and all subject info. as list of lists
          # Filter for summary data using lvl
          # Extract the required named list
          # Separate the columns into count and percentage

          colvars <- names(dataset$meta$n_denominator)

          # Hierarchy selection info. available from lvl var

          csvfile <- dataset[["df"]] |>
            dplyr::rename(lvl = dataset[["meta"]]$hier_lvl_col) |>
            dplyr::filter(lvl == ifelse(any(lvl == 3), 2, 1)) |>
            dplyr::select(
              dataset$meta$hierarchy[1],
              colvars
            ) |>
            dplyr::mutate(dplyr::across(
              dplyr::where(is.list),
              ~ purrr::map_chr(., "count")
            )) |>
            dplyr::mutate(dplyr::across(
              dplyr::all_of(colvars),
              ~ ifelse(. == "\u2014", NA, .)
            ))
          csvfile <- purrr::reduce(colvars, separate_column, .init = csvfile)

          write.csv(csvfile, file, row.names = FALSE)
        }
      )
    }
  )
}
