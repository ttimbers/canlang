## code to prepare `region_data` dataset goes here
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

# Region dataa- -----------------------------------------------------------

region_data <- get_region_data("CA16", "v_CA16_563", region_level = "CMA") %>%
    rename(region = `Region Name`) %>%
    mutate(region = str_replace(region, " \\(B\\)", ""))

# Write data --------------------------------------------------------------

usethis::use_data(region_data, overwrite = TRUE)
