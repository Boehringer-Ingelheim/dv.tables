#' Preprocess table for download
#' @details
#'   Data frame contains summary and all subject info. as list of lists
#'   Extract the required named list
#'   Add overall patients from column header
#'   Separate the columns into count and percentage
#'
#'
#' @param count_table A reactive list containing dataset containing the event data
#' and other meta data
#'
#' @return Processed table to download as excel
#'
#' @keywords internal
preprocess_download_table <- function(count_table, download_type) {

  checkmate::assert_list(count_table,
                         types = c("data.frame", "list"),
                         null.ok = TRUE,
                         names = "named")

  checkmate::assert_subset(names(count_table), c("df", "meta"))
  checkmate::assert_subset(c("n_denominator",
                             "hierarchy",
                             "special_char"),
                           names(count_table[["meta"]]), )
  
  # Get col names and total patients
  total_colname <- count_table[["meta"]]$n_denominator

  # Get event variables
  event_vars <- count_table[["meta"]]$hierarchy

  df_prep <- count_table[["df"]] |>
    dplyr::select(dplyr::all_of(event_vars), names(total_colname)) |>
    
    # Keep only the `count` element of the count-subjid paired columns
    dplyr::mutate(dplyr::across(dplyr::where(is.list), ~ purrr::map_chr(.x, "count"))) |>
    
    # Replace the Em Dash character with empty string
    dplyr::mutate(dplyr::across(dplyr::all_of(names(total_colname)),
                                ~ sub("\u2014", "", .x))) |>
    
    # Replace the special character in the event variables with "Total"
    dplyr::mutate(dplyr::across(dplyr::all_of(event_vars),
                                ~ sub(count_table[["meta"]]$special_char, "Total", .x)))
      
  if (download_type == ".rtf") {
    return(df_prep)
  }

  new_row <- setNames(
    data.frame(matrix(ncol = ncol(df_prep), nrow = 1)),
    names(df_prep)
  )
  new_row[[1, 1]] <- "Overall No. of Patients"

  matched_cols <- match(names(total_colname), names(new_row))
  new_row[1, matched_cols] <- total_colname

  df_prep <- rbind(new_row, df_prep)

  df_prep <- purrr::reduce(names(total_colname), function(df, col) {
    df |>
      tidyr::separate(col,
        into = paste0(col, c("_N", "_per")),
        sep = " \\(",
        remove = TRUE,
        fill = "right"
      ) |>
      dplyr::mutate(dplyr::across(dplyr::ends_with("_per"), ~ sub(")", "", .)))
  }, .init = df_prep)

  return(df_prep)
}
