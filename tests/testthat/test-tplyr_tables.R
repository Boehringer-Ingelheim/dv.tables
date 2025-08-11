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

  test_that("App initialization is correct" |>
    vdoc[["add_spec"]](specs$Tplyr_tables$framework)
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



  test_that("Click event generates dv.listings output" |>
    vdoc[["add_spec"]](specs$Tplyr_tables$clickevent)
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

  test_that("Click event outside required area generates empty listing" |>
    vdoc[["add_spec"]](specs$Tplyr_tables$error)
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

## tests with module manager
local({
  root_app <- start_app_driver(rlang::quo(dv.tables:::mock_Tplyr_table_mm()))
  on.exit(if ("stop" %in% names(root_app)) root_app$stop())

  fail_if_app_not_started <- function() {
    if (is.null(root_app)) rlang::abort("App could not be started")
  }

  fail_if_app_not_started()
  skip_if_not_running_shiny_tests <- function() testthat::skip_if_not(run_shiny_tests, message = "Skip tests") # nolint
  skip_if_suspect_check <- function() testthat::skip_if(suspect_check, message = "Suspected check")

  app <- shinytest2::AppDriver$new(root_app$get_url())

  testthat::test_that("Table cell click generates corresponding listing" |>
                        vdoc[["add_spec"]](specs$Tplyr_tables$clickevent), {

    app$set_inputs(
      `test-row_id` = list(index = 8),
      `test-col_id` = list(column = "var1_Xanomeline Low Dose"),
      allow_no_input_binding_ = TRUE
    )

    actual <- shiny::isolate(app$get_value(export = "test-subject_subset")())
    actual <- as.character(actual)

    expected <- c(
      "01-701-1097", "01-701-1192", "01-701-1317", "01-701-1324", "01-701-1442",
      "01-703-1379", "01-704-1135", "01-704-1218", "01-705-1292", "01-705-1431",
      "01-708-1084", "01-708-1348", "01-709-1020", "01-709-1326", "01-710-1235",
      "01-713-1043", "01-713-1073", "01-714-1195", "01-715-1085", "01-716-1103",
      "01-716-1157", "01-716-1167", "01-717-1004", "01-717-1446", "01-718-1254"
    )

    testthat::expect_equal(actual, expected)

  })

  testthat::test_that("output can be switched" |>
                        vdoc[["add_spec"]](specs$Tplyr_tables$output_switching), {

    table1 <- app$get_value(output = "test-table_output")
    app$set_inputs(`test-sel_output` = "Tabel 2")
    table2 <- app$get_value(output = "test-table_output")
    testthat::expect_false(table1 == table2)
  })

  testthat::test_that("only a listing without a table can be displayed" |>
                        vdoc[["add_spec"]](specs$Tplyr_tables$only_listing), {
    app$set_inputs(`test-sel_output` = "Listing")
    table_output <- app$get_value(output = "test-table_output")
    expected <- structure("{\"x\":null,\"evals\":[],\"jsHooks\":null,\"deps\":[]}", class = "json")
    expect_equal(table_output, expected)

    listings_data <- app$get_value(export = "test-listings_data")
    expect_equal(names(listings_data), c( "adsl", "adae"))
    # display of data will be tested in dv.listings
  })

  testthat::test_that("module works with global filter" |>
                        vdoc[["add_spec"]](specs$Tplyr_tables$global_filter), {
    table_output <- app$get_value(output = "test-table_output")
    parsed_table_output <- jsonlite::fromJSON(table_output)
    default_table_data <- parsed_table_output$x$tag$attribs$data
    # remove placebo from data
    default_table_data_filtered <- default_table_data[!names(default_table_data) %in% "var1_Placebo"]

    app$set_inputs(`global_filter-vars` = "ARM")
    app$wait_for_idle()
    app$set_inputs(`global_filter-ARM` = c("Xanomeline High Dose", "Xanomeline Low Dose", "Screen Failure"))

    table_output_filtered <- app$get_value(output = "test-table_output")
    parsed_table_output_filtered <- jsonlite::fromJSON(table_output_filtered)
    filtered_table_data <- parsed_table_output_filtered$x$tag$attribs$data

    expect_equal(filtered_table_data, default_table_data_filtered)

  })
})
