# Event population flag tests
local({
  event_list <- list()
  event_list[["subj"]] <- factor(c("1", "1", "1", "1", "2", "2", "2", "3"))
  event_list[["lvl1"]] <- factor(c("A1", "A1", "B1", "B1", "A1", "A1", "B1", "A1"))
  event_list[["lvl2"]] <- factor(c("A2", "B2", "B2", "A2", "A2", "B2", "B2", "A2"))
  event_df <- as.data.frame(event_list)
  attr(event_df$lvl1, "label") <- "Level 1"
  attr(event_df$lvl2, "label") <- "Level 2"

  pop_list <- list()
  pop_list[["subj"]] <- factor(c(rep("1", 2), "2", rep("3", 2), "4"))
  pop_list[["group1"]] <- factor(c(rep("G1A", 2), "G1B", rep("G1B", 2), "G1C"))
  pop_list[["group2"]] <- factor(c(rep("G2X", 2), "G2X", rep("G2X", 2), "G2Z"))
  pop_list[[".pop_group"]] <- factor(c(c("ITT", "Safety"), "ITT", c("ITT", "Safety"), "ITT"))
  pop_list[[".pop_flag"]] <- factor(rep("Y", 6))
  pop_df <- as.data.frame(pop_list)
  attr(pop_df$group1, "label") <- "Group 1"
  attr(pop_df$group2, "label") <- "Group 2"
  attr(pop_df$.pop_group, "label") <- "Population Flag Group"
  attr(pop_df$.pop_flag, "label") <- "Population Flag"

  # Get variable labels for information display in final HTML
  combined_labels <- c(get_lbls_robust(event_df), get_lbls_robust(pop_df))
  var_labels <- combined_labels[!duplicated(names(combined_labels))]

  x <- compute_events_table(
    event_df = event_df,
    pop_df = pop_df,
    hierarchy = c("lvl1", "lvl2"),
    group_vars = c(".pop_group", "group1", "group2"),
    subjid_var = "subj",
    pop_flag_vars = c("ITTFL", "SAFFL")
  )

  s <- compute_order_events_table(x)

  w <- pivot_wide_format_events_table(x, 0)

  sw <- sort_wider_formatter_events_table(w, s)

  html <- sort_wide_format_event_table_to_HTML(sw, var_labels)

  # We will test against snapshots that we have checked is correct

  test_that("event group by is correct, sorting, against (snapshot)" |>
              vdoc[["add_spec"]](
                c(
                  specs$hierarchical_count_table$event_count,
                  specs$hierarchical_count_table$event_group_by_display
                )
              ), {
                expect_snapshot(x)
                expect_snapshot(s)
                expect_snapshot(sw)
                expect_snapshot(html)
              })
})
