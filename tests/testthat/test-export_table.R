local({
  event_list <- list()
  event_list[["subj"]] <- factor(c("1", "1", "1", "1", "2", "2", "2", "3"))
  event_list[["lvl1"]] <- factor(c("A1", "A1", "B1", "B1", "A1", "A1", "B1", "A1"))
  event_list[["lvl2"]] <- factor(c("A2", "B2", "B2", "A2", "A2", "B2", "B2", "A2"))
  event_df <- as.data.frame(event_list)

  event_hierarchy <- c("lvl1", "lvl2")
  attr(event_hierarchy, "labels") <- c("lvl1", "Level 2")

  pop_list <- list()
  pop_list[["subj"]] <- factor(c("1", "2", "3", "4"))
  pop_list[["group"]] <- factor(c("GA", "GB", "GC", "GC"))
  pop_df <- as.data.frame(pop_list)

  x <- compute_events_table(
    event_df = event_df,
    pop_df = pop_df,
    hierarchy = event_hierarchy,
    group_var = "group",
    subjid_var = "subj"
  )

  s <- compute_order_events_table(x)

  w <- pivot_wide_format_events_table(x, 0)

  sw <- sort_wider_formatter_events_table(w, s)

  # Download Excel, split N and % into separate columns ----
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

  test_that("Add label to event columns" |>
    vdoc[["add_spec"]](c(specs$export_count_table$export_label_event_cols)), {
    expect_equal(names(exp_tab[1:2]), c("lvl1", "lvl2 [Level 2]"))
  })

  # Download Word, keep N and % in single column ----
  exp_tab <- preprocess_download_table(sw, ".rtf", FALSE)

  test_that("Indent event values for dual event columns" |>
    vdoc[["add_spec"]](c(specs$export_count_table$export_indent_values)), {
    expect_equal(names(exp_tab[1]), "lvl1<br>  Level 2")
    expect_true(all(c("Overall No. of Patients", "Total",
                      "A1", "B1", "  A2", "  B2") %in% exp_tab[[1]]))
  })

  test_that("Keep N and % in single column" |>
    vdoc[["add_spec"]](c(specs$export_count_table$export_single_n_pct_cols)), {
    group_cols <- tail(names(exp_tab), ncol(exp_tab) - 1)
    expect_true(all(grepl("<br>N \\(%\\)", group_cols)))
    expect_true(all(grepl("^[0-9]+ \\([0-9.]+\\)$", tail(exp_tab[[2]], nrow(exp_tab) - 1))))
  })
})
