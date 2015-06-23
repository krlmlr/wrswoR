#'@name sample_int_crank
#'@title Weighted sampling without replacement using reservoir sampling
#'  (Rcpp version)
#'@description \code{sample_int_crank} takes a sample of the specified
#'  \code{size} from the elements of \code{1:n} without replacement.
#'  This function is faster than \code{sample.int} in many cases,
#'  especially when \code{n} and \code{size} are large, even if the
#'  weights range over many orders of magnitudes.
#'@inheritParams base::sample.int
#'@return An integer vector of length \code{size} with elements from
#'  \code{1:n}.
#'@details The call \code{sample_int_crank(n, size, prob)} is equivalent
#'  to \code{sample.int(n, size, replace=F, prob)}.  (The results will
#'  most probably be different for the same random seed, but the
#'  returned samples are distributed identically for both calls.)
#'  However, \code{sample.int} implements an algorithm with quadratic
#'  runtime -- this is not suitable for large values of \code{n} and
#'  \code{size} (see also
#'  \url{http://stackoverflow.com/q/15113650/946850}).  (Note that the
#'  performance of \code{sample.int} is just fine in the "with
#'  replacement" case, and also for uniform probabilities.)
#'
#'  This function implements a variant of reservoir sampling. It can be
#'  shown that the order statistic of U^(1/w_i) has the same
#'  distribution as random sampling without replacement (U=uniform (0,1)
#'  distribution). To increase numerical stability, log(U) / w_i is
#'  computed instead; the log transform does not change the order
#'  statistic.
#'@author Julius
#'@author Kirill Müller
#'@author Dinre
#'@references Efraimidis, Pavlos S., and Paul G. Spirakis. "Weighted
#'  random sampling with a reservoir." \emph{Information Processing
#'  Letters} 97, no. 5 (2006): 181-185.
#' @examples
#' s <- sample_int_crank(200000, 100000, runif(200000))
#' stopifnot(unique(s) == s)
#' p <- c(995, rep(1, 5))
#' n <- 1000
#' set.seed(42)
#' stopifnot(abs(table(replicate(sample_int_crank(6, 3, p), n=n)) / n -
#'   c(1, rep(0.4, 5))) < 0.04)
#'@seealso \code{\link[base]{sample.int}}
#'@importFrom Rcpp evalCpp
NULL
