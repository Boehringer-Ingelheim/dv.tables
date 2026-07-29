# Summary table tests

funcs_list <- list(
  n = length,
  mean = mean,
  sd = stats::sd,
  meanci = \(x) if (length(x) > 1L) stats::t.test(x, conf.level = 0.95)$conf.int else rep(NA_real_, 2L),
  geomean = \(x) if (all(x > 0)) exp(mean(log(x))) else NaN,
  min = min,
  max = max
)

fmts_list <- list(
  n = list(fmt = "%d", "n"),
  meansd = list(fmt = "%.1f (%.1f)", "mean", "sd"),
  meanci = list(fmt = "(%.2f, %.2f)", "meanci.1", "meanci.2"),
  geomean = list(fmt = "%.1f", "geomean"),
  minmax = list(fmt = "%.1f - %.1f", "min", "max")
)

labels_vector <- c(
  n = "n",
  meansd = "Mean (SD)",
  meanci = "Mean 95% CI",
  geomean = "Geometric Mean",
  minmax = "Min - Max"
)

rep_list <- list(
  n = c(`^NA$` = "0"),
  meansd = c(`^NA \\(NA\\)$` = SUMMTAB$VAL$EM_DASH,
             `\\(NA\\)$` = sprintf("(%s)", SUMMTAB$VAL$EM_DASH)),
  meanci = c(`^\\(NA, NA\\)$` = SUMMTAB$VAL$EM_DASH),
  geomean = c(`^NA$` = SUMMTAB$VAL$EM_DASH,
              `^NaN$` = "NE"),
  minmax = c(`^NA - NA$` = SUMMTAB$VAL$EM_DASH)
)

# Function to get choice values from HTML selection
html_choice_values <- function(html) {
  strsplit(html, "option ") |>
    unlist() |>
    grep("value=", x = _, value = TRUE) |>
    sub("value=\"([A-Z]+)\".*", "\\1", x = _)
}

# Function tests ----

local({

  set.seed(1)

  tbl_list <- list()
  tbl_list[["subj"]] <- c(rep("1", 4), rep("2", 3), rep("3", 2), rep("4", 1), rep("5", 3), rep("6", 4))
  tbl_list[["visit"]] <- as.character(c(1:4, 1:3, 1:2, 1, 1:3, 1:4))
  tbl_list[["aval"]] <- c(stats::runif(n = 4, min = 10, max = 20),
                          stats::runif(n = 3, min = 20, max = 30),
                          stats::runif(n = 2, min = 30, max = 40),
                          stats::runif(n = 1, min = 40, max = 50),
                          stats::runif(n = 2, min = 50, max = 60), NA_real_,
                          stats::runif(n = 3, min = 60, max = 70), NA_real_)
  tbl_list[["flag"]] <- ifelse(stats::runif(n = length(tbl_list[["subj"]])) < 0.6, "Y", NA_character_)

  # Create analysis dataset with two parameters
  alt_df <- dplyr::mutate(as.data.frame(tbl_list), param = "ALT")
  ast_df <- dplyr::mutate(alt_df, param = "AST")
  tbl_df <- rbind(alt_df, ast_df)

  pop_df <- data.frame(
    subj = as.character(1:6),
    arm = c(rep("A", 3), rep("B", 2), "C"),
    sex = ifelse(stats::runif(n = 6) < 0.5, "M", "F")
  )

  tbl_df <- tbl_df |> chr2factor()
  pop_df <- pop_df |> chr2factor()

  attr(tbl_df$aval, "label") <- "Analysis Value"
  attr(tbl_df$flag, "label") <- "Flag"

  # Multiple group and row variables; numerical and categorical analysis variable;
  # total group; categorical counts; big N denominator
  st1_compute <- summtab_compute(
    tbl_df,
    pop_df,
    anl_vars = c("aval", "flag"),
    group_vars = c("arm", "sex"),
    row_vars = c("param", "visit"),
    subjid_var = "subj",
    stats_functions = funcs_list,
    stats_formats = fmts_list,
    stats_labels = labels_vector,
    stats_replace = rep_list,
    total = TRUE,
    total_group_val = "All",
    drop_na = FALSE,
    show_category_n = TRUE,
    denom = "N",
    collapse_func_name = "dplyr::first"
  )

  st1_html <- summtab_html_table(st1_compute)

  test_that(vdoc[["add_spec"]](
    "generate summary table (compare with snapshot)",
    c(specs$summary_table$numerical_summary,
      specs$summary_table$categorical_summary,
      specs$summary_table$pop_groups,
      specs$summary_table$row_groups,
      specs$summary_table$stats_functions,
      specs$summary_table$stats_format,
      specs$summary_table$stats_labels,
      specs$summary_table$stats_replace,
      specs$summary_table$total_pop_group,
      specs$summary_table$total_pop_group_label,
      specs$summary_table$categorical_n,
      specs$summary_table$drop_numerical_na,
      specs$summary_table$denominator)
  ), {
    expect_snapshot(st1_compute)
    expect_snapshot(st1_html)
  })

  # Single group and row variables; numerical and categorical analysis variable;
  # collapsing done over visits; categorical NA values dropped;
  # no total group; no categorical counts; small n denominator
  st2_compute <- summtab_compute(
    tbl_df,
    pop_df,
    anl_vars = c("aval", "flag"),
    group_vars = "arm",
    row_vars = "param",
    subjid_var = "subj",
    stats_functions = funcs_list,
    stats_formats = fmts_list,
    stats_labels = labels_vector,
    stats_replace = rep_list,
    total = FALSE,
    drop_na = TRUE,
    show_category_n = FALSE,
    denom = "n",
    collapse_func_name = "dplyr::first"
  )

  st2_html <- summtab_html_table(st2_compute)

  test_that(vdoc[["add_spec"]](
    "generate collapsed summary table (compare with snapshot)",
    c(specs$summary_table$numerical_summary,
      specs$summary_table$categorical_summary,
      specs$summary_table$pop_groups,
      specs$summary_table$row_groups,
      specs$summary_table$stats_functions,
      specs$summary_table$stats_format,
      specs$summary_table$stats_labels,
      specs$summary_table$stats_replace,
      specs$summary_table$total_pop_group,
      specs$summary_table$total_pop_group_label,
      specs$summary_table$drop_categorical_na,
      specs$summary_table$drop_numerical_na,
      specs$summary_table$denominator,
      specs$summary_table$row_collapse)
  ), {
    expect_snapshot(st2_compute)
    expect_snapshot(st2_html)
  })

})

local({
  # Population summary table example

  adsl <- pharmaverseadam::adsl

  saf_pop_df <- adsl |>
    dplyr::filter(.data[["SITEID"]] == "703") |>
    dplyr::mutate(SAFFL2 = ifelse(as.numeric(.data[["SUBJID"]]) %% 3, "Y", "N"),
                  SAFFL3 = ifelse(as.numeric(.data[["SUBJID"]]) %% 7, "Y", "N")) |>
    tidyr::pivot_longer(
      c("SAFFL", "SAFFL2", "SAFFL3"),
      names_to = "saf_group",
      values_to = "saf_flag"
    ) |>
    dplyr::filter(.data[["saf_flag"]] == "Y") |>
    dplyr::relocate(dplyr::starts_with("saf")) |>
    chr2factor()

  # Multiple group and row variables; numerical and categorical analysis variable;
  # total group; categorical counts; big N denominator
  st3_compute <- summtab_compute(
    saf_pop_df,
    saf_pop_df,
    anl_vars = c("saf_flag", "SEX", "AGE", "SUBJID"),
    group_vars = c("saf_group"),
    row_vars = NULL,
    subjid_var = "USUBJID",
    stats_functions = funcs_list,
    stats_formats = fmts_list,
    stats_labels = labels_vector,
    stats_replace = rep_list,
    total = FALSE,
    drop_na = TRUE,
    show_category_n = FALSE,
    denom = "N",
    collapse_func_name = "mean"
  )

  st3_html <- summtab_html_table(st3_compute)

  test_that(vdoc[["add_spec"]](
    "expanded population groups, multiple rows per subject - population summary table",
    c(specs$summary_table$expanded_pop_groups,
      specs$summary_table$numerical_summary,
      specs$summary_table$categorical_summary,
      specs$summary_table$total_pop_group,
      specs$summary_table$denominator,
      specs$summary_table$row_collapse)
  ), {
    expect_snapshot(st3_compute)
    expect_snapshot(st3_html)
  })

})


# App tests ----

local({
  skip_if_not_running_shiny_tests()

  tns <- tns_factory("mod")

  ID <- poc(
    INPUT = poc(
      ANL_VARS = tns(SUMMTAB$ID$ANL_VARS, "val"),
      GROUP_VARS = tns(SUMMTAB$ID$GROUP_VARS, "val"),
      ROW_VARS = tns(SUMMTAB$ID$ROW_VARS, "val")
    ),
    OUTPUT = poc(
      TBL_OUTPUT = tns(SUMMTAB$ID$TBL_OUTPUT),
      ANL_VARS = tns(SUMMTAB$ID$ANL_VARS, "menu_cont"),
      GROUP_VARS = tns(SUMMTAB$ID$GROUP_VARS, "menu_cont"),
      ROW_VARS = tns(SUMMTAB$ID$ROW_VARS, "menu_cont")
    )
  )

  anl_var_choices <- c("AVAL", "CHG", "ATOXGR", "LBNRIND")
  grp_var_choices <- c("ARM", "SEX", "RACE", "ETHNIC")
  row_var_choices <- c("PARAM", "VISIT", "SEX", "RACE")

  anl_var_select <- c("AVAL", "ATOXGR")
  grp_var_select <- c("ARM", "SEX")
  row_var_select <- c("PARAM", "VISIT")

  root_app <- start_app_driver(rlang::quo(dv.tables::mock_app_summary_table(
    srv_defaults = list(stats_functions = !!funcs_list,
                        stats_formats = !!fmts_list,
                        stats_labels = !!labels_vector,
                        stats_replace = !!rep_list,
                        default_summarize_on = !!anl_var_select,
                        default_group_by = !!grp_var_select,
                        default_row_by = !!row_var_select,
                        summarize_on_choices = !!anl_var_choices,
                        group_by_choices = !!grp_var_choices,
                        row_by_choices = !!row_var_choices),
    ui_defaults = list(default_stats = c("n", "meansd"),
                       choices_stats = !!names(fmts_list))
  )))
  on.exit(if ("stop" %in% names(root_app)) root_app$stop())

  fail_if_app_not_started(root_app)

  app <- shinytest2::AppDriver$new(root_app$get_url())

  test_that(vdoc[["add_spec"]](
    "check summary table variable choices and defaults",
    c(specs$summary_table$analysis_var_defaults,
      specs$summary_table$analysis_var_choices,
      specs$summary_table$pop_group_var_defaults,
      specs$summary_table$pop_group_var_choices,
      specs$summary_table$row_group_var_defaults,
      specs$summary_table$row_group_var_choices)
  ), {
    anl_var_choices_html <- app$get_values(output = TRUE)[["output"]][[ID$OUTPUT$ANL_VARS]]$html
    grp_var_choices_html <- app$get_values(output = TRUE)[["output"]][[ID$OUTPUT$GROUP_VARS]]$html
    row_var_choices_html <- app$get_values(output = TRUE)[["output"]][[ID$OUTPUT$ROW_VARS]]$html

    expect_setequal(html_choice_values(anl_var_choices_html), anl_var_choices)
    expect_setequal(html_choice_values(grp_var_choices_html), grp_var_choices)
    expect_setequal(html_choice_values(row_var_choices_html), row_var_choices)

    expect_setequal(app$get_values(input = TRUE)[["input"]][[ID$INPUT$ANL_VARS]], anl_var_select)
    expect_setequal(app$get_values(input = TRUE)[["input"]][[ID$INPUT$GROUP_VARS]], grp_var_select)
    expect_setequal(app$get_values(input = TRUE)[["input"]][[ID$INPUT$ROW_VARS]], row_var_select)
  })

  test_that(vdoc[["add_spec"]](
    "a summary table is displayed",
    c(specs$summary_table$summary_table_display)
  ), {
    st_output_html <- app$get_values(output = TRUE)[["output"]][[ID$OUTPUT$TBL_OUTPUT]][["html"]]
    expect_snapshot(st_output_html)
  })

  test_that(vdoc[["add_spec"]](
    "cells can be clicked and the id of participants is returned",
    c(specs$summary_table$cell_click,
      specs$summary_table$jumping_feature)
  ), {
    id <- "01-709-1217"
    app$run_js("document.querySelector('#mod-table_output > div > table > tbody > tr:nth-child(13) > td:nth-child(9)').click();")
    app$wait_for_idle()
    app$run_js(sprintf("document.querySelector('[data-id=\"%s\"]').click()", id))
    app$wait_for_idle()
    returned_id <- shiny::isolate(app$get_values(export = TRUE)[["export"]][[tns("res")]][["subj_id"]]())
    expect_equal(returned_id, id)
  })

  app$stop()
})
