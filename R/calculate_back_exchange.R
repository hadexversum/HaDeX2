#' Back exchange estimation
#'
#' @description Calculates back-exchange for a state
#' 
#' @param dat data imported by the \code{\link{read_hdx}} function
#' @param protein selected protein
#' @param states selected biological states for given protein
#' @param time_100 time point of measurement for fully 
#' deuterated sample
#'
#' @details Back-exchange is a reverse exchange phenomenon, important 
#' to acknowledge when working with HDX data. This function calculates
#' back-exchange values for one biological state of the selected protein.
#' For visualization of back-exchange data use \code{\link{plot_coverage_heatmap}}
#' with displayed value specified as `back-exchange`.
#' For the definition of back-exchange see the `vignette("datafiles")`.
#' 
#'
#' @return a \code{\link{data.frame}} object
#' 
#' @seealso 
#' \code{\link{read_hdx}}
#' \code{\link{plot_coverage_heatmap}}
#' 
#' @examples 
#' head(calculate_back_exchange(alpha_dat))
#' 
#' @export calculate_back_exchange

calculate_back_exchange <- function(dat, 
                                    protein = dat[["Protein"]][1],
                                    states = unique(dat[["State"]]),
                                    time_100 = max(dat[["Exposure"]])){
  
  dat <- as.data.table(dat)
  
  dat <- dat[Protein == protein & State %in% states]
  
  uptake_dat <- as.data.table(create_uptake_dataset(dat))
  
  uptake_dat <- uptake_dat[Exposure == time_100, .(Protein, Start, End, State, Sequence, Modification, theo_frac_deut_uptake, err_theo_frac_deut_uptake)]
  
  bex_dat <-  uptake_dat[, `:=`(back_exchange = (100 - theo_frac_deut_uptake),
                                err_back_exchange = err_theo_frac_deut_uptake)]
  
  bex_dat <- bex_dat[, .(Protein, Start, End, State, Sequence, Modification, back_exchange, err_back_exchange)]

  bex_dat <- as.data.frame(bex_dat)
  
  return(bex_dat)
  
}
