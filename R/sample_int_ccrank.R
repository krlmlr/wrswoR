#' @rdname sample_int
#' @importFrom Rcpp evalCpp
#' @examples
#' ## Algorithm A, Rcpp version using std::vector
#' s <- sample_int_ccrank(200000, 100000, runif(200000))
#' stopifnot(unique(s) == s)
#' p <- c(995, rep(1, 5))
#' n <- 1000
#' set.seed(42)
#' stopifnot(abs(table(replicate(sample_int_ccrank(6, 3, p), n=n)) / n -
#'   c(1, rep(0.4, 5))) < 0.04)
"sample_int_ccrank"
