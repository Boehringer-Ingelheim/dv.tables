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

if_not_null <- Negate(is.null)
