# Event group-by tests

# Function tests ----
local({
  event_list <- list()
  event_list[["subj"]] <- factor(c("1", "1", "1", "1", "2", "2", "2", "3"))
  event_list[["lvl1"]] <- factor(c("A1", "A1", "B1", "B1", "A1", "A1", "B1", "A1"))
  event_list[["lvl2"]] <- factor(c("A2", "B2", "B2", "A2", "A2", "B2", "B2", "A2"))
  event_list[["evtgrp"]] <- factor(c("EG1", "EG1", "EG2", "EG3", "EG2", "EG1", "EG3", "EG3"))
  event_df <- as.data.frame(event_list)

  pop_list <- list()
  pop_list[["subj"]] <- factor(c("1", "2", "3", "4"))
  pop_list[["group"]] <- factor(c("GA", "GB", "GB", "GC"))
  pop_df <- as.data.frame(pop_list)

  attr(event_df$lvl1, "label") <- "Level 1"
  attr(event_df$lvl2, "label") <- "Level 2"
  attr(event_df$evtgrp, "label") <- "Event Group"

  # Get variable labels for information display in final HTML
  combined_labels <- c(get_lbls_robust(event_df), get_lbls_robust(pop_df))
  var_labels <- combined_labels[!duplicated(names(combined_labels))]

  x1 <- compute_events_table(
    event_df = event_df,
    pop_df = pop_df,
    hierarchy = c("lvl1", "lvl2"),
    group_vars = "group",
    subjid_var = "subj",
    event_group_var = "evtgrp"
  )

  s1 <- compute_order_events_table(x1)

  w1 <- pivot_wide_format_events_table(x1, 0)

  sw1 <- sort_wider_formatter_events_table(w1, s1)

  html1 <- sort_wide_format_event_table_to_HTML(sw1, var_labels)

  # We will test against snapshots that we have checked is correct

  test_that(vdoc[["add_spec"]](
    "event group by is correct, sorting, against (snapshot)",
    c(
      specs$hierarchical_count_table$event_count,
      specs$hierarchical_count_table$event_group_by_display
    )
  ), {
    expect_snapshot({
      options(width = 250)
      print(x1$df, n = 999)
      print(x1$meta)
    })
    expect_snapshot(s1)
    expect_snapshot(sw1)
    expect_snapshot(html1)
  })

  x2 <- compute_events_table(
    event_df = event_df,
    pop_df = pop_df,
    hierarchy = c("lvl1", "lvl2"),
    group_vars = "group",
    subjid_var = "subj",
    event_group_var = "evtgrp",
    worst_event_group_vars = "evtgrp",
    event_group_total_val = "All Groups"
  )

  test_that(vdoc[["add_spec"]](
    "worst event group by computation is correct (snapshot)",
    c(
      specs$hierarchical_count_table$event_group_worst_severity,
      specs$hierarchical_count_table$event_count,
      specs$hierarchical_count_table$event_group_by_display
    )
  ), {
    expect_snapshot({
      options(width = 250)
      print(x2$df, n = 999)
      print(x2$meta)
    })
  })

})
