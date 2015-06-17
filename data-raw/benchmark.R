N <- 10 ** (2:5)

results <- plyr::ldply(
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
ggplot(results, aes(x=N, y=time, color=expr)) + geom_boxplot() +
  scale_y_log10()
