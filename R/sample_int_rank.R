#' @rdname sample_int
#' @details `sample_int_rank()`, `sample_int_crank()` and
#'   `sample_int_ccrank()` implement one-pass random sampling
#'   (Efraimidis and Spirakis, 2006, Algorithm A).  The first function is
#'   implemented purely in R, the other two are optimized `Rcpp`
#'   implementations (`*_crank()` uses R vectors internally, while
#'   `*_ccrank()` uses `std::vector`; surprisingly, `*_crank()` seems
#'   to be faster on most inputs). It can be
#'   shown that the order statistic of \eqn{U^{(1/w_i)}} has the same
#'   distribution as random sampling without replacement (\eqn{U=\mbox{uniform}(0,1)}{U=uniform(0,1)}
#'   distribution). To increase numerical stability, \eqn{\log(U) /
#'   w_i}{log(U) / w_i} is computed instead; the log transform does not
#'   change the order statistic.
#' @author Dinre (for `*_rank()`), Kirill Müller
#'   (for all other functions)
#' @references Efraimidis, Pavlos S., and Paul G. Spirakis. "Weighted
#' random sampling with a reservoir." *Information Processing
#' Letters* 97, no. 5 (2006): 181-185.
#' @export
#' @examples
#' ## Algorithm A
#' s <- sample_int_rank(20000, 10000, runif(20000))
#' stopifnot(unique(s) == s)
#' p <- c(995, rep(1, 5))
#' n <- 1000
#' set.seed(42)
#' tbl <- table(replicate(sample_int_rank(6, 3, p),
#'                        n = n)) / n
#' stopifnot(abs(tbl - c(1, rep(0.4, 5))) < 0.04)
#'
#' @importFrom stats rexp
#' @importFrom utils head
sample_int_rank <- function(n, size, prob) {
  .check_args(n, size, prob)
  head(order(rexp(n) / prob), size)
}

.check_args <- function(n, size, prob) {
  if (n < size) {
    stop("cannot take a sample larger than the population", call. = FALSE)
  }

  if (length(prob) != n) {
    stop("incorrect number of probabilities", call. = FALSE)
  }
}
