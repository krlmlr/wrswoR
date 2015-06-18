context("corner")

test_that("zero-length output", {
  expect_equal(sample.int.crank(10, 0, 1:10), integer())
})

test_that("heavily skewed probability", {
  prob <- c(1, 1e10)
  expect_equal(sample.int(length(prob), 1, replace = FALSE, prob = prob), 2)
  expect_equal(sample.int.crank(length(prob), 1, prob = prob), 2)
  expect_equal(sample.int.rank(length(prob), 1, prob = prob), 2)
  expect_equal(sample.int.rej(length(prob), 1, prob = prob), 2)
})
