library(magrittr)
devtools::load_all(devtools::as.package("."))

N <- trunc(10 ** seq(1.5, 5, by = 0.5))

overview_benchmark <- plyr::ldply(
  setNames(nm = N),
  function(n) {
    prob <- rep(1, n)
    microbenchmark::microbenchmark(
      crank=sample.int.crank(n, n, prob),
      rank=sample.int.rank(n, n, prob),
      rej=sample.int.rej(n, n, prob),
      R=sample.int(n, n, replace = FALSE, prob)
    )
  }
) %>%
  dplyr::rename(n = .id)

devtools::use_data(overview_benchmark, overwrite = TRUE, compress = "xz")
