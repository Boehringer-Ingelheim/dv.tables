#' Function to rename columns
#' Replaces any column name that starts with "row_label" with an empty string.
#' Removes everything before the underscore for columns starting with "var"
#' followed by one or more digits and an underscore.
#'
#' @param column_names vector of column names
#'
#' @return modified column names.
rename_columns <- function(column_names) {
  # Replace "row_label" with an empty string
  column_names <- gsub("^row_label.*$", "", column_names)

  # Remove everything before the underscore for columns starting with "var"
  column_names <- gsub("^var\\d+_", "", column_names)

  return(column_names)
}
