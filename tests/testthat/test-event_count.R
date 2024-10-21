# Event count
local({
  event_list <- list()
  event_list[["subj"]] <- factor(c("1", "1", "1", "1", "2", "2", "2", "3"))
  event_list[["lvl1"]] <- factor(c("A1", "A1", "B1", "B1", "A1", "A1", "B1", "A1"))
  event_list[["lvl2"]] <- factor(c("A2", "B2", "B2", "A2", "A2", "B2", "B2", "A2"))
  event_df <- as.data.frame(event_list)

  pop_list <- list()
  pop_list[["subj"]] <- factor(c("1", "2", "3", "4"))
  pop_list[["group"]] <- factor(c("GA", "GB", "GC", "GC"))
  pop_df <- as.data.frame(pop_list)

  x <- compute_events_table(
    event_df = event_df,
    pop_df = pop_df,
    hierarchy = c("lvl1", "lvl2"),
    group_var = "group",
    subjid_var = "subj"
  )

  s <- compute_order_events_table(x)

  w <- pivot_wide_format_events_table(x, 0)

  sw <- sort_wider_formatter_events_table(w, s)

  html <- sort_wide_format_event_table_to_HTML(sw)

  test_that("snapshots for development", {
    testthat::expect_snapshot(x)
    testthat::expect_snapshot(w)
    testthat::expect_snapshot(sw)
    testthat::expect_snapshot(html)
  })

  # Testing is done in a simpler way at the end of the count and sorting
  # We will test against an snapshot that we have checked is correct


  test_that("counting is correct, sorting, against (snapshot)" |>
    vdoc[["add_spec"]](
      c(specs$event_count$event_count, specs$event_count$event_count_display, specs$event_count$sorted_table_display)
    ), {
    expect_snapshot(x)
  })

  test_that("filtering is correct, agains (snapshot)" |>
    vdoc[["add_spec"]](c(specs$event_count$minimum_percentage_filter)), {
    w <- pivot_wide_format_events_table(x, 50)
    expect_snapshot(w)
  })

  # app ----

  tns <- tns_factory("mod")

  ID <- poc( # nolint
    INPUT = poc(
      HIERARCHY = tns(EC$ID$HIERARCHY, "val"),
      GRP = tns(EC$ID$GRP, "val"),
      MIN_PERCENT = tns(EC$ID$MIN_PERCENT)
    ),
    OUTPUT = poc(
      TABLE = tns(EC$ID$TABLE)
    )
  )

  root_app <- start_app_driver(rlang::quo(dv.tables::mock_app_event_count()))
  on.exit(if ("stop" %in% names(root_app)) root_app$stop())

  fail_if_app_not_started <- function() {
    if (is.null(root_app)) rlang::abort("App could not be started")
  }

  app <- shinytest2::AppDriver$new(root_app$get_url())

  test_that("hierarchy levels can be selected" |>
    vdoc[["add_spec"]](c(specs$event_count$hierarchy_selection)), {
    hierarchy <- c("AEBODSYS", "AETERM")
    app$set_inputs(!!ID$INPUT$HIERARCHY := hierarchy) # nolint
    expect_identical(
      app$get_values(input = TRUE)[["input"]][[ID$INPUT$HIERARCHY]],
      hierarchy
    )
  })

  test_that("group variables can be selected" |>
    vdoc[["add_spec"]](c(specs$event_count$group_selection)), {
    group <- c("SEX")
    app$set_inputs(!!ID$INPUT$GRP := group) # nolint
    expect_identical(
      app$get_values(input = TRUE)[["input"]][[ID$INPUT$GRP]],
      group
    )
  })

  test_that("a count table is displayed" |>
    vdoc[["add_spec"]](c(specs$event_count$events_table_display)), {
    tb <- app$get_values(output = TRUE)[["output"]][[ID$OUTPUT$TABLE]][["html"]]
    expect_snapshot(tb)
  })

  test_that("cells can be clicked and the id of participants is returned" |>
    vdoc[["add_spec"]](c(specs$event_count$cell_interactivity)), {
    app$run_js("document.querySelector('#mod-table > div > table > tbody > tr.indent-0 > td:nth-child(2)').click();")
    res <- shiny::isolate(app$get_values(export = TRUE)[["export"]][[tns("res")]]())
    expect_snapshot(res)
  })
})
