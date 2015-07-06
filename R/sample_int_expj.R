#' @rdname sample_int
#' @details \code{sample_int_expj} and \code{sample_int_expjs}
#'   implement one-pass random sampling with a reservor with exponential jumps
#'   (Efraimidis and Spirakis, 2006, Algorithm A-ExpJ).  Both functions are
#'   implemented in \code{Rcpp}; \code{*_expj} uses log-transformed keys,
#'   \code{*_expjs} implements the algorithm in the paper verbatim
#'   (at the cost of numerical stability).
#' @author Kirill Müller (for \code{_*expj*})
#' @references Efraimidis, Pavlos S., and Paul G. Spirakis. "Weighted
#' random sampling with a reservoir." \emph{Information Processing
#' Letters} 97, no. 5 (2006): 181-185.
#' @examples
#' ## Algorithm A-ExpJ (with log-transformed keys)
#' \dontrun{
#' s <- sample_int_expj(200000, 100000, runif(200000))
#' }
#' stopifnot(unique(s) == s)
#' p <- c(995, rep(1, 5))
#' n <- 1000
#' set.seed(42)
#' stopifnot(abs(table(replicate(sample_int_expjs(6, 3, p), n=n)) / n -
#'   c(1, rep(0.4, 5))) < 0.04)
"sample_int_expj"
