% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_manhattan.R
\name{plot_manhattan}
\alias{plot_manhattan}
\title{Manhattan plot}
\usage{
plot_manhattan(
  p_dat,
  skip_amino = 0,
  plot_title = NULL,
  separate_times = TRUE,
  times = NULL,
  confidence_level = NULL,
  show_confidence_limit = TRUE,
  show_peptide_position = FALSE,
  interactive = getOption("hadex_use_interactive_plots")
)
}
\arguments{
\item{p_dat}{data produced by the \code{\link{create_p_diff_uptake_dataset}}
function.}

\item{skip_amino}{\code{integer}, indicator how many aminos from the N-terminus 
should be omitted}

\item{plot_title}{title for the plot. If not provided, it is constructed in a form:
"Differences between state_1 and state_2"}

\item{separate_times}{\code{logical}, indicates if the data should be seen on the same plot, 
or on separate plots for each time point of measurement.}

\item{times}{vector of time points of measurements to be included in the plot.}

\item{confidence_level}{confidence level for the test, from range [0, 1].}

\item{show_confidence_limit}{logical, indicates if the hybrid testing
confidence intervals are shown.}

\item{show_peptide_position}{\code{logical}, indicates if the peptide length
and position in  the  sequence is shown. Otherwise, the peptides are represented by their ID.}

\item{interactive}{\code{logical}, whether plot should have an interactive 
layer created with with ggiraph, which would add tooltips to the plot in an
interactive display (HTML/Markdown documents or shiny app).}
}
\value{
a \code{\link{ggplot}} object.
}
\description{
Manhattan plot with p-values from the t-Student test
and peptide position.
}
\details{
The manhattan plot presents the P-values from t-student test, to see 
the regions of the protein with statistically significant changes between two 
biological states. 
On X-axis there is a position in a sequence, with length of a segment of each
peptide representing its length. On Y-axis there is P-value from t-Student test.
}
\examples{
p_dat <- create_p_diff_uptake_dataset(alpha_dat)
plot_manhattan(p_dat)
plot_manhattan(p_dat, separate_times = FALSE)
plot_manhattan(p_dat, show_peptide_position = TRUE, separate_times = FALSE)
plot_manhattan(p_dat, separate_times = FALSE, show_confidence_limit = FALSE)
 
}
\references{
Hageman, T. S. & Weis, D. D. Reliable Identification of Significant
Differences in Differential Hydrogen Exchange-Mass Spectrometry Measurements
Using a Hybrid Significance Testing Approach. Anal Chem 91, 8008–8016 (2019).
}
\seealso{
\code{\link{read_hdx}}
\code{\link{create_p_diff_uptake_dataset}}
}
