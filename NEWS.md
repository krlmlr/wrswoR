<!-- NEWS.md is maintained by https://fledge.cynkra.com, contributors should not edit this file -->

# wrswoR 1.1.1.9003 (2023-02-17)

- Internal changes only.


# wrswoR 1.1.1.9002 (2022-12-30)

- Internal changes only.


# wrswoR 1.1.1.9001 (2022-12-24)

## Chore

- Use testthat edition 3.

- Fix CI/CD failures (@IndrajeetPatil, #10, #11).

## Uncategorized

- Harmonize yaml formatting.

- Revert changes to matrix section.

- Reduce parallelism.

- Also check dev on cran-* branches.

- Update hash key for dev.

- Remove R 3.3.

- Merge cran-1.1.1.


# wrswoR 1.1.1.9000 (2020-07-26)

- Internal changes only.


# wrswoR 1.1.1 (2020-07-26)

- In `sample_int_expj()`, move retrieval of top element into the loop, to make it independent from the actual implementation of the priority queue.


# wrswoR 1.1 (2018-02-02)

- Use microbenchmark package conditionally.
- Remove dependency on cluster.
- Use native method registration.
- Prepare for submission to R Journal.
- Improve vignette.
- Internal tweaks.


# Version 1.0-1 (2016-02-26)

- Finally submitted version of the paper.


# Version 1.0 (2016-02-22)

First CRAN release.

- Alternative implementations for weighted random sampling, as implemented by R's `sample.int(replace = FALSE, prob = ...)`
    - `sample_int_rej()`: A rejective algorithm, in R
    - `sample_int_rank()`: One-pass sampling by Efraimidis and Spirakis, in R
    - `sample_int_crank()`: One-pass sampling by Efraimidis and Spirakis, in C++
    - `sample_int_expj()`: Reservoir sampling with exponential jumps Efraimidis and Spirakis, in C++
    - Two more experimental functions.
- Article for submission to JStatSoft as vignette.
