<!-- NEWS.md is maintained by https://fledge.cynkra.com, contributors should not edit this file -->

# wrswoR 1.2.1.9010 (2026-08-08)

## Continuous integration

- Wrap the commit status update into an action.

- Route ccache through one-word compiler wrappers on Unix.

- Name every step and restore the log entry `setup-pandoc` swallows.


# wrswoR 1.2.1.9009 (2026-08-06)

## Continuous integration

- Add sharded `revdep2` workflow.

## Uncategorized

- Ci: Harden `workflow_run` workflows against untrusted pull requests (#106).

- Ci: Pin third-party actions to commits and let Renovate keep them pinned (#105).


# wrswoR 1.2.1.9008 (2026-08-05)

## Chore

- Auto-update from GitHub Actions (#82).

## Continuous integration

- Remove unused pr-commands workflow.

## Uncategorized

- Ci: Give every workflow and job an explicit `permissions` block (#103).

- Ci: Pass workflow context through the environment, not into script text (#102).

- Ci: Add a Windows arm64 (`windows-11-arm`) check on R-release (#99).


# wrswoR 1.2.1.9007 (2026-07-28)

- Ci: Run all smoke-test checks even when one fails (#97).

- Ci: Apply matrix `env` vars in the workflow, not in custom actions (#95).

- Ci: Link the responsible workflow run in snapshot update PRs (#96).


# wrswoR 1.2.1.9006 (2026-07-25)

## Continuous integration

- Lock down `format-suggest` egress (audit → block).


# wrswoR 1.2.1.9005 (2026-07-24)

## Bug fixes

### ci

- Emit empty package matrix when there are no (rev)deps.

## Uncategorized

- Ci: Harden `format-suggest` against `pull_request_target` pwn requests (#93).


# wrswoR 1.2.1.9004 (2026-07-22)

## Continuous integration

- Run on Ubuntu 26.04.

- Align workflows with template.


# wrswoR 1.2.1.9003 (2026-07-22)

## Continuous integration

- Ignore `metap` in CI dependency resolution to avoid retired Bioconductor dep (#76).


# wrswoR 1.2.1.9002 (2026-05-24)

## Continuous integration

- Update ccache-action reference.

- Bump action version.


# wrswoR 1.2.1.9001 (2026-05-16)

- Ci: Unify fledge.yaml across cynkratemplate and fledge (#86).


# wrswoR 1.2.1.9000 (2026-05-14)

- Switching to development version.


# wrswoR 1.2.1 (2026-05-13)

## Chore

- Replace logging dependency with otel (#67).

- Remove deprecated Rcpp LdFlags from Makevars (#55, #56).


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
