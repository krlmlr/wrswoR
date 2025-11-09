<!-- NEWS.md is maintained by https://fledge.cynkra.com, contributors should not edit this file -->

# wrswoR 1.1.1.9019 (2025-11-09)

## Bug fixes

- Add input validation for `NA` and negative values in sampling functions (#9, #39).

## Features

- New memory-friendly `sample_int_cccrank()`, add references (@vgherard, #7).

## Chore

- Auto-format (#40).

- Ignore.

- Auto-update from GitHub Actions.

  Run: https://github.com/krlmlr/wrswoR/actions/runs/17450837805

- Auto-update from GitHub Actions.

  Run: https://github.com/krlmlr/wrswoR/actions/runs/14636202646

## Continuous integration

- Use workflows for fledge (#41).

- Sync (#38).

- Use reviewdog for external PRs (#37).

- Cleanup and fix macOS (#36).

- Format with air, check detritus, better handling of `extra-packages` (#35).

- Enhance permissions for workflow (#34).

- Permissions, better tests for missing suggests, lints (#33).

- Only fail covr builds if token is given (#32).

- Always use `_R_CHECK_FORCE_SUGGESTS_=false` (#31).

- Correct installation of xml2 (#30).

- Explain (#29).

- Add xml2 for covr, print testthat results (#28).

- Fix (#27).

- Sync (#26).


# wrswoR 1.1.1.9018 (2024-12-09)

## Continuous integration

- Avoid failure in fledge workflow if no changes (#25).


# wrswoR 1.1.1.9017 (2024-12-08)

## Continuous integration

- Fetch tags for fledge workflow to avoid unnecessary NEWS entries (#24).


# wrswoR 1.1.1.9016 (2024-12-07)

## Continuous integration

- Use larger retry count for lock-threads workflow (#23).


# wrswoR 1.1.1.9015 (2024-11-28)

## Continuous integration

- Ignore errors when removing pkg-config on macOS (#22).


# wrswoR 1.1.1.9014 (2024-11-27)

## Continuous integration

- Explicit permissions (#21).


# wrswoR 1.1.1.9013 (2024-11-26)

## Continuous integration

- Use styler from main branch (#20).


# wrswoR 1.1.1.9012 (2024-11-25)

## Continuous integration

- Need to install R on Ubuntu 24.04 (#19).

- Correctly detect branch protection (#16).

- Use Ubuntu 24.04 and styler PR (#17).


# wrswoR 1.1.1.9011 (2024-11-22)

## Continuous integration

  - Correctly detect branch protection (#16).


# wrswoR 1.1.1.9010 (2024-11-18)

## Continuous integration

  - Use stable pak (#15).


# wrswoR 1.1.1.9009 (2024-11-11)

## Continuous integration

  - Trigger run (#14).
    
      - ci: Trigger run
    
      - ci: Latest changes


# wrswoR 1.1.1.9008 (2024-10-28)

## Continuous integration

  - Use pkgdown branch (#13).
    
      - ci: Use pkgdown branch
    
      - ci: Updates from duckdb
    
      - ci: Trigger run


# wrswoR 1.1.1.9007 (2024-09-15)

## Continuous integration

  - Install via R CMD INSTALL ., not pak (#12).
    
      - ci: Install via R CMD INSTALL ., not pak
    
      - ci: Bump version of upload-artifact action


# wrswoR 1.1.1.9006 (2024-08-31)

## Chore

  - Auto-update from GitHub Actions.
    
    Run: https://github.com/krlmlr/wrswoR/actions/runs/10425482869

  - Auto-update from GitHub Actions.
    
    Run: https://github.com/krlmlr/wrswoR/actions/runs/10200111658

  - Auto-update from GitHub Actions.
    
    Run: https://github.com/krlmlr/wrswoR/actions/runs/9727973836

  - Auto-update from GitHub Actions.
    
    Run: https://github.com/krlmlr/wrswoR/actions/runs/9691616127

## Continuous integration

  - Install local package for pkgdown builds.

  - Improve support for protected branches with fledge.

  - Improve support for protected branches, without fledge.

  - Sync with latest developments.

  - Use v2 instead of master.

  - Inline action.

  - Use dev roxygen2 and decor.

  - Fix on Windows, tweak lock workflow.

  - Tweak lock workflow.

  - More specific criterion for avoiding NOTEs.

  - Avoid metap for R \< 4.3 due to unsatisfiable dependencies.

  - Use token for installing packages.

  - Avoid checking bashisms on Windows.

  - Better commit message.

  - Bump versions, better default, consume custom matrix.

  - Recent updates.


# wrswoR 1.1.1.9005 (2023-10-09)

- Internal changes only.


# wrswoR 1.1.1.9004 (2023-03-24)

- Internal changes only.


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
