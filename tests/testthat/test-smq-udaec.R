# SMQ and UDAEC derivation tests

test_that("SMQ and UDAEC categories are derived from source columns and preferred terms", {
  event_data <- data.frame(
    USUBJID = c("01", "02", "03", "04"),
    AEDECOD = c("Term A", "Term B", "Term C", "Term D"),
    SMQ_CARDIAC = c("Cardiac flag", "", "", ""),
    SMQ_RENAL = c("", "", "Renal flag", ""),
    stringsAsFactors = FALSE
  )

  udaec_list <- list(
    "Cardiac disorders" = list(
      smq_vars = "SMQ_CARDIAC",
      pt_var = "AEDECOD",
      pt_values = "Term B"
    ),
    "Renal disorders" = list(
      smq_vars = "SMQ_RENAL",
      pt_var = "AEDECOD",
      pt_values = "Term C"
    )
  )

  result <- dv.tables:::derive_smq_dataset(
    base_data = event_data,
    smq_vars = c("SMQ_CARDIAC", "SMQ_RENAL"),
    smq_name = "SMQ",
    udaec_name = "UDAEC",
    udaec_list = udaec_list
  )

  expected_df <- data.frame(
    USUBJID = c("01", "03", "02", "04", "02", "03"),
    AEDECOD = c("Term A", "Term C", "Term B", "Term D", "Term B", "Term C"),
    SMQ = factor(c("Cardiac flag", "Renal flag", "", "", "", "")),
    UDAEC = factor(c("Cardiac disorders", "Renal disorders", "", "", "Cardiac disorders", "Renal disorders"), levels = c("Cardiac disorders", "Renal disorders", "")),
    stringsAsFactors = FALSE
  )
  expect_false(any(c("SMQ_CARDIAC", "SMQ_RENAL") %in% names(result)))
  expect_true(all(c("SMQ", "UDAEC") %in% names(result)))
  expect_equal(
    result |>
      as.data.frame(),
    expected_df
  )
})

test_that("SMQ derivation preserves non-SMQ data and creates empty categories", {
  event_data <- data.frame(
    USUBJID = factor(c("01", "02")),
    AEDECOD = factor(c("Term A", "Term B")),
    SMQ_CARDIAC = factor(c("Cardiac flag", "")),
    stringsAsFactors = FALSE
  )

  result <- dv.tables:::derive_smq_dataset(
    base_data = event_data,
    smq_vars = "SMQ_CARDIAC",
    smq_name = "SMQ",
    udaec_name = "UDAEC"
  )

  expect_equal(as.character(result$USUBJID), as.character(event_data$USUBJID))
  expect_equal(as.character(result$AEDECOD), as.character(event_data$AEDECOD))
  expect_equal(as.character(result$SMQ), c("Cardiac flag", ""))
  expect_false("SMQ_CARDIAC" %in% names(result))
  expect_false("UDAEC" %in% names(result))
})

test_that("UDAEC categories can be defined from preferred terms only", {
  event_data <- data.frame(
    USUBJID = c("01", "02", "03"),
    AEDECOD = c("Term A", "Term B", "Term A"),
    SMQ_CARDIAC = c("", "", ""),
    stringsAsFactors = FALSE
  )

  result <- dv.tables:::derive_smq_dataset(
    base_data = event_data,
    smq_vars = "SMQ_CARDIAC",
    smq_name = "SMQ",
    udaec_name = "UDAEC",
    udaec_list = list(
      "Cardiac disorders" = list(
        pt_var = "AEDECOD",
        pt_values = "Term A"
      )
    )
  )

  expected_df <- data.frame(
    USUBJID = c("01", "02", "03", "01", "03"),
    AEDECOD = c("Term A", "Term B", "Term A", "Term A", "Term A"),
    SMQ = factor(c("", "", "", "", "")),
    UDAEC = factor(c("", "", "", "Cardiac disorders", "Cardiac disorders"), levels = c("Cardiac disorders", "")),
    stringsAsFactors = FALSE
  )
  expect_equal(
    result |>
      as.data.frame(),
    expected_df
  )
})


test_that("UDAEC definitions require top-level SMQ variables", {
  expect_error(
    dv.tables:::validate_smq_udaec_args(
      smq_name = "SMQ",
      smq_vars = NULL,
      udaec_name = "UDAEC",
      udaec_list = list("Cardiac disorders" = list(smq_vars = "SMQ_CARDIAC"))
    ),
    "Must be TRUE"
  )
})

test_that("UDAEC SMQ sources must be included in top-level SMQ variables", {
  expect_error(
    dv.tables:::validate_smq_udaec_args(
      smq_name = "SMQ",
      smq_vars = "SMQ_CARDIAC",
      udaec_name = "UDAEC",
      udaec_list = list("Renal disorders" = list(smq_vars = "SMQ_RENAL"))
    ),
    "subset"
  )
})

test_that("UDAEC preferred-term fields must be supplied together", {
  expect_error(
    dv.tables:::validate_smq_udaec_args(
      smq_name = "SMQ",
      smq_vars = "SMQ_CARDIAC",
      udaec_name = "UDAEC",
      udaec_list = list(
        "Cardiac disorders" = list(
          pt_var = "AEDECOD"
        )
      )
    ),
    "atomic vector"
  )
})
