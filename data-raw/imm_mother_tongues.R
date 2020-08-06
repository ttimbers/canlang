## code to prepare `imm_mother_tongue` dataset goes here
library(cancensus)
library(stringr)
library(dplyr)

# code sourced from: https://www.dshkol.com/2017/language-diversity-in-canada/

dataset <- "CA16"

non_off_langs <- list_census_vectors(dataset) %>%
    filter(vector == "v_CA16_815")

non_off_langs_children <- non_off_langs %>%
    child_census_vectors(TRUE)

non_off_langs_vectors <- bind_rows(non_off_langs, non_off_langs_children) %>%
    pull(vector)

region <- list_census_regions(dataset, use_cache = FALSE) %>%
    filter(level=="C") %>%
    as_census_region_list

census_data <- get_census(dataset='CA16',
                          regions=region,
                          vectors=non_off_langs_vectors,
                          level='C', use_cache = FALSE)




usethis::use_data(imm_mother_tongue, overwrite = TRUE)
