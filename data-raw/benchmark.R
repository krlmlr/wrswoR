library(magrittr)
devtools::load_all(devtools::as.package("."))

N <- trunc(10 ** seq(1.5, 5, by = 0.5)) %>% setNames(nm = .)
PROB <- list(uniform = function(n) rep(1, n),
             linear = seq_len,
             rev_linear = . %>% seq_len %>% rev)

timings <-
  plyr::ldply(
    PROB,
    function(probf) {
      plyr::ldply(
      N,
      function(n) {
        prob <- probf(n)
        microbenchmark::microbenchmark(
          ccrank=sample.int.ccrank(n, n, prob),
          crank=sample.int.crank(n, n, prob),
          rank=sample.int.rank(n, n, prob),
          rej=sample.int.rej(n, n, prob),
          R=sample.int.R(n, n, prob),
          control = list(order = "block", warmup = 10)
        )
      }) %>%
      dplyr::mutate(n = as.integer(.id), .id = NULL)
  }) %>%
  dplyr::rename(prob = .id)

devtools::use_data(timings, overwrite = TRUE, compress = "xz")
