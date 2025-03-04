% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calculate_aggregated_uptake.R
\name{calculate_aggregated_uptake}
\alias{calculate_aggregated_uptake}
\title{Calculates aggregated deuterium uptake for one time point}
\usage{
calculate_aggregated_uptake(
  kin_dat,
  state = unique(kin_dat[["State"]])[1],
  time_t
)
}
\arguments{
\item{kin_dat}{...}

\item{state}{...}

\item{time_t}{...}
}
\description{
Calculates aggregated deuterium uptake for one time point
}
\examples{
dat <- read_hdx(system.file(package = "HaDeX", "HaDeX/data/KD_180110_CD160_HVEM.csv"))
kin_dat <- create_uptake_dataset(alpha_dat, states = "Alpha_KSCN")
create_aggregated_uptake_dataset(kin_dat)

}
