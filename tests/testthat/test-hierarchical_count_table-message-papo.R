mod <- mod_hierarchical_count_table(
        "hierarchical_count_table",
        table_dataset_name = "adae",
        pop_dataset_name = "adsl",
        show_modal_on_click = TRUE,
        receiver_id = "papo",
        default_hierarchy = c("AEBODSYS", "AEDECOD"),
        default_group = "TRT01P"
      )

trigger_input_id <- "hierarchical_count_table-clicked-sbj"
test_communication_with_papo(mod, data, trigger_input_id,
                             "jumping_feature",
                             specs$jumping_feature)
