## code to prepare `lang_spoken_at_home` dataset goes here

library(cancensus)
library(canlang)

# turn this into a map... later...
lang_spoken_at_home <- language_data("v_CA16_1361")

usethis::use_data(lang_spoken_at_home, overwrite = TRUE)
