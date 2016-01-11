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

  ret <- plyr::raply(
    M,
    {
      as <- wrswoR.sample::aggregated_sample(n, size, probs, N, sample_int_funcs)
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
