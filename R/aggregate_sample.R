#' @export
aggregated_prop_test_probs <- function(n, size, probs, N, M, sample_int_func) {
  trials <- rep(N, length(probs))
  ret <- raply(
    M,
    {
      as <- aggregated_sample_probs(n, size, probs, N, sample_int_func)
      apply(as, 2:3, function(x) prop.test(x, n = trials)$p.value)
    }
  )
  dimnames(ret) <- c(list(m = seq_len(M)), dimnames(ret)[2:3])
  ret
}

#' @importFrom plyr laply
#' @export
aggregated_sample_probs <- function(n, size, probs, N, sample_int_func) {
  ret <- laply(
    probs,
    aggregated_sample_one,
    n = n,
    size = size,
    N = N,
    sample_int_func = sample_int_func,
    .drop = FALSE
  )
  nm <- names(probs)
  if (is.null(nm))
    nm <- seq_along(probs)
  dimnames(ret) <- c(list(prob = nm), dimnames(ret)[2:3])
  ret
}

#' @export
aggregated_prop_test <- function(n, size, prob, N, M, sample_int_funcs) {
  trials <- rep(N, length(sample_int_funcs))
  ret <- raply(
    M,
    {
      as <- aggregated_sample(n, size, prob, N, sample_int_funcs)
      apply(as, 2:3, function(x) prop.test(x, n = trials)$p.value)
    }
  )
  dimnames(ret) <- c(list(m = seq_len(M)), dimnames(ret)[2:3])
  ret
}

#' @importFrom plyr laply
#' @export
aggregated_sample <- function(n, size, prob, N, sample_int_funcs) {
  ret <- laply(
    sample_int_funcs,
    aggregated_sample_one,
    n = n,
    size = size,
    prob = prob,
    N = N,
    .drop = FALSE
  )
  nm <- names(sample_int_funcs)
  if (is.null(nm))
    nm <- seq_along(sample_int_funcs)
  dimnames(ret) <- c(list(func = nm), dimnames(ret)[2:3])
  ret
}

aggregated_sample_one <- function(n, size, prob, N, sample_int_func) {
  rs <- repeated_sample(n, size, prob, N, sample_int_func)
  sln <- seq_len(n)
  ret <- apply(rs, 2, function(x) table(factor(x, levels = sln)))
  dimnames(ret) <- c(list(i = seq_len(n)), dimnames(ret)[2])
  ret
}

#' @importFrom plyr raply
repeated_sample <- function(n, size, prob, N, sample_int_func) {
  ret <- raply(N, sample_int_func(n = n, size = size, prob = prob), .drop = FALSE)
  dimnames(ret) <- list(NULL, j = seq_len(size))
  ret
}
