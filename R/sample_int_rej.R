#' @title Weighted sampling without replacement using 
#'   repeated weighted sampling with replacement
#' @description \code{sample.int.rej} takes a sample of the specified 
#'   \code{size} from the elements of \code{1:n} without replacement. 
#'   This function is faster than \code{sample.int} in many cases, 
#'   especially when \code{n} and \code{size} are large, even if the
#'   weights range over many orders of magnitudes.
#' @inheritParams base::sample.int
#' @return An integer vector of length \code{size} with elements from 
#'   \code{1:n}.
#' @details The call \code{sample.int.rej(n, size, prob)} is equivalent 
#'   to \code{sample.int(n, size, replace=F, prob)}.  (The results will 
#'   most probably be different for the same random seed, but the 
#'   returned samples are distributed identically for both calls.) 
#'   However, \code{sample.int} implements an algorithm with quadratic 
#'   runtime -- this is not suitable for large values of \code{n} and 
#'   \code{size} (see also 
#'   \url{http://stackoverflow.com/q/15113650/946850}).  (Note that the 
#'   performance of \code{sample.int} is just fine in the "with 
#'   replacement" case, and also for uniform probabilities.)
#'   
#'   This function simulates weighted sampling without replacement using
#'   somewhat more draws \emph{with} replacement, and then discarding 
#'   duplicate values (rejection sampling).  If too few items are 
#'   sampled, the routine calls itself recursively on a (hopefully) much
#'   smaller problem.  See also 
#'   \url{http://stats.stackexchange.com/q/20590/6432}.
#' @author Kirill Müller
#' @seealso \link[base]{sample.int}
#' @examples
#' s <- sample.int.rej(200000, 100000, runif(200000))
#' stopifnot(unique(s) == s)
#' p <- c(995, rep(1, 5))
#' n <- 1000
#' set.seed(42)
#' stopifnot(abs(table(replicate(sample.int.rej(6, 3, p), n=n)) / n -
#'   c(1, rep(0.4, 5))) < 0.04)
sample.int.rej <- function(n, size, prob) {
  .sample.int.rej(n, size, prob, 2, 1)
}

.harmonic.series <- NULL
.harmonic.series.max <- 50

# Euler-Mascheroni constant
.EM = 0.57721566490153286060651209008240243104215933593992

#' Computes the harmonic series. Exact for the first
#' .harmonic.series.max values (through table lookup), otherwise using
#' the approximation ln(a) + \gamma + 1 / (2a). Source: 
#' http://en.wikipedia.org/wiki/Harmonic_number
.harmonic <- function(a) {
  stopifnot(a >= 0)
  if (a <= .harmonic.series.max) {
    if (length(.harmonic.series) != .harmonic.series.max + 1)
      .harmonic.series <- c(0, cumsum(1 / (1:.harmonic.series.max)))
    .harmonic.series[a + 1]
  } else {
    log(a) + .EM + .5 / a
  }
}

#' Workhorse
.sample.int.rej <- function(
  n, size, prob, MAX_OVERSHOOT, BIAS) {
  
  require(logging)
  logdebug('.sample.int.rej: parameters: %s, %s, %s', n, size, length(prob))
  
  #' How many draws *with replacement* are required on average, assuming
  #' *uniform* weights? (With non-uniform weights, this number can only
  #' increase.) The result is a general case of the coupon collector
  #' problem, see http://math.stackexchange.com/q/247569/16420 for an
  #' analysis. BIAS can be supplied to correct the estimate by a factor,
  #' at most n * MAX_OVERSHOOT samples will be drawn.  Both are tuning 
  #' parameters, ideal values are still to be found through simulation.
  wr.size <- ceiling(n * min(BIAS * (.harmonic(n) - .harmonic(n - size)),
                             MAX_OVERSHOOT))
  logdebug('.sample.int.rej: wr.size=%s', wr.size)
  
  #' Do the sampling with replacement...
  wr.sample <- sample.int(n, size=wr.size, replace=T, prob)
  #' ...but keep only unique values.
  wr.sample <- unique(wr.sample)
  wr.sample.len <- length(wr.sample)
  logdebug('.sample.int.rej: wr.sample.len=%s', wr.sample.len)
  
  #' How much still left to do?
  rem.size <- size - wr.sample.len
  #' Done? Great!
  if (rem.size <= 0)
    return (head(wr.sample, size))
  
  #' Not yet: Find out which indexes haven't been sampled yet.  Recall 
  #' that negative indexes in a vector subscription mean "all but
  #' the selected".
  rem.indexes <- (1:n)[-wr.sample]
  rem.n <- length(rem.indexes)
  stopifnot(rem.n == n - wr.sample.len)
  
  #' Recursive call to sample without replacement from the remaining
  #' weights
  rem.sample <- .sample.int.rej(rem.n, rem.size,
                                prob[rem.indexes],
                                MAX_OVERSHOOT, BIAS)
  
  #' Combine the results, substitute the indexes from 1:rem.n obtained
  #' from the recursive call using the rem.indexes map
  c(wr.sample, rem.indexes[rem.sample])
}
