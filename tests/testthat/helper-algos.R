funcnames <- ls("package:wrswoR", pattern = "^sample[.]int[.]")

funcs <- lapply(setNames(nm = funcnames), get, pos = "package:wrswoR")
