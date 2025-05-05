  event_list <- list()
  event_list[["subj"]] <- factor(c("1", "1", "1", "1", "2", "2", "2", "3"))
  event_list[["lvl1"]] <- factor(c("A1", "A1", "B1", "B1", "A1", "A1", "B1", "A1"))
  event_list[["lvl2"]] <- factor(c("A2", "B2", "B2", "A2", "A2", "B2", "B2", "A2"))
  event_df <- as.data.frame(event_list)

  pop_list <- list()
  pop_list[["subj"]] <- factor(c("1", "2", "3", "4"))
  pop_list[["group"]] <- factor(c("GA", "GB", "GC", "GC"))
  pop_df <- as.data.frame(pop_list)

mod <- mod_hierarchical_count_table(
        "hierarchical_count_table",
        table_dataset_name = "event",
        pop_dataset_name = "pop",
        show_modal_on_click = TRUE,
        receiver_id = "papo",
        subjid_var = "subj",        
        default_hierarchy = c("lvl1", "lvl2"),
        default_group = "group"
      )


data <- list(event = event_df, pop = pop_df)

trigger_input_id <- "hierarchical_count_table-clicked_sbj"
test_communication_with_papo(mod, data, trigger_input_id,
                             "hierarchical_count_table$jumping_feature",
                             specs$jumping_feature)
