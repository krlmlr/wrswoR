library(magrittr)

pkg <- devtools::as.package(".")
devtools::load_all(pkg)
source(file.path(pkg$path, "benchmark.R"))


N <- trunc(10 ** seq(1.5, 5, by = 0.5)) %>% setNames(nm = .)
R <- c(0.01, 0.1, 1)
PROB <- list(uniform = function(n) rep(1, n),
             linear = seq_len,
             rev_linear = . %>% seq_len %>% rev,
             shuffled_linear = sample.int)

timings <- .benchmark()

devtools::use_data(timings, overwrite = TRUE, compress = "xz")
