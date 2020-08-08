
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

The data set `mother_tongue` lists the count of mother tongue of all
Canadians recorded in the 2016 Census:

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
