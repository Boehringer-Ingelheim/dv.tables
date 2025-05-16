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

  exp_tab <- preprocess_download_table(sw, ".xlsx", TRUE)

  test_that("Add a new row" |>
    vdoc[["add_spec"]](c(specs$export_count_table$export_add_new_row)), {
    expect_equal(exp_tab[1, 1], "Overall No. of Patients")
  })

  test_that("Replace special characters" |>
    vdoc[["add_spec"]](c(specs$export_count_table$export_replace_special_char)), {
    expect_false(any(grepl("\035", names(exp_tab))))
  })

  test_that("Separates columns into two, remove parentheses" |>
    vdoc[["add_spec"]](c(
      specs$export_count_table$export_separate_cols,
      specs$export_count_table$export_remove_parantheses
    )), {
    expect_true(all(paste0(pop_list[["group"]], " [N]") %in% names(exp_tab)))
    expect_true(all(paste0(pop_list[["group"]], " [%]") %in% names(exp_tab)))

    per_cols <- grep(" [%]$", names(exp_tab), value = TRUE)
    expect_false(any(grepl("\\(|\\)", per_cols)))
  })
})
