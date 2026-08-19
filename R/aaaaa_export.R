..activate_export <- function() {
  if (requireNamespace("shinymeta", quietly = TRUE)) {
    log_warn("Export functionality is under development")

    # These set of functions is declared inside to avoid calling shinymeta out of a function.
    # Doing that would require some extra if statements that would worsen code readability.

    EA <- list()

    # shinymeta::metaReactive2
    EA[["sm_mr2"]] <- shinymeta::metaReactive2

    # shinymeta::metaReactive
    EA[["sm_mr"]] <- shinymeta::metaReactive

    # shinymeta::metaExpr
    EA[["sm_me"]] <- shinymeta::metaExpr

    AEE[["A"]] <- EA
  } else {
    log_warn("`shinymeta` package is required to activate export functionality")
    AEE[["A"]] <- NEA
  }
  invisible(NULL)
}

..deactivate_export <- function() {
  AEE[["A"]] <- NEA
}