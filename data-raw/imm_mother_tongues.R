## code to prepare `imm_mother_tongue` dataset goes here
library(cancensus)
library(canlang)

# turn this into a map... later...
non_off_non_aborig_moth_tongue <- get_language_data("CA16", "v_CA16_815")
aborig_moth_tongue <- get_language_data("CA16", "v_CA16_567")
off_lang_moth_tongue <- get_language_data("CA16", "v_CA16_554")
mother_tongue <- bind_rows(non_off_non_aborig_moth_tongue,
          aborig_moth_tongue,
          off_lang_moth_tongue)

usethis::use_data(mother_tongue, overwrite = TRUE)
