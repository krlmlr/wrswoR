.harmonic.series.max <- 50
.harmonic.series <- c(0, cumsum(1 / (1:.harmonic.series.max)))

devtools::use_data(.harmonic.series, internal = TRUE, overwrite = TRUE,
                   compress = FALSE)
