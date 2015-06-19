set.seed(20150619L)

R <- c(0.01, 0.1, 1) %>% setNames(nm = .)
PROB <- list(uniform = function(n) rep(1, n),
             linear = seq_len,
             rev_linear = . %>% seq_len %>% rev,
             shuffled_linear = sample.int)

.benchmark <- function() {
  plyr::ldply(
    PROB,
    function(probf) {
      plyr::ldply(
        N,
        function(n) {
          prob <- probf(n)
          plyr::ldply(
            R,
            function(r) {
              s <- trunc(n * r)
              microbenchmark::microbenchmark(
                ccrank=sample.int.crank(n, s, prob),
                crank=sample.int.crank(n, s, prob),
                rank=sample.int.rank(n, s, prob),
                rej=sample.int.rej(n, s, prob),
                R=sample.int.R(n, s, prob),
                control = list(order = "block", warmup = 10)
              )
            }) %>%
            dplyr::mutate(r = as.numeric(.id), .id = NULL)
        }) %>%
        dplyr::mutate(n = as.integer(.id), .id = NULL)
    }) %>%
    dplyr::rename(prob = .id)
}
