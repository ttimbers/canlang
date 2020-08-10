## code to prepare `can_lang` data set
library(cancensus)
library(canlang)
library(dplyr)
library(here)
library(readr)
library(readxl)
library(tidyr)

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
    rename(most_at_home = count)


# Language spoken most often at work --------------------------------------

non_off_lang_spoken_at_work <- get_language_data("CA16", "v_CA16_5867")
off_lang_spoken_at_work <- get_language_data("CA16", "v_CA16_5858")
lang_spoken_at_work <- bind_rows(off_lang_spoken_at_work,
                                 non_off_lang_spoken_at_work) %>%
    arrange(language) %>%
    rename(most_at_work = count)


# Language there is knowledge for -----------------------------------------

non_off_lang_know <- get_language_data("CA16", "v_CA16_2613")
off_lang_know <- get_language_data("CA16", "v_CA16_2604")
lang_known <- bind_rows(off_lang_know,
                       non_off_lang_know) %>%
    arrange(language) %>%
    rename(lang_known = count)

# Combine to one tidy data set --------------------------------------------

can_lang <- left_join(mother_tongue,
                      lang_spoken_at_home) %>%
    left_join(lang_spoken_at_work) %>%
    left_join(lang_known)


# Add language categories -------------------------------------------------
official <- get_child_langs("CA16", "v_CA16_554")
aboriginal <- eg <- get_child_langs("CA16", "v_CA16_566")
lang_cat <- bind_rows(official, aboriginal) %>%
    filter(!language == "Aboriginal languages")

can_lang <- left_join(can_lang, lang_cat) %>%
    replace_na(list(category = "Non-Official & Non-Aboriginal languages")) %>%
    select(category,
           language,
           mother_tongue,
           most_at_home,
           most_at_work,
           lang_known)


# Write data --------------------------------------------------------------

# R package data object
usethis::use_data(can_lang, overwrite = TRUE)

# plain vanilla csv file
readr::write_csv(can_lang, here::here("inst", "extdata", "can_lang.csv"))

# csv file with meta data in header
fileConn<-file(here::here("inst", "extdata", "can_lang-meta-data.csv"))
writeLines(c('Source: Statistics Canada, Census of Population, 2016. Reproduced and distributed on an "as is" basis with the permission of Statistics Canada.',
             'Date collected: 2020/07/09'), fileConn)
close(fileConn)
readr::write_csv(can_lang, here::here("inst", "extdata", "can_lang-meta-data.csv"),
                 append = TRUE)

# No col names and tab delimited
readr::write_delim(can_lang, here::here("inst", "extdata", "can_lang.tsv"),
                 delim = "\t",
                 col_names = FALSE)

# Excel file
# TBD

# SQLite file
