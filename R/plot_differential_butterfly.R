#' Butterfly differential deuterium uptake plot
#'
#' @description Butterfly plot of differential deuterium uptake values 
#' between two biological states in time.
#' 
#' @importFrom ggplot2 scale_linetype_manual scale_colour_identity
#'
#' @param diff_uptake_dat data produced by
#' \code{\link{create_diff_uptake_dataset}} function.
#' @param theoretical \code{logical}, determines if values are theoretical
#' @param fractional \code{logical}, determines if values are fractional
#' @param show_houde_interval \code{logical}, determines if houde interval is shown.
#' @param show_tstud_confidence \code{logical}, determines if t-Student test validity 
#' is shown.
#' @param confidence_level confidence level for the test, from range [0, 1].
#' Important if selected show_confidence_limit.
#' @param uncertainty_type ...
#' @inheritParams plot_butterfly
#'
#' @details Function \code{\link{plot_differential_butterfly}} generates
#' differential butterfly plot based on provided data and parameters. On X-axis
#' there is peptide ID. On the Y-axis there is deuterium uptake difference in
#' chosen form. Data from multiple time points of measurement is presented.
#' If chosen, there are confidence limits based on Houde test on provided
#' confidence level.
#' 
#' @return a \code{\link{ggplot}} object.
#'
#' @references Houde, D., Berkowitz, S.A., and Engen, J.R. (2011).
#' The Utility of Hydrogen/Deuterium Exchange Mass Spectrometry in
#' Biopharmaceutical Comparability Studies. J Pharm Sci 100, 2071–2086.
#' 
#' @seealso
#' \code{\link{read_hdx}}
#' \code{\link{create_diff_uptake_dataset}}
#'
#' @examples
#' diff_uptake_dat <- create_diff_uptake_dataset(alpha_dat)
#' plot_differential_butterfly(diff_uptake_dat = diff_uptake_dat)
#' plot_differential_butterfly(diff_uptake_dat = diff_uptake_dat, show_houde_interval = TRUE)
#' 
#' diff_p_uptake_dat <- create_p_diff_uptake_dataset(alpha_dat)
#' plot_differential_butterfly(diff_p_uptake_dat = diff_p_uptake_dat, show_tstud_confidence = TRUE)
#' 
#' @export plot_differential_butterfly

plot_differential_butterfly <- function(diff_uptake_dat = NULL,
                                        diff_p_uptake_dat = NULL, 
                                        theoretical = FALSE,
                                        fractional = FALSE,
                                        show_houde_interval = FALSE,
                                        show_tstud_confidence = FALSE,
                                        uncertainty_type = "ribbon",
                                        confidence_level = 0.98,
                                        interactive = getOption("hadex_use_interactive_plots")){
  
  uncertainty_type <- match.arg(uncertainty_type, c("ribbon", "bars", "bars + line"))
  
  ## conditions
  
  if (show_tstud_confidence) {
    
    if(is.null(diff_p_uptake_dat)) { stop("Please, provide the neccessary data.") } else { diff_uptake_dat <- diff_p_uptake_dat }
    
  } else {
    
    if(is.null(diff_uptake_dat) & is.null(diff_p_uptake_dat)) { stop("Please, provide the neccessary data.") } 
    
  }
  
  ##
  
  if (theoretical) {
    
    title <- "Theoretical butterfly differential plot"
    
    if (fractional) {
      
      # theoretical & fractional
      value <- "diff_theo_frac_deut_uptake"
      err_value <- "err_diff_theo_frac_deut_uptake"
      y_label <- "Fractional deuterium uptake difference [%]"
      
    } else {
      
      # theoretical & absolute
      value <- "diff_theo_deut_uptake"
      err_value <- "err_diff_theo_deut_uptake"
      y_label <- "Deuterium uptake difference [Da]"
      
    }
    
  } else {
    
    title <- "Butterfly differential plot"
    
    if (fractional) {
      
      # experimental & fractional
      value <- "diff_frac_deut_uptake"
      err_value <- "err_diff_frac_deut_uptake"
      y_label <- "Fractional deuterium uptake difference [%]"
      
    } else {
      
      # experimental & absolute
      value <- "diff_deut_uptake"
      err_value <- "err_diff_deut_uptake"
      y_label <- "Deuterium uptake difference [Da]"
      
    }
    
  }
  
  diff_uptake_dat <- as.data.table(diff_uptake_dat)
  
  plot_dat <- data.frame(ID = diff_uptake_dat[["ID"]],
                         Exposure = as.factor(diff_uptake_dat[["Exposure"]]),
                         value = diff_uptake_dat[[value]],
                         err_value = diff_uptake_dat[[err_value]],
                         Sequence = diff_uptake_dat[["Sequence"]],
                         Start = diff_uptake_dat[["Start"]],
                         End = diff_uptake_dat[["End"]])
  
  attr(plot_dat, "n_rep") <- attr(diff_uptake_dat, "n_rep")
  
  chosen_geom_point <- if (interactive) geom_point_interactive( 
    aes(tooltip = glue(
      "{Sequence}
       Position: {Start}-{End}
       Value: {round(value, 2)}
       Exposure: {Exposure} min"
    ))
  ) else geom_point()
  
  chosen_uncertainty_geom <- switch (
    uncertainty_type,
    ribbon = geom_ribbon(alpha = 0.5, size = 0, linetype = "blank"),
    bars = geom_errorbar(width = 0.25, alpha = 0.5),
    `bars + line` = geom_errorbar(width = 0.25, alpha = 0.5) + geom_line()
  )
  
  butterfly_differential_plot <- ggplot(
    data = plot_dat, 
    aes(
      x = ID, 
      y = value, 
      group = Exposure, 
      color = Exposure, 
      fill = Exposure,
      ymin = value - err_value, 
      ymax = value + err_value
    )) +
    chosen_uncertainty_geom +
    chosen_geom_point +
    labs(title = title,
         x = "Peptide ID",
         y = y_label) +
    theme(legend.position = "bottom")
  
  if(show_houde_interval){
    
    # t_value <- qt(c((1 - confidence_level)/2, 1-(1 - confidence_level)/2), df = 2)[2]
    # x_threshold <- t_value * mean(plot_dat[["err_value"]], na.rm = TRUE)/sqrt(length(plot_dat))
    
    x_threshold <- calculate_confidence_limit_values(plot_dat, 
                                                     confidence_level = confidence_level,
                                                     n_rep = attr(diff_uptake_dat, "n_rep"))[2]
    
    butterfly_differential_plot <- butterfly_differential_plot +
      geom_hline(aes(yintercept = x_threshold), linetype = "dashed", color = "black", size = .7) +
      geom_hline(aes(yintercept = -x_threshold), linetype = "dashed", color = "black", size = .7) 
    
  }
  
  if(show_tstud_confidence){
    
    alpha <- -log(1 - attr(diff_uptake_dat, "confidence_level"))
    
    diff_uptake_dat[, `:=`(valid = log_p_value >= alpha,
                      Exposure = as.factor(Exposure))]
    
    diff_uptake_dat <- merge(diff_uptake_dat, plot_dat, by = c("Sequence", "Start", "End", "Exposure", "ID"))
      
    butterfly_differential_plot <- butterfly_differential_plot +
      geom_point(data = subset(diff_uptake_dat, !valid), aes(x = ID, y = value, group = Exposure), color = "grey77", size = 2)
    
  }
  
  # butterfly_differential_plot <- butterfly_differential_plot + labs(color = "Exposure")
  
  return(HaDeXify(butterfly_differential_plot))
  
}
