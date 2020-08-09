
<!-- README.md is generated from README.Rmd. Please edit that file -->

# canlang

<!-- badges: start -->

<!-- badges: end -->

The goal of {canlang} is to easily share language data collected in the
2016 Canadian census. This data was retreived from the 2016 Canadian
census data set using the
{[cancensus](https://mountainmath.github.io/cancensus/index.html)} R
package.

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
often at home, which language they use most often at work, and which
language they have knowledge for. This data was recorded in the 2016
Census:

``` r
library(canlang)
head(can_lang)
#>                 language mother_tongue most_at_home most_at_work lang_known
#> 1              Afrikaans         10260         4785           85      23415
#> 2             Akan (Twi)         13460         5985           25      22150
#> 3               Albanian         26895        13135          345      31930
#> 4              Algonquin          1260          370           40       2480
#> 5 American Sign Language          2685         3020         1145      21930
#> 6                Amharic         22465        12785          200      33670
```

## References

von Bergmann, J., Aaron Jacobs, Dmitry Shkolnik (2020). cancensus: R
package to access, retrieve, and work with Canadian Census data and
geography. v0.3.2.
