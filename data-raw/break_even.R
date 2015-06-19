library(magrittr)

pkg <- devtools::as.package(".")
devtools::load_all(pkg)
source(file.path(pkg$path, "data-raw", "benchmark.R"))


N <- trunc(10 ** seq(1, 4, by = 0.01)) %>% setNames(nm = .)

break_even <- .benchmark()

devtools::use_data(break_even, overwrite = TRUE, compress = "xz")
