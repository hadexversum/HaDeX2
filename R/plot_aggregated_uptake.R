#' Plots aggregated uptake
#' 
#' @importFrom ggiraph geom_tile_interactive
#' 
#' @param aggregated_dat ...
#' @param fractional ...
#' @param theoretical ...
#' @param time_100 ...
#' @param panels ...
#' @param interactive ...
#'
#' @examples
#' kin_dat <- create_uptake_dataset(alpha_dat, states = "Alpha_KSCN")
#' aggregated_dat <- create_aggregated_uptake_dataset(kin_dat)
#' plot_aggregated_uptake(aggregated_dat, panels = FALSE)
#' plot_aggregated_uptake(aggregated_dat, fractional = FALSE, panels = FALSE)
#' plot_aggregated_uptake(aggregated_dat, fractional = FALSE, theoretical = TRUE, panels = TRUE)
#'
#' @export
plot_aggregated_uptake <- function(aggregated_dat,
                                   fractional = TRUE,
                                   theoretical = FALSE,
                                   time_100 = max(unique(aggregated_dat[["Exposure"]])),
                                   panels = FALSE,
                                   interactive = FALSE){

  aggregated_dat <- as.data.table(aggregated_dat)

  if(fractional){

    fill_value <- "frac_deut_uptake"
    err_value <- "err_frac_deut_uptake"
    plot_title <- "Fractional deuterium uptake"
    fill_title <- "Fractional DU [%]"

    if(theoretical){

      fill_value <- "theo_frac_deut_uptake"
      err_value <- "err_theo_frac_deut_uptake"
      plot_title <- "Theoretical fractional deuterium uptake"
      fill_title <- "Theoretical Fractional DU [%]"

    }

  } else {

    fill_value <- "deut_uptake"
    err_value <- "err_deut_uptake"
    plot_title <- "Deuterium uptake"
    fill_title <- "DU [Da]"

    if(theoretical){

      fill_value <- "theo_deut_uptake"
      err_value <- "err_theo_deut_uptake"
      plot_title <- "Theoretical deuterium uptake"
      fill_title <- "Theoretical DU [Da]"
    }

  }

  aggregated_dat <- aggregated_dat[Exposure < time_100,]
  
  if(interactive){
    selected_geom_tile <- geom_tile_interactive(mapping = aes(x = position, y = as.factor(Exposure), fill = get(fill_value),
                                                    tooltip = glue("Position: {position},
                                                                   Residue: {aa},
                                                                   Value: {round(get(fill_value), 2)}")))
  } else {
    selected_geom_tile <- geom_tile(aes(x = position, y = as.factor(Exposure), fill = get(fill_value)))
  }

  plt <- ggplot(aggregated_dat) +
    selected_geom_tile +
    scale_fill_gradient2(low = "white", high = "red") +
    theme(legend.position = "bottom") +
    labs(y = "Exposure",
         x = "Position",
         fill = fill_title,
         title = plot_title)

  if(panels){

    limit = 50
    length = max(aggregated_dat[["position"]])
    n_panels = ceiling(length/limit)
    panels <- NULL

    x <- lapply(1:n_panels, function(i){

      plt_tmp <- plt +
        coord_cartesian(xlim = c((i-1)* 50, i*50)) +
        theme(legend.position = "none") +
        labs(x = "")

      if(i == n_panels){
        plt_tmp <- plt_tmp + labs(x = "Position")
      }

      plt_tmp

    })

    plt <- do.call(gridExtra::grid.arrange, c(x, ncol = 1))
  }


  return(HaDeXify(plt))

}

