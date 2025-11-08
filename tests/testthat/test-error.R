test_that("sample larger than population", {
  for (funcname in funcnames) {
    expect_error(funcs[[funcname]](1, 2, 1), "larger than the population", label = funcname)
  }
})

test_that("number of probabilities", {
  for (funcname in funcnames) {
    expect_error(funcs[[funcname]](3, 2, 1:2), "incorrect number of probabilities", label = funcname)
    expect_error(funcs[[funcname]](3, 2, 1:4), "incorrect number of probabilities", label = funcname)
    expect_error(funcs[[funcname]](4, 3, 1:5), "incorrect number of probabilities", label = funcname)
  }
})

test_that("NA sample size", {
  for (funcname in funcnames) {
    # sample_int_R uses base::sample.int which has different error messages
    if (funcname == "sample_int_R") {
      expect_error(funcs[[funcname]](5, NA, rep(1, 5)), "invalid.*size", label = funcname)
    } else {
      expect_error(funcs[[funcname]](5, NA, rep(1, 5)), "'size' must not be NA", label = funcname)
    }
  }
})

test_that("NA population size", {
  for (funcname in funcnames) {
    # sample_int_R uses base::sample.int which has different error messages
    if (funcname == "sample_int_R") {
      expect_error(funcs[[funcname]](NA, 3, rep(1, 5)), "invalid.*first", label = funcname)
    } else {
      expect_error(funcs[[funcname]](NA, 3, rep(1, 5)), "'n' must not be NA", label = funcname)
    }
  }
})

test_that("negative sample size", {
  for (funcname in funcnames) {
    # sample_int_R uses base::sample.int which has different error messages
    if (funcname == "sample_int_R") {
      expect_error(funcs[[funcname]](5, -1, rep(1, 5)), "invalid.*size", label = funcname)
    } else {
      expect_error(funcs[[funcname]](5, -1, rep(1, 5)), "'size' must be non-negative", label = funcname)
    }
  }
})

test_that("negative population size", {
  for (funcname in funcnames) {
    # sample_int_R uses base::sample.int which has different error messages
    if (funcname == "sample_int_R") {
      expect_error(funcs[[funcname]](-1, 0, rep(1, 5)), "invalid.*first", label = funcname)
    } else {
      expect_error(funcs[[funcname]](-1, 0, rep(1, 5)), "'n' must be non-negative", label = funcname)
    }
  }
})
