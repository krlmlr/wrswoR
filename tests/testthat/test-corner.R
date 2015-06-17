context("corner")

test_that("zero-length output", {
  expect_equal(sample.int.crank(10, 0, 1:10), integer())
})
