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

  testthat::test_that("Table cell click generates corresponding listing", {

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

  testthat::test_that("output can be switched", {

    table1 <- app$get_value(output = "test-table_output")
    app$set_inputs(`test-sel_output` = "Tabel 2")
    table2 <- app$get_value(output = "test-table_output")
    testthat::expect_false(table1 == table2)
  })

  testthat::test_that("only a listing can be displayed", {
    app$set_inputs(`test-sel_output` = "Listing")
    table_output <- app$get_value(output = "test-table_output")
    expected <- structure("{\"x\":null,\"evals\":[],\"jsHooks\":null,\"deps\":[]}", class = "json")
    expect_equal(table_output, expected)

    listings_data <- app$get_value(export = "test-listings_data")
    expect_equal(names(listings_data), c( "adsl", "adae"))
    # display of data will be tested in dv.listings
  })

  testthat::test_that("module works with global filter", {
    table_output <- app$get_value(output = "test-table_output")
    parsed_table_output <- jsonlite::fromJSON(table_output)
    default_table_data <- parsed_table_output$x$tag$attribs$data
    # remove placebo from data
    default_table_data_filtered <- default_table_data[!names(default_table_data) %in% "var1_Placebo"]

    app$set_inputs(`global_filter-vars` = "ARM")
    app$set_inputs(`global_filter-ARM` = c("Xanomeline High Dose", "Xanomeline Low Dose", "Screen Failure"))

    table_output_filtered <- app$get_value(output = "test-table_output")
    parsed_table_output_filtered <- jsonlite::fromJSON(table_output_filtered)
    filtered_table_data <- parsed_table_output_filtered$x$tag$attribs$data

    expect_equal(filtered_table_data, default_table_data_filtered)

  })
})

