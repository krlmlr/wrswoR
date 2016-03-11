## Test environments
* local Ubuntu 15.10 install, R 3.2.3
* win-builder (devel and release)

## R CMD check results

0 errors | 1 warnings | 1 note

- Encoding of maintainer name
- latexmk problem on win-builder:

* checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Warning: running command '"D:\compiler\texmf\miktex\bin\latexmk.exe" -pdf -latexoption=-halt-on-error -interaction=batchmode -pdflatex="pdflatex" "wrswoR.tex"' had status 255
File::Path version 2.08 required--this is only version 1.08 at D:\Compiler\texmf\scripts\latexmk\perl\latexmk.pl line 122.
BEGIN failed--compilation aborted at D:\Compiler\texmf\scripts\latexmk\perl\latexmk.pl line 122.
Warning: running command '"D:\compiler\texmf\miktex\bin\latexmk.exe" -v' had status 255
Error: processing vignette 'wrswoR.Rmd' failed with diagnostics:
Failed to compile wrswoR.tex.
Execution halted


## Reverse dependencies

None.
