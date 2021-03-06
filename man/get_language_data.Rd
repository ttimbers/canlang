% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_language_data.R
\name{get_language_data}
\alias{get_language_data}
\title{Get census language data from the Canadian level in a tidy format.}
\usage{
get_language_data(dataset, query_vector, region_level = "C")
}
\arguments{
\item{dataset}{character vector of the data set name (e.g., "CA16")}

\item{query_vector}{character vector of vector from which to retrieve the data (e.g., "v_CA16_815")}

\item{region_level}{character vector of which region to aggregate by. Default is "C" for Canada level.}
}
\value{
a tidy data frame of language data at the Canadian level
}
\description{
Get census language data from the Canadian level in a tidy format.
}
\examples{
\dontrun{
library(canlang)
options(cancensus.api_key = "your_api_key")
get_language_data("CA16", "v_CA16_815")
}
}
