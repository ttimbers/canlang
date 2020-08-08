## code to prepare `lang_spoken_at_home` dataset goes here

library(cancensus)
library(canlang)

# turn this into a map... later...
off_lang_spoken_at_home <- get_language_data("CA16", "v_CA16_1361")
aborig_lang_spoken_at_home <- get_language_data("CA16", "v_CA16_1373")
non_off_non_aborig_lang_spoken_at_home <- get_language_data("CA16", "v_CA16_1370")

lang_spoken_at_home <- bind_rows(off_lang_spoken_at_home,
                                 aborig_lang_spoken_at_home,
                                 non_off_non_aborig_lang_spoken_at_home)

#v_CA16_1622
usethis::use_data(lang_spoken_at_home, overwrite = TRUE)
