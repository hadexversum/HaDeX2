% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calculate_aggregated_difference.R
\name{calculate_aggregated_diff_uptake}
\alias{calculate_aggregated_diff_uptake}
\title{Calculates aggregated deuterium uptake difference for one time point}
\usage{
calculate_aggregated_diff_uptake(diff_uptake_dat, time_t)
}
\arguments{
\item{diff_uptake_dat}{...}

\item{time_t}{...}
}
\description{
Calculates aggregated deuterium uptake difference for one time point
}
\examples{
diff_uptake_dat <- create_diff_uptake_dataset(alpha_dat)
calculate_aggregated_diff_uptake(diff_uptake_dat, time_t = 5)

}
