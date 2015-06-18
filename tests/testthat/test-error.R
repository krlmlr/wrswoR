context("error")

test_that("sample larger than population", {
  for (funcname in funcnames) {
    expect_error(funcs[[funcname]](1, 2, 1), "larger than the population", label = funcname)
  }
})
