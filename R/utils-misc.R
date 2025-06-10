chr2factor <- function(df) {
  lbls <- get_lbls_robust(df)
  df[] <- purrr::map(df, ~ if (is.character(.x)) factor(.x) else .x)
  df <- set_lbls(df, lbls)
  df
}

is_not_null <- Negate(is.null)

#' If x is `NULL`, return y, otherwise return x
#'
#' @param x,y Two elements to test, one potentially `NULL`
#'
#' @noRd
#'

#' @keywords internal
"%||%" <- function(x, y) {
  if (is.null(x)) {
    y
  } else {
    x
  }
}

# string substitution (poor man's glue)
# nolint ssub("substitute THIS and THAT", THIS="_this_", THAT="_that_")
ssub <- function(s, ...) {
  pairs <- list(...)
  for (orig in names(pairs)) {
    dest <- pairs[[orig]]
    s <- gsub(paste0("\\<", orig, "\\>"), dest, s)
  }
  s
}

#' Replace NA values in a factor with character value and add associated level
#'
#' @param f Factor
#' @param level New level to associate with original NA values
#'
#' @return A factor with NA replaced with character value/level
#'
#' @keywords internal
add_na_factor_level <- function(f, level = "<NA>") {

  if (!any(is.na(f))) return(f)

  ch <- tidyr::replace_na(as.character(f), level)
  new_levels <- c(levels(f), level)
  new_factor <- factor(ch, levels = new_levels)

  return(new_factor)
}

if_not_null <- Negate(is.null)
