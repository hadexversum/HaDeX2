#' Create differential dataset with statistical validity
#'
#' @param p_diff_uptake_dat differential uptake data 
#' alongside the P-value as calculated by 
#' \code{\link{create_p_diff_uptake_dataset}}
#' @param houde_interval interval value, as calculated by
#' \code{\link{calculate_confidence_limit_values}}
#' @param houde_interval_times specified time points to 
#' be used in calculcation
#' @param theoretical \code{logical}, determines if values are theoretical
#' @param fractional \code{logical}, determines if values are fractional
#' 
#' @details Function provides additional information 
#' on statistical relevance based on supplied data.
#' 
#' @return a \code{\link{data.frame}} object. 
#' 
#' @seealso 
#' \code{\link{read_hdx}}
#' \code{\link{create_p_diff_uptake_dataset}}
#' \code{\link{calculate_confidence_limit_values}}
#' 
#' @examples
#' p_diff_uptake_dat <- create_p_diff_uptake_dataset(alpha_dat)
#' p_diff_uptake_dat_confidence <- create_p_diff_uptake_dataset_with_confidence(p_diff_uptake_dat)
#' head(p_diff_uptake_dat_confidence)
#'
#' @export create_p_diff_uptake_dataset_with_confidence

create_p_diff_uptake_dataset_with_confidence <- function(p_diff_uptake_dat,
                                                         houde_interval = NULL,
                                                         houde_interval_times = NULL,
                                                         theoretical = FALSE, 
                                                         fractional = FALSE){
  
  confidence_level = attr(p_diff_uptake_dat, "confidence_level")
  
  p_diff_uptake_dat <- as.data.table(p_diff_uptake_dat)
  
  if(is.null(houde_interval)){
    
    if(is.null(houde_interval_times)){ houde_interval_times <- unique(p_diff_uptake_dat[["Exposure"]]) }
    
    
    houde_interval <- calculate_confidence_limit_values(diff_uptake_dat = p_diff_uptake_dat[Exposure %in% houde_interval_times, ], 
                                                        confidence_level = confidence_level,
                                                        theoretical = theoretical, 
                                                        fractional = fractional)
  }
  
  value <- fcase(
    theoretical & fractional, "diff_theo_frac_deut_uptake",
    theoretical & !(fractional),  "diff_theo_deut_uptake",
    !(theoretical) & fractional,  "diff_frac_deut_uptake",
    !(theoretical) & !(fractional),  "diff_deut_uptake"
  )
  
  alpha <- -log(1 - confidence_level)
  
  p_diff_uptake_dat[["valid"]] <- p_diff_uptake_dat[["log_p_value"]] > alpha & abs(p_diff_uptake_dat[[value]]) > houde_interval[2]
  
  attr(p_diff_uptake_dat, "houde_interval") <- houde_interval
  attr(p_diff_uptake_dat, "houde_interval_times") <- houde_interval_times
  attr(p_diff_uptake_dat, "theoretical") <- theoretical
  attr(p_diff_uptake_dat, "fractional") <- fractional
  attr(p_diff_uptake_dat, "has_modification") <- attr(p_diff_uptake_dat, "has_modification") 
  
  p_diff_uptake_dat <- as.data.frame(p_diff_uptake_dat)
  
  return(p_diff_uptake_dat)
  
}