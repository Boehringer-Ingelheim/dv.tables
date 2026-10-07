# Summary flagged row tests

adsl <- pharmaverseadam::adlb |>
  dplyr::filter(
    .data[["USUBJID"]] %in% c(
      "01-701-1015",
      "01-701-1023",
      "01-701-1028",
      "01-701-1034",
      "01-701-1047"
    )
  )  |>
  dplyr::select(dplyr::all_of(c("USUBJID", "TRT01P", "SEX"))) |>
  chr2factor()

adlb <- pharmaverseadam::adlb |>
  dplyr::filter(
    .data[["USUBJID"]] %in% c(
      "01-701-1015",
      "01-701-1023",
      "01-701-1028",
      "01-701-1034",
      "01-701-1047"
    ),
    .data[["LBTESTCD"]] %in% c("ALP", "ALT", "AST", "BILI"),
    .data[["AVISITN"]] %in% c(0, 4, 5, 7)
  ) |>
  dplyr::select(dplyr::all_of(c("USUBJID", "VISIT", "PARAMCD", "ADT", "AVISIT", "AVAL", "ANL01FL"))) |>
  chr2factor()

# Last value on treatment
adlb <- dplyr::left_join(
  adlb,
  dplyr::filter(adlb, .data[["ANL01FL"]] == "Y") |>
    dplyr::arrange(dplyr::pick(dplyr::all_of(c("USUBJID", "PARAMCD", "ADT")))) |>
    dplyr::group_by(dplyr::pick(dplyr::all_of(c("USUBJID", "PARAMCD")))) |>
    dplyr::slice_tail(n = 1) |>
    dplyr::ungroup() |>
    dplyr::mutate(LVOTFL = "Y"),
  by = names(adlb)
)

# Minimum on treatment
adlb <- dplyr::left_join(
  adlb,
  dplyr::filter(adlb, .data[["ANL01FL"]] == "Y") |>
    dplyr::arrange(dplyr::pick(dplyr::all_of(c("USUBJID", "PARAMCD", "ADT")))) |>
    dplyr::group_by(dplyr::pick(dplyr::all_of(c("USUBJID", "PARAMCD")))) |>
    dplyr::slice_min(order_by = .data[["AVAL"]], n = 1, with_ties = FALSE, na_rm = TRUE) |>
    dplyr::ungroup() |>
    dplyr::mutate(MINTRFL = "Y"),
  by = names(adlb)
)

# Maximum on treatment
adlb <- dplyr::left_join(
  adlb,
  dplyr::filter(adlb, .data[["ANL01FL"]] == "Y") |>
    dplyr::arrange(dplyr::pick(dplyr::all_of(c("USUBJID", "PARAMCD", "ADT")))) |>
    dplyr::group_by(dplyr::pick(dplyr::all_of(c("USUBJID", "PARAMCD")))) |>
    dplyr::slice_max(order_by = .data[["AVAL"]], n = 1, with_ties = FALSE, na_rm = TRUE) |>
    dplyr::ungroup() |>
    dplyr::mutate(MAXTRFL = "Y"),
  by = names(adlb)
)

attr(adlb[["LVOTFL"]], "label") <- "Last Value On Treatment Record Flag"
attr(adlb[["MINTRFL"]], "label") <- "Minimum On Treatment Flag"
attr(adlb[["MAXTRFL"]], "label") <- "Maximum On Treatment Flag"

flagged_row_processing <- list(
  list(flag_var = "MINTRFL",
       dependent_vars = c("USUBJID", "PARAMCD"),
       var_assignments = list(VISIT = "MIN ON TRT",
                              AVISIT = "Minimum on treatment")),
  list(flag_var = "MAXTRFL",
       dependent_vars = c("USUBJID", "PARAMCD"),
       var_assignments = list(VISIT = "MAX ON TRT",
                              AVISIT = "Maximum on treatment")),
  list(flag_var = "LVOTFL",
       dependent_vars = c("USUBJID", "PARAMCD"),
       var_assignments = list(VISIT = "LAST VAL ON TRT",
                              AVISIT = "Last value on treatment"))
)

subjid_var <- "USUBJID"
group_vars <- c("TRT01P")

local({
  # Flagged row processing, no filtering applied

  pop_df <- adsl

  unfiltered_df <- adlb
  filtered_df <- adlb
  row_vars <- c("PARAMCD", "VISIT")

  pfr1 <- process_flagged_rows(
    filtered_df,
    pop_df,
    unfiltered_df,
    flagged_row_processing,
    group_vars,
    row_vars,
    subjid_var
  )

  test_that(vdoc[["add_spec"]](
    "flagged row processing, no filtering applied",
    c(specs$summary_table$flagged_row_processing)
  ), {
    expect_snapshot({
      options(width = 250)
      print(pfr1, n = 999)
    })
  })

})

local({
  # Flagged row processing, filtering applied to subjects, parameters and visits

  pop_df <- adsl |>
    dplyr::filter(.data[["USUBJID"]] %in% c("01-701-1015", "01-701-1023", "01-701-1028"))

  unfiltered_df <- adlb
  filtered_df <- adlb |>
    dplyr::filter(.data[["PARAMCD"]] != "BILI",
                  .data[["AVISIT"]] != "Week 2")
  row_vars <- c("PARAMCD", "AVISIT")

  pfr2 <- process_flagged_rows(
    filtered_df,
    pop_df,
    unfiltered_df,
    flagged_row_processing,
    group_vars,
    row_vars,
    subjid_var
  )

  test_that(vdoc[["add_spec"]](
    "flagged row processing, filtering applied",
    c(specs$summary_table$flagged_row_processing)
  ), {
    expect_snapshot({
      options(width = 250)
      print(pfr2, n = 999)
    })
  })

})
