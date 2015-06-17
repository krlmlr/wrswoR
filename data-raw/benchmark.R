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
  },
  .id = "n"
)

library(ggplot2)
ggplot(overview_benchmark, aes(x=n, y=time * 1e-9, color=expr)) + geom_boxplot() +
  scale_y_log10()
