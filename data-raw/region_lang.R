## code to prepare `region_lang` data set
library(cancensus)
library(canlang)
library(dplyr)
library(here)
library(openxlsx)
library(readr)
library(readxl)
library(RSQLite)
library(tidyr)
library(stringr)

# Mother tongue -----------------------------------------------------------

non_off_moth_tongue <- get_language_data("CA16", "v_CA16_563", region_level = "CMA")
off_lang_moth_tongue <- get_language_data("CA16", "v_CA16_554", region_level = "CMA")
mother_tongue <- bind_rows(non_off_moth_tongue,
                           off_lang_moth_tongue) %>%
    arrange(language) %>%
    rename(mother_tongue = count)


# Language spoken most often at home --------------------------------------

non_off_lang_spoken_at_home <- get_language_data("CA16", "v_CA16_1370", region_level = "CMA")
off_lang_spoken_at_home <- get_language_data("CA16", "v_CA16_1361", region_level = "CMA")
lang_spoken_at_home <- bind_rows(off_lang_spoken_at_home,
                                 non_off_lang_spoken_at_home) %>%
    arrange(language) %>%
    rename(most_at_home = count)


# Language spoken most often at work --------------------------------------

non_off_lang_spoken_at_work <- get_language_data("CA16", "v_CA16_5867", region_level = "CMA")
off_lang_spoken_at_work <- get_language_data("CA16", "v_CA16_5858", region_level = "CMA")
lang_spoken_at_work <- bind_rows(off_lang_spoken_at_work,
                                 non_off_lang_spoken_at_work) %>%
    arrange(language) %>%
    rename(most_at_work = count)


# Language there is knowledge for -----------------------------------------

non_off_lang_know <- get_language_data("CA16", "v_CA16_2613", region_level = "CMA")
off_lang_know <- get_language_data("CA16", "v_CA16_2604", region_level = "CMA")
lang_known <- bind_rows(off_lang_know,
                        non_off_lang_know) %>%
    arrange(language) %>%
    rename(lang_known = count)

# Combine to one tidy data set --------------------------------------------

region_lang <- left_join(mother_tongue,
                      lang_spoken_at_home) %>%
    left_join(lang_spoken_at_work) %>%
    left_join(lang_known)


# Add language categories -------------------------------------------------
official <- get_child_langs("CA16", "v_CA16_554")
aboriginal <- eg <- get_child_langs("CA16", "v_CA16_566")
lang_cat <- bind_rows(official, aboriginal) %>%
    filter(!language == "Aboriginal languages")

region_lang <- left_join(region_lang, lang_cat) %>%
    replace_na(list(category = "Non-Official & Non-Aboriginal languages")) %>%
    rename(region = `Region Name`) %>%
    select(region,
           category,
           language,
           mother_tongue,
           most_at_home,
           most_at_work,
           lang_known) %>%
    mutate(region = str_replace(region, " \\(B\\)", ""))


# Write data --------------------------------------------------------------

usethis::use_data(region_lang, overwrite = TRUE)

# Vancouver data as a plain vanilla csv
van_lang <- dplyr::filter(region_lang, region == "Vancouver") %>%
    dplyr::select(-region)
readr::write_csv(van_lang, here::here("inst", "extdata", "vancouver_lang.csv"))

# Victoria data as tsv
vic_lang <- dplyr::filter(region_lang, region == "Victoria") %>%
    dplyr::select(-region)
readr::write_tsv(vic_lang, here::here("inst", "extdata", "victoria_lang.tsv"))

# Kelowna as a csv2 file with meta data in header and footer
kel_lang <- dplyr::filter(region_lang, region == "Kelowna") %>%
    dplyr::select(-region)
fileConn <- file(here::here("inst", "extdata", "kelowna_lang.csv"))
writeLines(c('Source: Statistics Canada, Census of Population, 2016. Reproduced and distributed
             on an “as is” basis with the permission of Statistics Canada.',
             'Data set contains the counts of how many Kelowna residents report each
             language as their mother tongue, which language they speak most often at
             home, which language they use most often at work, and which language they
             have knowledge for.'), fileConn)
close(fileConn)
write_csv2(kel_lang, here::here("inst", "extdata",
                                  "kelowna_lang.csv"),
          append = TRUE)
write('R package URL: https://ttimbers.github.io/canlang/',
      file= here::here("inst", "extdata", "kelowna_lang.csv"),
      append=TRUE)

## Abbotsford as an excel file with column names in sheet 1, no column names in sheet 2
abbotsford_lang <- dplyr::filter(region_lang, region == "Abbotsford - Mission") %>%
    dplyr::select(-region)
abbotsford_wb <- createWorkbook()

addWorksheet(abbotsford_wb, "Column names")
writeData(abbotsford_wb, sheet = "Column names", x = colnames(abbotsford_lang),
          colNames = FALSE)

addWorksheet(abbotsford_wb, "data")
writeData(abbotsford_wb, sheet = "data", x = abbotsford_lang)

saveWorkbook(abbotsford_wb, here::here("inst", "extdata",
                                     "abbotsford_lang.xlsx"),
             overwrite = TRUE)

## Calgary as a plain vanilla csv
cal_lang <- dplyr::filter(region_lang, region == "Calgary") %>%
    dplyr::select(-region)
readr::write_csv(cal_lang, here::here("inst", "extdata", "calgary_lang.csv"))

## Edmonton as an excel file with one sheet
ed_lang <- dplyr::filter(region_lang, region == "Edmonton") %>%
    dplyr::select(-region)
ed_wb <- createWorkbook()

addWorksheet(ed_wb, "Sheet1")
writeData(ed_wb, sheet = "Sheet1", x = colnames(ed_lang))

saveWorkbook(ed_wb, here::here("inst", "extdata",
                                     "edmonton_lang.xlsx"),
             overwrite = TRUE)
