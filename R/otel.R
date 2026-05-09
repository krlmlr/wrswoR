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

#' Record otel spans emitted by wrswoR functions
#'
#' Creates an in-memory recorder that captures spans. Use it together with
#' [testthat::local_mocked_bindings()] to swap `start_local_active_span` for
#' the recorder's capture function in tests:
#'
#' ```r
#' recorder <- make_span_recorder()
#' testthat::local_mocked_bindings(start_local_active_span = recorder$start)
#' sample_int_rej(6, 3, c(995, rep(1, 5)))
#' recorder$spans
#' ```
#'
#' @return An environment with two members:
#'   * `spans`: list of recorded spans, each a list with `name` and
#'     `attributes`
#'   * `start`: function with the same signature as
#'     [otel::start_local_active_span()] that records into `spans`
#' @export
#' @examples
#' recorder <- make_span_recorder()
#' span <- recorder$start("demo", attributes = list(x = 1))
#' span$set_attribute("y", 2)
#' recorder$spans
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
