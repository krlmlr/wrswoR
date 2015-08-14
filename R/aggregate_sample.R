#' @export
uniformity_model <- function(p_values) {
  p_values_sorted <- sort(p_values)
  length_diff <- length(p_values) - length(p_values_sorted)
  if (length_diff > 0L) {
    warning("Removed ", length_diff, " NA values.", call. = FALSE)
  }
  rank <- (seq_along(p_values_sorted) - 1) / (length(p_values_sorted) - 1L)

  lm(p_values_sorted ~ rank + I(rank ^ 2))
}

#' @export
aggregated_prop_test <- function(n, size, probs, N, M, sample_int_funcs) {
  if (!is.list(probs)) {
    probs <- list(probs)
  }
  if (!is.list(sample_int_funcs)) {
    sample_int_funcs <- list(sample_int_funcs)
  }

  trials <- rep(N, length(sample_int_funcs) * length(probs))
  ret <- raply(
    M,
    {
      as <- aggregated_sample(n, size, probs, N, sample_int_funcs)
      apply(as, 3:4, function(x) prop.test(as.vector(x), n = trials)$p.value)
    }
  )
  dimnames(ret) <- c(list(m = seq_len(M)), dimnames(ret)[-1L])
  ret
}

#' @importFrom plyr laply
#' @export
aggregated_sample <- function(n, size, probs, N, sample_int_funcs) {
  if (!is.list(probs)) {
    probs <- list(probs)
  }
  if (!is.list(sample_int_funcs)) {
    sample_int_funcs <- list(sample_int_funcs)
  }

  nm_probs <- names(probs)
  if (is.null(nm_probs)) {
    nm_probs <- seq_along(probs)
  }
  nm_funcs <- names(sample_int_funcs)
  if (is.null(nm_funcs)) {
    nm_funcs <- seq_along(sample_int_funcs)
  }

  ret <- laply(
    sample_int_funcs,
    function (sample_int_func) {
      laply(
        probs,
        aggregated_sample_one,
        n = n,
        size = size,
        sample_int_func = sample_int_func,
        N = N,
        .drop = FALSE
      )
    },
    .drop = FALSE
  )
  dimnames(ret) <- c(list(func = nm_funcs, prob = nm_probs), dimnames(ret)[-1L:-2L])
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
