## code to prepare `imm_mother_tongue` dataset goes here
library(cancensus)
library(stringr)
library(dplyr)

# code sourced from: https://www.dshkol.com/2017/language-diversity-in-canada/

vectors <- list_census_vectors("CA16") %>% filter(str_detect(details, "Mother"))
example <- vectors %>%
    slice(1)
example$details
mandarin <- vectors %>% filter(str_detect(details, "Mandarin"))
punjabi <- vectors %>% filter(str_detect(details, "Punjabi"))

regions_list10 <- list_census_regions(dataset) %>%
    filter(level=="CMA") %>%
    top_n(10,pop) %>%
    as_census_region_list

census_data <- get_census(dataset='CA16',
                          regions=regions_list10,
                          vectors=c("v_CA16_1259", "v_CA16_1259"),
                          level='CMA')



usethis::use_data(imm_mother_tongue, overwrite = TRUE)
