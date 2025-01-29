#' Function to separate a column
#'
#' @details
#' Columns where `(` is encountered is split into two and new columns
#' are mutated
#'
#' @param df dataframe
#' @param col column name
#'
#' @return dataframe with new mutated separated columns
#' @keywords internal
separate_column <- function(df, col) {
  df |>
    tidyr::separate(col, into = paste0(col, c("_N", "_per")),
                    sep = " \\(",
                    remove = TRUE,
                    fill = "right") %>%
    dplyr::mutate(dplyr::across(dplyr::ends_with("_per"), ~stringr::str_remove(., "\\)")))
}


#' Adds Overall number of patients
#'
#' @details
#' Extracts overall number of patient (html table output column headers)
#' from metadata, adds it to first row of the downloaded table.
#'
#'
#' @param df dataframe
#' @param total_colname named int, col names with overall patients
#'
#' @return dataframe with additional row containing overall patients
#'
#' @keywords internal
add_total_patient <- function(df, total_colname) {

  # empty row with column name placeholder
  new_row <- setNames(data.frame(matrix(ncol = ncol(df), nrow = 1)), names(df))

  new_row[[1, 1]] <- "Overall No. of Patients"

  # match col names to add total patients
  matched_cols <- match(names(total_colname), names(new_row))
  new_row[1, matched_cols] <- total_colname

  return(rbind(new_row, df))


}
