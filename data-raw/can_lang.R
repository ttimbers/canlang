## code to prepare `can_lang` data set
library(cancensus)
library(canlang)
library(dplyr)


# Mother tongue -----------------------------------------------------------

non_off_moth_tongue <- get_language_data("CA16", "v_CA16_563")
off_lang_moth_tongue <- get_language_data("CA16", "v_CA16_554")
mother_tongue <- bind_rows(non_off_moth_tongue,
          off_lang_moth_tongue) %>%
    arrange(language) %>%
    rename(mother_tongue = count)


# Language spoken most often at home --------------------------------------

non_off_lang_spoken_at_home <- get_language_data("CA16", "v_CA16_1370")
off_lang_spoken_at_home <- get_language_data("CA16", "v_CA16_1361")
lang_spoken_at_home <- bind_rows(off_lang_spoken_at_home,
                                 non_off_lang_spoken_at_home) %>%
    arrange(language) %>%
    rename(spoken_most_often_at_home = count)


# Combine to one tidy data set --------------------------------------------

can_lang <- left_join(mother_tongue,
                      lang_spoken_at_home)

usethis::use_data(can_lang, overwrite = TRUE)
