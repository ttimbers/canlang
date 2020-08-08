
<!-- README.md is generated from README.Rmd. Please edit that file -->

# canlang

<!-- badges: start -->

<!-- badges: end -->

The goal of canlang is to easily share language data collected in the
2016 Canadian census.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("ttimbers/canlang")
```

## Example

The data set `mother_tongue` lists the counts of how many Canadians
report each language as their mother tongue. This data was recorded in
the 2016 Census:

``` r
library(canlang)
head(mother_tongue)
#>            mother_tongue  count
#> 1              Afrikaans  10260
#> 2             Akan (Twi)  13460
#> 3               Albanian  26895
#> 4 American Sign Language   2685
#> 5                Amharic  22465
#> 6                 Arabic 419890
```

The data set `lang_spoken_at_home` lists the counts of how many
Canadians report each language as the language they speak most often at
home. This data was recorded in the 2016 Census:

``` r
library(canlang)
head(lang_spoken_at_home)
#>          mother_tongue    count
#> 1              English 22162865
#> 2               French  6943800
#> 3   Official languages 29106665
#> 4 Aboriginal languages   118470
#> 5            Algonquin      370
#> 6            Atikamekw     5465
```
