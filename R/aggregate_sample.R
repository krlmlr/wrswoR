prop_test_p_value <- function(trials) {
  force(trials)
  function(x) {
    x <- as.vector(x)
    y <- x[-1L]
    xx <- x[[1L]]
    sapply(
      y,
      function(yy) {
        #prop.test(c(xx, yy), c(trials, trials))$p.value
        fisher.test(matrix(c(xx, yy, trials - xx, trials - yy), ncol = 2))$p.value
      }
    )
  }
}

#' @export
aggregated_prop_test <- function(n, size, probs, N, M, sample_int_funcs) {
  if (!is.list(probs)) {
    probs <- list(probs)
  }
  if (!is.list(sample_int_funcs)) {
    sample_int_funcs <- list(sample_int_funcs)
  }

  nm <- NULL

  ret <- raply(
    M,
    {
      as <- aggregated_sample(n, size, probs, N, sample_int_funcs)
      stopifnot(length(dim(as)) == 4L)
      if (is.null(nm)) {
        nm <<- sapply(dimnames(as)[1L:2L], `[`, -1L)
        nm <<- nm[vapply(nm, length, integer(1L)) > 0L]
      }

      # need aaply here for .drop = FALSE
      ret <- plyr::aaply(as, 3:4, prop_test_p_value(N), .drop = FALSE)
      ret <- aperm(ret, c(3, 1, 2))
      ret
    },
    .drop = FALSE
  )
  dimnames(ret) <- c(list(m = seq_len(M)), nm, dimnames(ret)[-1L:-2L])
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
  ret <- plyr::aaply(
    ret,
    2,
    cumsum,
    .drop = FALSE)
  ret <- t(ret)
  dimnames(ret) <- c(list(i = seq_len(n)), dimnames(ret)[2])
  stopifnot(ret[nrow(ret),] == N)
  ret <- ret[-nrow(ret),, drop = FALSE]
  ret
}

#' @importFrom plyr raply
repeated_sample <- function(n, size, prob, N, sample_int_func) {
  ret <- raply(N, sample_int_func(n = n, size = size, prob = prob), .drop = FALSE)
  dimnames(ret) <- list(NULL, j = seq_len(size))
  ret
}
