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

test_that("sample_int_rej emits an otel span with parameter and result attributes", {
  recorder <- make_span_recorder()

  local_mocked_bindings(start_local_active_span = recorder$start)

  set.seed(42)
  sample_int_rej(6, 3, c(995, rep(1, 5)))

  expect_snapshot(recorder$spans)
})

test_that("sample_int_rej recurses and emits one span per recursion", {
  recorder <- make_span_recorder()

  local_mocked_bindings(start_local_active_span = recorder$start)

  set.seed(20150618L)
  sample_int_rej(50, 40, runif(50))

  expect_snapshot(lapply(recorder$spans, function(s) {
    list(name = s$name, attribute_keys = sort(names(s$attributes)))
  }))
})

test_that("otel_tracer_name follows the reverse-URL convention", {
  expect_equal(
    asNamespace("wrswoR")$otel_tracer_name,
    "io.github.krlmlr.wrswoR"
  )
})
