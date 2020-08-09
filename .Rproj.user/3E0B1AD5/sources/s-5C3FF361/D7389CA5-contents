## code to prepare `lang_spoken_at_home` dataset goes here

library(cancensus)
library(canlang)
library(dplyr)

# turn this into a map... later...
non_off_lang_spoken_at_home <- get_language_data("CA16", "v_CA16_1370")
off_lang_spoken_at_home <- get_language_data("CA16", "v_CA16_1361")

lang_spoken_at_home <- bind_rows(off_lang_spoken_at_home,
                                 non_off_lang_spoken_at_home) %>%
    arrange(language)

usethis::use_data(lang_spoken_at_home, overwrite = TRUE)
