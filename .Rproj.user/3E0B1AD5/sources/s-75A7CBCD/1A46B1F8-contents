## code to prepare `imm_mother_tongue` dataset goes here
library(cancensus)
library(canlang)
library(dplyr)

# turn this into a map... later...
non_off_moth_tongue <- get_language_data("CA16", "v_CA16_563")
off_lang_moth_tongue <- get_language_data("CA16", "v_CA16_554")
mother_tongue <- bind_rows(non_off_moth_tongue,
          off_lang_moth_tongue) %>%
    arrange(language)

usethis::use_data(mother_tongue, overwrite = TRUE)
