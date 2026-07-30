#' Function to rename columns
#' Replaces any column name that starts with "row_label" with an empty string.
#' Removes everything before the underscore for columns starting with "var"
#' followed by one or more digits and an underscore.
#'
#' @param column_names vector of column names
#'
#' @return modified column names.
#' @keywords internal
rename_columns <- function(column_names) {
  # Replace "row_label" with an empty string
  column_names <- gsub("^row_label.*$", "", column_names)

  # Remove everything before the underscore for columns starting with "var"
  column_names <- gsub("^var\\d+_", "", column_names)

  return(column_names)
}


it_custom_styles <- shiny::tags[["head"]](
  # nolint start
  shiny::tags[["style"]](
    "
    .nopad { display: inline-block; }                                 /* horizontal layout */
    .selector_as_link .selectize-input { border:0px; padding:0}             /* horizontally aligned with rest of text */
    .selector_as_link .shiny-input-container { width:auto; margin: 0 }
    .selector_as_link.shiny-input-container { width:auto; }
    .selector_as_link .selectize-control.single .selectize-input:after { display: none }
    .selector_as_link .control-label {display: none}
    .nopad .selectize-control { display: inline-block; vertical-align: top; margin: 0}

    .selector_as_link .item { color:#069; }                                    /* link-ish color */
    .selector_as_link .item:hover { text-decoration: underline; }              /* link-ish behavior */

    .selector_as_link .selectize-dropdown.single { width:auto !important }     /* wider drop-down options */

    .button_as_link.drop-menu-input .action-button { /* horizontally aligned with rest of text */
      vertical-align:top; border:0px; padding: 0; color:#069
    }

    .centered_flex_row { display:flex;flex-direction:row;justify-content:left;align-items:baseline;gap:0.5rem; }
    "
  )
  # nolint end
)

it_as_link <- function(tag) {
  res <- NULL
  checkmate::assert_class(tag, "shiny.tag")

  if (length(grep("\\<drop-menu-input\\>", tag$attribs[["class"]])) > 0) {
    res <- shiny::tagAppendAttributes(tag, class = "button_as_link")
  } else { # FIXME: Assumes (probably mistakenly, that anything that is not a drop menu is a selector)
    res <- shiny::tagAppendAttributes(tag, class = "selector_as_link nopad")
  }
  res
}

it_interactive_title <- function(...) {
  l <- list(...)
  for (i in seq_along(l)) {
    e <- l[[i]]
    if (is.character(e)) {
      e <- shiny::p(e)
    } else {
      e <- it_as_link(e)
    }
    l[[i]] <- e
  }

  div <- do.call(shiny::div, l) |> shiny::tagAppendAttributes(class = "centered_flex_row")

  return(shiny::tagList(it_custom_styles, div))
}

resolve_table_pagination <- function(table_pagination) {
  if (is.logical(table_pagination) && length(table_pagination) == 1L && !is.na(table_pagination)) {
    if (isTRUE(table_pagination)) {
      return(list(
        pagination = TRUE,
        showPageSizeOptions = TRUE
      ))
    }

    return(list(
      pagination = FALSE,
      showPagination = TRUE,
      showPageInfo = TRUE,
      showPageSizeOptions = FALSE
    ))
  }

  if (checkmate::test_count(table_pagination, positive = TRUE)) {
    return(list(
      pagination = TRUE,
      defaultPageSize = as.integer(table_pagination),
      showPageSizeOptions = TRUE
    ))
  }

  stop(
    "`table_pagination` must be TRUE, FALSE, or a positive whole number.",
    call. = FALSE
  )
}

warn_deprecated_pagination <- function() {
  warning(
    "`pagination` is deprecated in `mod_Tplyr_table()` and will be removed ",
    "in a future version of `dv.tables`. ",
    "Please use `listing_pagination` instead. ",
    "`pagination` currently controls pagination for drill-down and standalone listings.",
    call. = FALSE
  )
}

validate_listing_pagination <- function(listing_pagination) {
  # NULL or a single logical is what dv.listings accepts
  if (is.null(listing_pagination)) {
    return(NULL)
  }

  if (is.logical(listing_pagination) && length(listing_pagination) == 1L && !is.na(listing_pagination)) {
    return(listing_pagination)
  }

  warning(
    "`listing_pagination` must be TRUE, FALSE, or NULL. ",
    "It is passed through to `dv.listings::listings_server()`, which does not support ",
    "other values (e.g. a page size integer, unlike `table_pagination`). ",
    "Falling back to the default (NULL).",
    call. = FALSE
  )

  return(NULL)
}
