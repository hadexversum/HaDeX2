#' Uncertainty of the peptide measurements 
#'
#' @description Plot the uncertainty of the mass measurements - 
#' for aggregated data or before aggregation - to see if there is 
#' a region with uncertainty higher than acceptable
#' 
#' @param dat data imported by the \code{\link{read_hdx}} function
#' @param protein selected protein
#' @param state selected biological state for given protein
#' @param skip_amino \code{integer}, indicator how many aminos from the N-terminus 
#' should be omitted
#' @param aggregated \code{logical}, indicator if presented
#' data is aggregated on replicate level
#' @param separate_times \code{logical}, indicator if the 
#' values for different time points are presented separately
#' @param show_threshold \code{logical}, indicator if the 
#' threshold of significance is shown
#' 
#' @details The function \code{\link{plot_uncertainty}} generates 
#' a plot of uncertainty of mass measurement of each peptide from
#' selected protein in selected biological state. The values can be presented 
#' in two ways: as aggregated values for each replicate, or before
#' aggregation - measured values for charge values within a replicate.
#' On X-axis there is a position in a sequence, with length of a segment 
#' of each peptide representing its length. On Y-axis there 
#' is uncertainty of the measurement in Daltons.
#' The threshold is set to 1 Da, as this value is associated with exchange.
#' 
#' @return a \code{\link{ggplot}} object
#' 
#' @seealso
#' \code{\link{read_hdx}}
#' \code{\link{calculate_exp_masses}} 
#'  
#' @examples
#' plot_uncertainty(alpha_dat)
#' plot_uncertainty(alpha_dat, aggregated = FALSE)
#' plot_uncertainty(alpha_dat, aggregated = FALSE, separate_times = FALSE)
#' plot_uncertainty(alpha_dat, skip_amino = 1)
#'
#' @export plot_uncertainty 

plot_uncertainty <- function(dat, 
                             protein = dat[["Protein"]][1],
                             state = dat[["State"]][1],
                             skip_amino = 0,
                             aggregated = TRUE,
                             separate_times = TRUE, 
                             show_threshold = TRUE,
                             interactive = getOption("hadex_use_interactive_plots")){

  dat <- as.data.table(dat)
  
  dat <- dat[Protein == protein & State == state]
  
  if(skip_amino > 0) { dat[, Start := Start + skip_amino] } 
  
  if(aggregated){
    
    plot_dat <- calculate_exp_masses(dat) 
    
  } else {
    
    ## TODO:: write tests
    
    plot_dat <- dat[, exp_mass := Center*z - z*1.00727647 ] 
    plot_dat <- plot_dat[, !c("Inten", "Center",  "MaxUptake", "z"), with = FALSE]
    plot_dat <- plot_dat[, err_avg_mass := sd(exp_mass), by = c("Protein", "Sequence", "Start", "End", "MHP", "State", "Exposure") ]
    plot_dat <- plot_dat[, !"exp_mass", with = FALSE]
    unique(plot_dat)

    }
  
  chosen_geom_segment <- if (interactive) ggiraph::geom_segment_interactive( 
    aes(tooltip = glue(
      "{Sequence}
       Position: {Start}-{End}
       Value: {round(err_avg_mass, 2)}"
    ))) 
  else geom_segment()
  
  uncertainty_plot <- ggplot(plot_dat, aes(x = Start, xend = End, y = err_avg_mass, yend = err_avg_mass, color = as.factor(Exposure))) +
    chosen_geom_segment +
    labs(x = "Peptide position",
         y = "Uncertainy(mass)",
         color = "Exposure") +
    theme(legend.position = "bottom")
  
  if(show_threshold){
    
    uncertainty_plot <- uncertainty_plot + 
      geom_hline(yintercept = 1, linetype = "dashed", size = 0.5,  color = "red", alpha = 0.5) 
  }
  
  if(separate_times){
    
    uncertainty_plot <- uncertainty_plot + 
      facet_wrap(~ Exposure) 
  }
  
  return(HaDeXify(uncertainty_plot))

  }