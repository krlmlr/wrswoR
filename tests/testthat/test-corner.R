context("corner")

test_that("zero-length output", {
  for (funcname in funcnames) {
    expect_equal(funcs[[funcname]](10, 0, 1:10), integer(), label = funcname)
  }
})

test_that("heavily skewed probability", {
  prob <- c(1, 1e10)
  for (funcname in funcnames) {
    expect_equal(funcs[[funcname]](length(prob), 1, prob), 2, label = funcname)
  }
})
