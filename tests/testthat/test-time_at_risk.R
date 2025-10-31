# Time at risk tests
local({
  event_list <- list()
  event_list[["subj"]] <- factor(c("1", "1", "1", "1", "2", "2", "2", "3"))
  event_list[["lvl1"]] <- factor(c("A1", "A1", "B1", "B1", "A1", "A1", "B1", "A1"))
  event_list[["lvl2"]] <- factor(c("A2", "B2", "B2", "A2", "A2", "B2", "B2", "A2"))
  event_list[["evntdt"]] <- as.Date(c("2024-12-31", "2025-01-01", "2025-01-10", "2025-01-11",
                                      "2025-02-02", "2025-12-20", "2025-02-20",
                                      "2025-03-20"))
  event_df <- as.data.frame(event_list)

  pop_list <- list()
  pop_list[["subj"]] <- factor(c("1", "2", "3", "4"))
  pop_list[["group"]] <- factor(c("GA", "GB", "GB", "GC"))
  pop_list[["origdt"]] <- as.Date(c("2025-01-01", "2025-02-02", "2025-03-03", "2025-04-04"))
  pop_list[["censdt"]] <- as.Date(c("2025-01-10", "2025-02-20", "2025-03-23", "2025-04-24"))
  pop_df <- as.data.frame(pop_list)

  x <- compute_events_table(
    event_df = event_df,
    pop_df = pop_df,
    hierarchy = c("lvl1", "lvl2"),
    group_var = "group",
    subjid_var = "subj",
    origin_date_var = "origdt",
    censor_date_var = "censdt",
    event_date_var = "evntdt",
    total = FALSE,
    total_group_val = NULL,
    compute_risk = TRUE
  )

  s <- compute_order_events_table(x)

  w <- pivot_wide_format_events_table(x, 0)

  sw <- sort_wider_formatter_events_table(w, s)

  html <- sort_wide_format_event_table_to_HTML(sw)

  # We will test against snapshots that we have checked is correct

  test_that("time at risk is correct, sorting, against (snapshot)" |>
    vdoc[["add_spec"]](
      c(
        specs$hierarchical_count_table$time_at_risk,
        specs$hierarchical_count_table$time_at_risk_display
      )
    ), {
    expect_snapshot(x)
    expect_snapshot(s)
    expect_snapshot(sw)
    expect_snapshot(html)
  })
})
