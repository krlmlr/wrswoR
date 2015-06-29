context("unique")

test_that("no dupes", {
  for (funcname in funcnames) {
    for (i in 1:20) {
      expect_equal(sum(duplicated(funcs[[funcname]](i, i - 1, seq_len(i)))), 0,
                  label = funcname)
    }
  }
})
