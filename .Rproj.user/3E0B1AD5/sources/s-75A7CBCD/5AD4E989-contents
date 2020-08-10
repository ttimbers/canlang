#' Get census language data at the Canadian level in a tidy format.
#'
#' @param dataset character vector of the data set name (e.g., "CA16")
#' @param query_vector character vector of vector from which to retrieve the data (e.g., "v_CA16_815")
#'
#' @return a tidy data frame of language data at the Canadian level
#' @export
#'
#' @examples
#' \dontrun{
#' library(canlang)
#' options(cancensus.api_key = "your_api_key")
#' language_data("CA16", "v_CA16_815")
#' }
get_language_data <- function(dataset, query_vector, region_level = "C") {
    langs <- cancensus::list_census_vectors(dataset) %>%
        dplyr::filter(vector == query_vector)

    langs_children <- langs %>%
        cancensus::child_census_vectors(TRUE)

    langs_vectors <- dplyr::bind_rows(langs, langs_children) %>%
        dplyr::pull(vector)

    region <- cancensus::list_census_regions(dataset, use_cache = FALSE) %>%
        dplyr::filter(level == region_level) %>%
        cancensus::as_census_region_list()

    language <- cancensus::get_census(dataset = dataset,
                                regions = region,
                                vectors = langs_vectors,
                                level = region_level) %>%
        dplyr::select(-GeoUID, -`Region Name`, -Households, -Type, -`Area (sq km)`, -Population, -Dwellings) %>%
        tidyr::pivot_longer(everything(), names_to = "language", values_to = "count") %>%
        tidyr::separate(language, into = c("junk", "language"), sep = ": ") %>%
        dplyr::arrange(language) %>%
        dplyr::select(-junk) %>%
        dplyr::filter(!language == "Aboriginal languages", !language == "Official languages")
}
