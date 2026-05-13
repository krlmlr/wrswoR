<!-- NEWS.md is maintained by https://fledge.cynkra.com, contributors should not edit this file -->

# wrswoR 1.2.1 (2026-05-13)

## Chore

- Auto-update from GitHub Actions (#71).

- Add ccache to `.gitignore` and `.Rbuildignore`.

- Auto-update from GitHub Actions (#60).

- Auto-update from GitHub Actions (#58).

- Remove deprecated Rcpp LdFlags from Makevars (#55, #56).

- Auto-update from GitHub Actions (#53).

- Auto-update from GitHub Actions (#43).

## Continuous integration

- Create snapshot update PR against correct branch.

- Add reference to `/apply-patch` workflow in commit message.

- Clarify rationale for not deploying on schedule.

- Only run fledge on pushes to main.

- Tweak fledge workflow and ccache action.

- Cosmetics.

- Bump action versions.

- Install clang-format-21.

- Align fledge workflow.

- Harmonize.

- Fix comment (#51).

- Tweaks (#50).

- Test all R versions on branches that start with cran- (#49).

- Install binaries from r-universe for dev workflow (#47).

- Fix reviewdog and add commenting workflow (#45).

## Refactoring

- Replace logging dependency with otel (#67).


# wrswoR 1.2.0 (2025-11-09)

## Features

- New memory-friendly `sample_int_cccrank()`, add references (@vgherard, #7).

## Bug fixes

- Add input validation for `NA` and negative values in sampling functions (#9, #39).


# wrswoR 1.1.1 (2020-07-26)

- In `sample_int_expj()`, move retrieval of top element into the loop, to make it independent from the actual implementation of the priority queue.


# wrswoR 1.1 (2018-02-02)

- Use microbenchmark package conditionally.
- Remove dependency on cluster.
- Use native method registration.
- Prepare for submission to R Journal.
- Improve vignette.
- Internal tweaks.


# wrswoR 1.0-1 (2016-02-26)

- Finally submitted version of the paper.


# wrswoR 1.0 (2016-02-22)

First CRAN release.

- Alternative implementations for weighted random sampling, as implemented by R's `sample.int(replace = FALSE, prob = ...)`
    - `sample_int_rej()`: A rejective algorithm, in R
    - `sample_int_rank()`: One-pass sampling by Efraimidis and Spirakis, in R
    - `sample_int_crank()`: One-pass sampling by Efraimidis and Spirakis, in C++
    - `sample_int_expj()`: Reservoir sampling with exponential jumps Efraimidis and Spirakis, in C++
    - Two more experimental functions.
- Article for submission to JStatSoft as vignette.
