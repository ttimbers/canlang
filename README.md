
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

The data set `can_lang` lists the counts of how many Canadians report
each language as their mother tongue, which language they speak most
often at home, whick language they use most often at work, and which
language they have knowledge for. This data was recorded in the 2016
Census:

``` r
library(canlang)
head(can_lang)
#>                 language mother_tongue spoken_most_often_at_home
#> 1              Afrikaans         10260                      4785
#> 2             Akan (Twi)         13460                      5985
#> 3               Albanian         26895                     13135
#> 4              Algonquin          1260                       370
#> 5 American Sign Language          2685                      3020
#> 6                Amharic         22465                     12785
```
