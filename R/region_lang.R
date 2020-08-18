#' Region-level language data collected from the 2016 Canadian Census.
#'
#' For each census division, `region_lang` lists the counts of how many Canadians report each language as their mother tongue,
#' which language they speak most often at home, which language they use most often at work, and
#' which language they have knowledge for. This data was recorded in the 2016 Canadian Census.
#'
#' @format A tibble with 785395 rows and 7 variables:
#' \describe{
#'   \item{region}{Canadian census metropolitan area (CMA)}
#'   \item{category}{Higher level language category, describing whether the language is an Official Canadian language (e.g., English or French), an Aboriginal language, or a Non-Official and Non-Aboriginal language.}
#'   \item{language}{Language queried about on the Canadian Census. Note: n.i.e. means Not included elsewhere, and n.o.s. means Not otherwise specified}
#'   \item{mother_tongue}{Total Count of Canadians from the Census who reported the language as their mother tongue (excluding institutional residents - 100% data). Mother tongue is generally defined as the language someone was exposed to since birth.}
#'   \item{most_at_home}{Total Count of Canadians from the Census who reported the language as spoken most often at home (excluding institutional residents - 100% data).}
#'   \item{most_at_work}{Total Count of Canadians from the Census who reported the language as used most often at work for the population in private households aged 15 years and over who worked since January 1, 2015 (25% sample data).}
#'   \item{lang_known}{Total Count of Canadians from the Census who reported knowledge of language for the population in private households (25% sample data).}
#' }
#' @source {Source: Statistics Canada, Census of Population, 2016. Reproduced and distributed on an "as is" basis with the permission of Statistics Canada.}
"region_lang"
