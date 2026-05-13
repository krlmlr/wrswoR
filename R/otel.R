otel_tracer_name <- "io.github.krlmlr.wrswoR"

# Calls otel::start_local_active_span() when otel is installed, otherwise
# returns a span object whose methods are no-ops. parent.frame() pins the
# activation scope to the caller of this wrapper so the span ends with the
# caller, not with this function.
start_local_active_span <- function(name, attributes = NULL, ...) {
  if (requireNamespace("otel", quietly = TRUE)) {
    otel::start_local_active_span(
      name,
      attributes = attributes,
      ...,
      activation_scope = parent.frame()
    )
  } else {
    list(set_attribute = function(key, value) invisible(NULL))
  }
}

#' Record otel spans emitted by wrswoR functions.
#'
#' Internal test helper. Use together with
#' [testthat::local_mocked_bindings()] to swap `start_local_active_span`
#' for the recorder's capture function.
#'
#' @noRd
make_span_recorder <- function() {
  recorder <- new.env(parent = emptyenv())
  recorder$spans <- list()

  recorder$start <- function(name, attributes = NULL, ...) {
    idx <- length(recorder$spans) + 1L
    recorder$spans[[idx]] <- list(
      name = name,
      attributes = as.list(attributes)
    )
    list(
      set_attribute = function(key, value) {
        recorder$spans[[idx]]$attributes[[key]] <- value
      }
    )
  }

  recorder
}
