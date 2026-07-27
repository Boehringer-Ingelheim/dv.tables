# This file contains all export related code. Remove it if required.

if (isTRUE(getOption("dv.export_enabled"))) {
  # log_warn("Export has been enabled. This is an experimental feature.")
  # Code for exporting versions

  # shinymeta::metaReactive2
  sm_mr2 <- shinymeta::metaReactive2

  # shinymeta::metaReactive
  sm_mr <- shinymeta::metaReactive

  # shinymeta::metaExpr
  sm_me <- shinymeta::metaExpr
}
