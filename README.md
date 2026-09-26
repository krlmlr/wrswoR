
<!-- README.md and index.md are generated from README.Rmd.
     Edit that file and render it the usual way: rmarkdown::render(), devtools::build_readme(), or the Knit button.
     The cynkratemplate package must be installed; it supplies the output format. -->

# wrswoR

<!-- badges: start -->

[![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![R build status](https://github.com/krlmlr/wrswoR/workflows/rcc/badge.svg)](https://github.com/krlmlr/wrswoR/actions)
[![Codecov test coverage](https://codecov.io/gh/krlmlr/wrswoR/graph/badge.svg)](https://app.codecov.io/gh/krlmlr/wrswoR/tree/main)
[![CRAN status](https://www.r-pkg.org/badges/version/wrswoR)](https://CRAN.R-project.org/package=wrswoR)
<!-- badges: end -->

The goal of wrswoR is to provide faster implementations of weighted random sampling without replacement in R.

## Installation

You can install the released version of wrswoR from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("wrswoR")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("krlmlr/wrswoR")
```

## Example

The functions in this package are a drop-in replacement to `sample.int(n, size, replace = FALSE, prob = prob)`.
With large `n`, `sample.int()` becomes too slow to be practical, unlike the functions in this package.

``` r
library(wrswoR)
set.seed(20200726)

sample_int_crank(20, 10, 1:20)
#>  [1]  8 18 14 17 11 15 10  4 13  5
```
