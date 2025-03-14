#' Calculates aggregated uptake difference for peptide pool
#'
#' @param diff_uptake_dat differential uptake data, 
#' product of e.q. \code{\link{create_diff_uptake_dataset}}
#' 
#' @description
#' This is a wrapper function for \code{\link{calculate_aggregated_diff_uptake}},
#' which calculates aggregated differential uptake for only
#' one time point. This function returns values for all 
#' time points from `diff_uptake_dat`.
#' 
#' @return a \code{\link{data.frame}} object
#'
#' @examples
#' diff_uptake_dat <- create_diff_uptake_dataset(alpha_dat)
#' head(reate_aggregated_diff_uptake_dataset(diff_uptake_dat))
#'
#' @export

create_aggregated_diff_uptake_dataset <- function(diff_uptake_dat){

  diff_uptake_dat <- as.data.table(diff_uptake_dat)
  times <- unique(diff_uptake_dat[["Exposure"]])

  diff_uptake_dataset <- lapply(times, function(time){

    diff_uc_t <- calculate_aggregated_diff_uptake(diff_uptake_dat,
                                                  time_t = time)
  }) %>% bind_rows()

  return(diff_uptake_dataset)
}
