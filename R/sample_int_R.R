#' Weighted sampling without replacement
#'
#' These functions implement weighted sampling without replacement using various
#' algorithms, i.e., they take a sample of the specified
#' `size` from the elements of `1:n` without replacement, using the
#' weights defined by `prob`.  The call
#' `sample_int_*(n, size, prob)` is equivalent
#' to `sample.int(n, size, replace = F, prob)`.  (The results will
#' most probably be different for the same random seed, but the
#' returned samples are distributed identically for both calls.)
#' Except for `sample_int_R()` (which
#' has quadratic complexity as of this writing), all functions have complexity
#' \eqn{O(n \log n)}{O(n log n)} or better and
#' often run faster than R's implementation, especially when `n` and
#' `size` are large.
#'
#' @details
#'   `sample_int_R()` is a simple wrapper for [base::sample.int()].
#'
#' @inheritParams base::sample.int
#' @return An integer vector of length `size` with elements from
#'   `1:n`.
#' @seealso [base::sample.int()]
#' @references <https://stackoverflow.com/q/15113650/946850>
#' @name sample_int
#' @export
#' @examples
#' # Base R implementation
#' s <- sample_int_R(2000, 1000, runif(2000))
#' stopifnot(unique(s) == s)
#' p <- c(995, rep(1, 5))
#' n <- 1000
#' set.seed(42)
#' tbl <- table(replicate(sample_int_R(6, 3, p),
#'                        n = n)) / n
#' stopifnot(abs(tbl - c(1, rep(0.4, 5))) < 0.04)
#'
sample_int_R <- function(n, size, prob) {
  sample.int(n, size, replace = FALSE, prob)
}
