col_menu_UI <- function(id) { # nolint: object_name_linter
  ns <- shiny::NS(id)
  shiny::uiOutput(ns("menu_cont"))
}

col_menu_server <- function(id,
                            data,
                            include_func = function(x) {
                              TRUE
                            },
                            label = "Select a column",
                            default = NULL,
                            multiple = FALSE,
                            include_none = TRUE,
                            options = NULL) {
  nargs_include_func <- length(formals(args(include_func)))
  stopifnot(nargs_include_func <= 2)
  if (nargs_include_func == 1) {
    mapper <- purrr::map_lgl
  }
  if (nargs_include_func == 2) {
    mapper <- purrr::imap_lgl
  }

  if ("onInitialize" %in% names(options)) stop("onInitialize cannot be used in this module, please contact the developers") # nolint

  mod <- function(input, output, session) {
    ns <- session[["ns"]]

    if (checkmate::test_string(include_none, min.chars = 1)) {
      none_choice <- include_none
      include_none <- TRUE
    } else {
      none_choice <- "None"
    }

    include_none <- isTRUE(include_none)

    output[["menu_cont"]] <- shiny::renderUI({
      shiny::req(data())
      include <- mapper(data(), include_func)
      choices <- get_labelled_names(data())[include]

      if (include_none) {
        shiny::validate(
          shiny::need(
            checkmate::test_disjunct(none_choice, choices),
            paste("'", none_choice, "' cannot be a column name. Please contact the app creator")
          )
        )
        choices <- c(none_choice, choices)
      }

      if (is_not_null(default) && !checkmate::test_subset(default, choices)) {
        log_warn(ssub("`DEFAULT` not found in `SET` for selector `ID`",
                      DEFAULT = default,
                      SET = paste(choices,
                                  collapse = ",
"
                      ),
                      ID = ns("val")
        ))
      }

      selected <- shiny::restoreInput(id = ns("val"), default = NULL) %||% default %||% shiny::isolate(input[["val"]])
      default <<- NULL

      selected <- local({
        # Transform so it can be used in the onInitialize function
        quot_selected <- sprintf("'%s'", selected)
        join_selected <- paste(quot_selected, collapse = ", ")
        bracket_selected <- sprintf("[%s]", join_selected) # nolint unused
      })

      options <- c(
        options,
        list(
          onInitialize = I(sprintf(
            "function() {this.setValue(%s)}",
            selected
          ))
        )
      )

      shiny::selectizeInput(
        ns("val"),
        label = label, multiple = multiple, choices = choices, selected = selected, options = options
      )
    })

    v_val <- shiny::reactive({
      if (checkmate::test_character(input[["val"]], min.chars = 1, min.len = 1)) {
        input[["val"]]
      } else {
        set_empty(character(0), TRUE)
      }
    })

    shiny::outputOptions(output, "menu_cont", suspendWhenHidden = FALSE)

    v_val <- v_val |>
      set_id(val = paste0(id, "-", "val")) |>
      set_update(
        val = function(selected = NULL) {
          shiny::updateSelectizeInput(session = session, inputId = "val", selected = selected)
        }
      )
    return(v_val)
  }
  shiny::moduleServer(id, mod)
}

# Helpers ----

set_factory <- function(n) {
  function(x, ...) {
    attr(x, n) <- list(...)
    x
  }
}

get_factory <- function(n) {
  function(x) {
    attr(x, n, exact = TRUE)
  }
}

set_empty <- function(x, v) {
  attr(x, "empty") <- v
  x
}
set_id <- set_factory("id")
set_update <- set_factory("update")

get_empty <- get_factory("empty")
get_id <- get_factory("id")
get_update <- get_factory("update")

test_empty <- function(x) get_empty(x) %||% FALSE
test_not_empty <- Negate(test_empty)
