% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getters.R
\name{get_peptide_sequence}
\alias{get_peptide_sequence}
\title{Get peptide sequence based on the position}
\usage{
get_peptide_sequence(
  dat,
  protein = dat[["Protein"]][1],
  start,
  end,
  modification = FALSE
)
}
\arguments{
\item{dat}{any data frame that contains following information:
protein, sequence, start, end, modification.}

\item{protein}{chosen protein.}

\item{start}{start position of the peptide of interest.}

\item{end}{end position of the peptide of interest.}

\item{modification}{logical value to indicate if peptide
of interest has modification or not.}
}
\value{
a \code{\link{character}} value.
}
\description{
Gets the peptide sequence based on selected parameters
(start and end position, modification).
}
\details{
Function returns peptide sequence for selected parameters. 
Peptide sequence is often required to properly identify peptide of 
interest, and to avoid mistakes sequence is returned by the function.
Moreover, function uses the modification value to select petide sequence.
}
\examples{
get_peptide_sequence(alpha_dat, start = 1, end = 11)

}
\seealso{
\code{\link{read_hdx}}
}
