local({
  root_app <- start_app_driver(rlang::quo(dv.tables:::mock_Tplyr_table()))
  on.exit(if ("stop" %in% names(root_app)) root_app$stop())

  fail_if_app_not_started <- function() {
    if (is.null(root_app)) rlang::abort("App could not be started")
  }

  fail_if_app_not_started()
  skip_if_not_running_shiny_tests <- function() testthat::skip_if_not(run_shiny_tests, message = "Skip tests") # nolint
  skip_if_suspect_check <- function() testthat::skip_if(suspect_check, message = "Suspected check")

  app <- shinytest2::AppDriver$new(root_app$get_url())

  test_that("App initialization is correct" #|>
    #vdoc[["add_spec"]](specs$clicktablespecs$framework)
    , {
    app_outputs <- app$get_values(output = "mock_tplyr-table_output")

    # Parse the JSON
    parsed_json <- jsonlite::fromJSON(app_outputs$output$`mock_tplyr-table_output`)

    # Extract the data keys
    data_keys <- parsed_json$x$tag$attribs$columns$id

    # Define the expected keys
    expected_keys <- c(
      "row_label1", "row_label2", "var1_Placebo",
      "var1_Screen Failure",
      "var1_Xanomeline High Dose",
      "var1_Xanomeline Low Dose"
    )

    # Compare the extracted keys with the expected keys
    expect_equal(data_keys, expected_keys)
  })



  test_that("Click event generates dv.listings output" #|>
    #vdoc[["add_spec"]](specs$clicktablespecs$clickevent)
    , {
    # Update output value
    app$set_inputs(
      `mock_tplyr-row_id` = list(index = 8),
      `mock_tplyr-col_id` = list(column = "var1_Xanomeline Low Dose"),
      allow_no_input_binding_ = TRUE
    )

    # Wait until Shiny is not busy for 500ms
    app$wait_for_idle(500)

    app_outputs <- app$get_values(
      input = "mock_tplyr-listings-col_sel",
      output = "mock_tplyr-table_output",
      export = "mock_tplyr-listings-output_table"
    )

    # Parse the JSON
    parsed_json <- jsonlite::fromJSON(app_outputs$output$`mock_tplyr-table_output`)

    # Check the number of patients in listing is equal to the value in clicked cell

    # Get patient number from clicked cell

    cell_val <- as.integer(gsub("\\s+", "", sub(
      "\\(.*", "",
      parsed_json$x$tag$attribs$data$`var1_Xanomeline Low Dose`[8]
    )))

    expect_equal(
      cell_val,
      nrow(app_outputs$export$`mock_tplyr-listings-output_table`)
    )

    # Check if column selector is correctly populated

    expect_equal(
      app_outputs$input$`mock_tplyr-listings-col_sel`,
      colnames(app_outputs$export$`mock_tplyr-listings-output_table`)
    )
  })

  test_that("Click event outside required area generates empty listing" #|>
    #vdoc[["add_spec"]](specs$clicktablespecs$error)
    , {
    # Update output value
    app$set_inputs(
      `mock_tplyr-row_id` = list(index = 3),
      `mock_tplyr-col_id` = list(column = "row_label1"),
      allow_no_input_binding_ = TRUE
    )

    # Wait until Shiny is not busy for 500ms
    app$wait_for_idle(500)

    # get output values
    app_outputs <- app$get_values(export = "mock_tplyr-listings-output_table")

    expect_equal(
      nrow(app_outputs$export$`mock_tplyr-listings-output_table`),
      0
    )
  })
})


