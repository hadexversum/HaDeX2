#' Plot differential uptake curve
#' 
#' @description Differential uptake curve for one peptide
#' between two biological states.  
#' 
#' @param diff_uptake_dat produced by \code{\link{create_diff_uptake_dataset}} function
#' @param sequence sequence of chosen peptide.
#' @param theoretical \code{logical}, determines if plot shows theoretical values.
#' @param fractional \code{logical}, determines if plot shows fractional values.
#' @param uncertainty_type type of presenting uncertainty, possible values:
#' "ribbon", "bars" or "bars + line".
#' @param log_x \code{logical}, determines if x axis shows logarithmic values.
#' @param show_houde_interval \code{logical}, determines if houde interval is shown.
#' @param show_tstud_confidence \code{logical}, determines if t-Student test validity 
#' is shown.
#' @inheritParams plot_butterfly
#' 
#' @details This plot shows the differential deuterium uptake between two biological 
#' states for selected peptides in different time points.
#' The possibility to plot multiple differences (between state and mutant) for the peptide
#' will be added soon.
#' 
#' @return a \code{\link{ggplot}} object.
#' 
#' @seealso 
#' \code{\link{read_hdx}}
#' \code{\link{create_diff_uptake_dataset}}
#' 
#' @examples 
#' diff_uptake_dat <- create_diff_uptake_dataset(alpha_dat)
#' plot_differential_uptake_curve(diff_uptake_dat = diff_uptake_dat, sequence = "GDLKSPAGL")
#' 
#' diff_p_uptake_dat <- create_p_diff_uptake_dataset(alpha_dat)
#' plot_differential_uptake_curve(diff_p_uptake_dat = diff_p_uptake_dat, sequence = "GDLKSPAGL", show_houde_interval = TRUE)
#' plot_differential_uptake_curve(diff_p_uptake_dat = diff_p_uptake_dat, sequence = "GDLKSPAGL", show_houde_interval = TRUE, show_tstud_confidence = TRUE)
#' plot_differential_uptake_curve(diff_p_uptake_dat = diff_p_uptake_dat, sequence = "GDLKSPAGL", show_tstud_confidence = TRUE)
#' 
#' @export plot_differential_uptake_curve

plot_differential_uptake_curve <- function(diff_uptake_dat = NULL,
                                           diff_p_uptake_dat = NULL,
                                           sequence = NULL,
                                           theoretical = FALSE,
                                           fractional = FALSE,
                                           uncertainty_type = "ribbon",
                                           log_x = TRUE,
                                           show_houde_interval = FALSE,
                                           show_tstud_confidence = FALSE,
                                           interactive = getOption("hadex_use_interactive_plots")){
  
  
  uncertainty_type <- match.arg(uncertainty_type, c("ribbon", "bars", "bars + line"))
  
  ##
  
  if (show_tstud_confidence) {
    
    if(is.null(diff_p_uptake_dat)) { stop("Please, provide the neccessary data.") } else { diff_uptake_dat <-  diff_p_uptake_dat }
    
  } else {
    
    if(is.null(diff_uptake_dat) & is.null(diff_p_uptake_dat)) { stop("Please, provide the neccessary data.") } else  { 
      
      if(is.null(diff_uptake_dat)) {diff_uptake_dat <- diff_p_uptake_dat } else {
        
        diff_uptake_dat <- diff_uptake_dat
        
      }
      
    }
    
  }
  ### as.data.table
  diff_uptake_dat <- as.data.table(diff_uptake_dat)
  
  diff_uptake_dat <- diff_uptake_dat[Sequence == sequence]
  
  
  
  if(is.null(sequence)){ sequence <- diff_uptake_dat[["Sequence"]][1] }
  
  states <- paste0(attr(diff_uptake_dat, "state_1"), "-", attr(diff_uptake_dat, "state_2"))
  
  diff_uptake_dat <- diff_uptake_dat[Exposure < 99999]
  
  
  ##
  
  if (theoretical){
    
    title <- "Theoretical differential uptake curve"
    
    if (fractional){
      
      value <- "diff_theo_frac_deut_uptake"
      err_value <- "err_diff_theo_frac_deut_uptake"
      y_label <- "Fractional differential uptake [%]"
      
    } else {
      
      value <- "diff_theo_deut_uptake"
      err_value <- "err_diff_theo_deut_uptake"
      y_label <- "Differential uptake [Da]"
      
    }
    
  } else {
    
    title <- "Differential uptake curve"
    
    if (fractional){
      
      value <- "diff_frac_deut_uptake"
      err_value <- "err_diff_frac_deut_uptake"
      y_label <- "Fractional differential uptake [%]"
      
    } else {
      
      value <- "diff_deut_uptake"
      err_value <- "err_diff_deut_uptake"
      y_label <- "Differential uptake [Da]"
      
    }
    
  }
  
  plot_dat <- data.table(Sequence = diff_uptake_dat[["Sequence"]],
                         Start = diff_uptake_dat[["Start"]],
                         End = diff_uptake_dat[["End"]],
                         Exposure = diff_uptake_dat[["Exposure"]],
                         value = diff_uptake_dat[[value]],
                         err_value = diff_uptake_dat[[err_value]])
  
  chosen_geom_point <- if (interactive) geom_point_interactive( 
    aes(tooltip = glue(
      "{Sequence}
       Position: {Start}-{End}
       Value: {round(value, 2)}
       Time point: {Exposure} min"
    )),
    size = 2
  ) else geom_point(size = 2)
  
  err_width <- if (log_x) 0.1 else 5
  
  chosen_uncertainty_geom <- switch (
    uncertainty_type,
    ribbon = geom_ribbon(aes(color = NULL), alpha = 0.15),
    bars = geom_errorbar(width = err_width),
    `bars + line` = geom_errorbar(width = err_width)
  )
  
  diff_kin_plot <- ggplot(
    plot_dat, 
    aes(
      x = Exposure, 
      y = value, 
      group = Sequence, 
      shape = Sequence,
      fill = Sequence,
      color = states, 
      ymin = value - err_value, 
      ymax = value + err_value
    )) +
    chosen_geom_point +
    chosen_uncertainty_geom +
    theme(legend.position = "bottom",
          legend.title = element_blank()) +
    labs(x = "Time points [min]", 
         y = y_label,
         title = title)
  
  
  if (uncertainty_type %in% c("ribbon", "bars + line"))
    diff_kin_plot <- diff_kin_plot + geom_line()
  
  if(show_houde_interval){
    
    houde_intervals <- diff_uptake_dat %>%
      calculate_confidence_limit_values(confidence_level = attr(diff_uptake_dat, "confidence_level"),
                                        theoretical = theoretical,
                                        fractional = fractional)
    
    diff_kin_plot <- diff_kin_plot +
      geom_hline(yintercept = houde_intervals[2], linetype = "dashed", color = "red")
    
  }
  
  if(show_tstud_confidence){
    
    alpha <- -log(1 - attr(diff_uptake_dat, "confidence_level"))
    
    diff_uptake_dat[, valid := log_p_value >= alpha]

    
    diff_uptake_dat <- merge(diff_uptake_dat, plot_dat, by = c("Sequence", "Start", "End", "Exposure"))
    
    diff_kin_plot <- diff_kin_plot +
      geom_point(data = subset(diff_uptake_dat, !valid), aes(x = Exposure, y = value), shape = 13, size = 2)
    
  }
  
  if(log_x){
    
    diff_kin_plot <- diff_kin_plot + 
      scale_x_log10()
    
  }
  
  return(HaDeXify(diff_kin_plot))
  
}