#' Weighted sampling without replacement using built-in routine
#'
#' This is a simple wrapper for \code{\link[base]{sample.int}}.
#'
#' @inheritParams base::sample.int
#' @return An integer vector of length \code{size} with elements from
#'   \code{1:n}.
#' @seealso \code{\link[base]{sample.int}}
#' @examples
#' s <- sample.int.R(200000, 100000, runif(200000))
#' stopifnot(unique(s) == s)
#' p <- c(995, rep(1, 5))
#' n <- 1000
#' set.seed(42)
#' stopifnot(abs(table(replicate(sample.int.R(6, 3, p), n=n)) / n -
#'   c(1, rep(0.4, 5))) < 0.04)
sample.int.R <- function(n, size, prob) {
  sample.int(n, size, replace = FALSE, prob)
}
