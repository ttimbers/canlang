#' Get the languages that are children of a parent vector
#'
#' @param dataset character vector of the data set name (e.g., "CA16")
#' @param query_vector character vector of parent vector from which to retrieve child languages (e.g., "v_CA16_815")
#'
#' @return a tidy data frame with two columns: 1) parent vector label, and 2) child languages
#' @export
#'
#' @examples
#' library(canlang)
#' options(cancensus.api_key = "your_api_key")
#' get_child_langs("CA16", "v_CA16_566")
get_child_langs <- function(dataset, query_vector) {
    lang_cat <- get_language_data(dataset, query_vector) %>%
        select(language)

    category <- cancensus::list_census_vectors(dataset) %>%
        dplyr::filter(vector == query_vector) %>%
        select(label) %>%
        pull()

    lang_cat <- lang_cat %>%
        mutate(category = category)
}
