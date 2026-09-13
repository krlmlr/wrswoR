
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

## Goals and non-goals

wrswoR aims to:

- Be a drop-in replacement for `sample.int(n, size, replace = FALSE, prob = prob)`
  that stays usable when `n` is large, where the stock implementation appears to need quadratic run time.
- Offer the algorithms side by side under one calling convention:
  rejection sampling, one-pass sampling, and reservoir sampling with exponential jumps,
  so that the one that suits a weight distribution can be chosen.
- Draw from the same distribution as the stock implementation, and show the evidence:
  the accompanying article validates each implementation against `base::sample.int()`.
- Stay a light dependency for packages that need the speed: Rcpp is the only import.

It is explicitly not trying to:

- Reproduce `base::sample.int()`'s draws for a given seed.
  The samples are distributed identically, the sequences are not the same.
- Speed up the cases R already handles well: sampling with replacement, or with uniform weights.
- Sample the elements of a vector.
  Like `sample.int()`, and unlike `sample()`, these functions return integer indices from `1:n`.
- Sample from inclusion probabilities, as survey sampling does.
  The weights here are relative, and the article points to the `UPxxx()` functions of the sampling package for that case.

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
