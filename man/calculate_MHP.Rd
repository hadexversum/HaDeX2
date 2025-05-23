% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calculate_masses.R
\name{calculate_MHP}
\alias{calculate_MHP}
\title{Calculate MHP of the peptide}
\usage{
calculate_MHP(Sequence, mono = FALSE)
}
\arguments{
\item{Sequence}{sequence of the peptide (string) or vector of sequences. Each letter 
of the sequence of the peptide represents different amino acid (three letter 
representation not allowed)}

\item{mono}{logical value to determine if the mass should be monoisotopic or not. 
FALSE by default}
}
\value{
vector of numeric MHP values of provided Sequences
}
\description{
Calculate the mass of the singly charged monoisotopic (or not) 
molecular ion of for given peptide.
}
\details{
This function calculates the mass of the singly charged monoisotopic (or not)
molecular ion for given peptide. It is the sum of the residue masses plus the masses
of the terminationg group (H and OH). The source of the masses can be found here:
\url{http://www.matrixscience.com/help/aa_help.html}. Keep in mind that this function
returns the value of an unmodified peptide.
}
\examples{
calculate_MHP("CHERICHERILADY")
calculate_MHP("CHERICHERILADY", mono = TRUE)

}
\seealso{
\code{\link{read_hdx}} 
\code{\link{calculate_state_uptake}}
}
