
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
#>                 language count
#> 1              Afrikaans 10260
#> 2             Akan (Twi) 13460
#> 3               Albanian 26895
#> 4              Algonquin  1260
#> 5 American Sign Language  2685
#> 6                Amharic 22465
```

The data set `lang_spoken_at_home` lists the counts of how many
Canadians report each language as the language they speak most often at
home. This data was recorded in the 2016 Census:

``` r
library(canlang)
head(lang_spoken_at_home)
#>                 language count
#> 1              Afrikaans  4785
#> 2             Akan (Twi)  5985
#> 3               Albanian 13135
#> 4              Algonquin   370
#> 5 American Sign Language  3020
#> 6                Amharic 12785
```
