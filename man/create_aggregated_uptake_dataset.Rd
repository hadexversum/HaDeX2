% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_aggregated_uptake_dataset.R
\name{create_aggregated_uptake_dataset}
\alias{create_aggregated_uptake_dataset}
\title{Calculates the aggregated uptake for peptide pool}
\usage{
create_aggregated_uptake_dataset(kin_dat)
}
\arguments{
\item{kin_dat}{single state uptake data, product of e.q.
\code{\link{create_uptake_dataset}}}
}
\value{
a \code{\link{data.frame}} object
}
\description{
This is a wrapper function for \code{\link{calculate_aggregated_uptake}},
which calculates aggregated uptake for only
one time point. This function returns values for all 
time points from `kin_dat`.
}
\examples{
kin_dat <- create_uptake_dataset(alpha_dat, states = "Alpha_KSCN")
create_aggregated_uptake_dataset(kin_dat)

}
