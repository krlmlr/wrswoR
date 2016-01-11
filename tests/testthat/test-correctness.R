context("correctness")

test_that("identical behavior", {
  probs <- wrswoR.benchmark::prob(1.07)
  p.values <- aggregated_prop_test(
    10,
    5,
    probs$rexp(10),
    1000,
    8,
    kimisc::nlist(sample_int_R, sample_int_rej, sample_int_crank, sample_int_expj))

  expect_false(any(is.na(p.values)))

  expect_more_than(quantile(p.values, 0.05), 0.01)
})

# agg_false <- aggregated_prop_test_probs(10, 5, list(wrswoR.benchmark::prob(1.007)$linear(10), wrswoR.benchmark::prob(1.007)$linear_half(10), wrswoR.benchmark::prob(1.007)$linear_half(10)), 10000, 8, sample_int_R)

test_that("different distributions", {
  probs <- wrswoR.benchmark::prob(1.07)
  p.values <- aggregated_prop_test(
    10,
    5,
    kimisc::nlist(probs$rexp(10), probs$uniform(10)),
    1000,
    8,
    sample_int_R)

  expect_false(any(is.na(p.values)))

  expect_less_than(quantile(p.values, 0.05), 0.01)
})
