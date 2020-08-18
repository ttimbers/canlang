#' Region-level non-language data collected from the 2016 Canadian Census.
#'
#' For each census division, `region_data` lists the statistics for number of households, land area, population and number of dwellings.
#'
#' @format A tibble with 35 rows and 5 variables:
#' \describe{
#'   \item{region}{Canadian census metropolitan area (CMA)}
#'   \item{households}{Number of households in the CMA.}
#'   \item{area}{CMA land area in square kilometres.}
#'   \item{population}{CMA population.}
#'   \item{dwellings}{Number of dwellings in the CMA.}
#' }
#' @source {Source: Statistics Canada, Census of Population, 2016. Reproduced and distributed on an "as is" basis with the permission of Statistics Canada.}
"region_data"
