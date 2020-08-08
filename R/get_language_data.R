#' Get census language data at the Canadian level in a tidy format.
#'
#' @param dataset character vector of the data set name (e.g., "CA16")
#' @param query_vector character vector of vector from which to retrieve the data (e.g., "v_CA16_815")
#'
#' @return a tidy data frame of language data at the Canadian level
#' @export
#'
#' @examples
#'\dontrun{
#' library(canlang)
#' options(cancensus.api_key = "your_api_key")
#' language_data("CA16", "v_CA16_815")
#' }
get_language_data <- function(dataset, query_vector) {
    langs <- list_census_vectors(dataset) %>%
        filter(vector == query_vector)

    langs_children <- langs %>%
        child_census_vectors(TRUE)

    langs_vectors <- bind_rows(langs, langs_children) %>%
        pull(vector)

    region <- list_census_regions(dataset, use_cache = FALSE) %>%
        filter(level == "C") %>%
        as_census_region_list

    mother_tongue <- get_census(dataset = dataset,
                                regions = region,
                                vectors = langs_vectors,
                                level = "C") %>%
        select(-GeoUID, -`Region Name`, -Households, -Type, -`Area (sq km)`, -Population, -Dwellings) %>%
        pivot_longer(everything(), names_to = "mother_tongue", values_to = "count") %>%
        separate(mother_tongue, into = c("junk", "mother_tongue"), sep = ": ") %>%
        arrange(mother_tongue) %>%
        select(-junk) %>%
        filter(!str_detect(mother_tongue,"n.i.e|n.o.s"))
}
