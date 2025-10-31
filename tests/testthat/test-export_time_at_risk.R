# Export table tests
local({
  event_list <- list()
  event_list[["subj"]] <- factor(c("1", "1", "1", "1", "2", "2", "2", "3"))
  event_list[["lvl1"]] <- factor(c("A1", "A1", "B1", "B1", "A1", "A1", "B1", "A1"))
  event_list[["lvl2"]] <- factor(c("A2", "B2", "B2", "A2", "A2", "B2", "B2", "A2"))
  event_list[["evntdt"]] <- as.Date(c("2024-12-31", "2025-01-01", "2025-01-10", "2025-01-11",
                                      "2025-02-02", "2025-12-20", "2025-02-20",
                                      "2025-03-20"))
  event_df <- as.data.frame(event_list)

  event_hierarchy <- c("lvl1", "lvl2")
  attr(event_hierarchy, "labels") <- c("lvl1", "Level 2")

  pop_list <- list()
  pop_list[["subj"]] <- factor(c("1", "2", "3", "4"))
  pop_list[["group"]] <- factor(c("GA", "GB", "GB", "GC"))
  pop_list[["origdt"]] <- as.Date(c("2025-01-01", "2025-02-02", "2025-03-03", "2025-04-04"))
  pop_list[["censdt"]] <- as.Date(c("2025-01-10", "2025-02-20", "2025-03-23", "2025-04-24"))
  pop_df <- as.data.frame(pop_list)

  x <- compute_events_table(
    event_df = event_df,
    pop_df = pop_df,
    hierarchy = event_hierarchy,
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

  # Download Excel, split N and % into separate columns ----
  exp_tab <- preprocess_download_table(sw, ".xlsx", TRUE)

  test_that("Add a new row" |>
    vdoc[["add_spec"]](c(specs$export_time_at_risk_table$export_tar_add_new_row)), {
    expect_equal(exp_tab[1, 1], "Overall No. of Patients")
  })

  test_that("Replace special characters" |>
    vdoc[["add_spec"]](c(specs$export_time_at_risk_table$export_tar_replace_special_char)), {
    expect_false(any(grepl("\035", names(exp_tab))))
  })

  test_that("Separates N/pct columns into two, remove parentheses" |>
    vdoc[["add_spec"]](c(
      specs$export_time_at_risk_table$export_tar_separate_cols,
      specs$export_time_at_risk_table$export_tar_remove_parantheses
    )), {
    expect_true(all(paste0(pop_list[["group"]], " [N]") %in% names(exp_tab)))
    expect_true(all(paste0(pop_list[["group"]], " [%]") %in% names(exp_tab)))
    expect_true(all(paste0(pop_list[["group"]], " [Time at Risk]") %in% names(exp_tab)))
    expect_true(all(paste0(pop_list[["group"]], " [Incidence Rate]") %in% names(exp_tab)))
    per_cols <- grep(" [%]$", names(exp_tab), value = TRUE)
    expect_false(any(grepl("\\(|\\)", per_cols)))
  })

  test_that("Add label to event columns" |>
    vdoc[["add_spec"]](c(specs$export_time_at_risk_table$export_tar_label_event_cols)), {
    expect_equal(names(exp_tab[1:2]), c("lvl1", "lvl2 [Level 2]"))
  })

  # Download Word, keep N and % in single column ----
  exp_tab <- preprocess_download_table(sw, ".rtf", FALSE)

  test_that("Indent event values for dual event columns" |>
    vdoc[["add_spec"]](c(specs$export_time_at_risk_table$export_tar_indent_values)), {
    expect_equal(names(exp_tab[1]), "lvl1<br>  Level 2")
    expect_true(all(c("Overall No. of Patients", "Total",
                      "A1", "B1", "  A2", "  B2") %in% exp_tab[[1]]))
  })

  test_that("Keep N and % in single column" |>
    vdoc[["add_spec"]](c(specs$export_time_at_risk_table$export_tar_single_n_pct_cols)), {
    group_cols <- tail(names(exp_tab), ncol(exp_tab) - 1)
    expect_true(all(grepl("<br>N \\(%\\)|<br>Time at Risk|<br>Incidence Rate", group_cols)))
    expect_true(all(grepl("^[0-9]+ \\([0-9.]+\\)$|^\u2014$", tail(exp_tab[[2]], nrow(exp_tab) - 1))))
  })
})
