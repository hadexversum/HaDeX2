% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/prepare_hdxviewer_export.R
\name{prepare_hdxviewer_export}
\alias{prepare_hdxviewer_export}
\title{Prepares data export for HDX-Viewer}
\usage{
prepare_hdxviewer_export(
  x_dat,
  differential = FALSE,
  fractional = TRUE,
  theoretical = FALSE,
  download = FALSE
)
}
\arguments{
\item{x_dat}{one state detuerium uptake data or differentail uptake data}

\item{differential}{indicator of x_dat type}

\item{fractional}{indicator if fractional values are used}

\item{theoretical}{indicator if theoretical values are used}

\item{download}{indicator if the result should be downloaded}
}
\description{
Prepares data export for HDX-Viewer
}
\examples{
kin_dat <- create_uptake_dataset(alpha_dat, states = "Alpha_KSCN" )
aggregated_dat <- create_aggregated_uptake_dataset(kin_dat)
diff_uptake_dat <- create_diff_uptake_dataset(alpha_dat)
diff_aggregated_dat <- create_aggregated_diff_uptake_dataset(diff_uptake_dat)
prepare_hdxviewer_export(aggregated_dat, differential = F)
prepare_hdxviewer_export(aggregated_dat, differential = T) # shouldnt work
prepare_hdxviewer_export(diff_aggregated_dat, differential = T)
prepare_hdxviewer_export(aggregated_dat, differential = F, download = T)

}
