% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calculate_back_exchange.R
\name{calculate_back_exchange}
\alias{calculate_back_exchange}
\title{Back exchange estimation}
\usage{
calculate_back_exchange(
  dat,
  protein = dat[["Protein"]][1],
  states = unique(dat[["State"]]),
  time_100 = max(dat[["Exposure"]])
)
}
\arguments{
\item{dat}{data imported by the \code{\link{read_hdx}} function}

\item{protein}{selected protein}

\item{states}{selected biological states for given protein}

\item{time_100}{time point of measurement for fully 
deuterated sample}
}
\value{
a \code{\link{data.frame}} object
}
\description{
...
}
\details{
...
}
\examples{
calculate_back_exchange(alpha_dat)

}
\seealso{
\code{\link{read_hdx}}
}
