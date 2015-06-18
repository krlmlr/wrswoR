context("corner")

test_that("zero-length output", {
  for (funcname in funcnames) {
    expect_equal(funcs[[funcname]](10, 0, 1:10), integer(), label = funcname)
  }
})
