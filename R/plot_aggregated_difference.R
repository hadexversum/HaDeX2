#' Plots aggregated uptake difference
#'
#' @param aggregated_diff_dat ...
#' @param fractional ...
#' @param theoretical ...
#' @param time_100 ...
#' @param panels ...
#' @param interactive ...
#'
#' @examples
#' diff_uptake_dat <- create_diff_uptake_dataset(alpha_dat)
#' aggregated_diff_dat <- create_aggregated_diff_uptake_dataset(diff_uptake_dat)
#' plot_aggregated_differential_uptake(aggregated_diff_dat, panels = FALSE)
#' plot_aggregated_differential_uptake(aggregated_diff_dat, fractional = FALSE, theoretical = TRUE, panels = FALSE)
#' plot_aggregated_differential_uptake(aggregated_diff_dat, theoretical = TRUE, panels = TRUE)
#'
#' @export

plot_aggregated_differential_uptake <- function(aggregated_diff_dat,
                                                fractional = TRUE,
                                                theoretical = FALSE,
                                                time_100 = max(unique(aggregated_diff_dat[["Exposure"]])),
                                                panels = FALSE,
                                                interactive = FALSE){

  aggregated_diff_dat <- as.data.table(aggregated_diff_dat)

  if(fractional){

    fill_value <- "diff_frac_deut_uptake"
    err_value <- "err_diff_frac_deut_uptake"
    plot_title <- "Fractional DU difference "
    fill_title <- "Frac DU Diff [%]"

    if(theoretical){

      fill_value <- "diff_theo_frac_deut_uptake"
      err_value <- "err_diff_theo_frac_deut_uptake"
      plot_title <- "Fractional Theoretical DU difference "
      fill_title <- "Frac Theo DU Diff [%]"
    }

  } else {

    fill_value <- "diff_deut_uptake"
    err_value <- "err_diff_deut_uptake"
    plot_title <- "DU difference "
    fill_title <- "DU Diff [Da]"

    if(theoretical){

      fill_value <- "diff_theo_deut_uptake"
      err_value <- "err_diff_theo_deut_uptake     "
      plot_title <- "Theoretical DU difference "
      fill_title <- "Theo DU Diff [Da]"
    }
  }

  aggregated_diff_dat <- aggregated_diff_dat[Exposure < time_100,]

  if(interactive){
    selected_geom_tile <- geom_tile_interactive(mapping = aes(x = position, y = as.factor(Exposure), fill = get(fill_value),
                                                              tooltip = glue("Position: {position},
                                                                   Residue: {aa},
                                                                   Value: {round(get(fill_value), 2)}")))
  } else {
    selected_geom_tile <- geom_tile(aes(x = position, y = as.factor(Exposure), fill = get(fill_value)))
  }
  
  plt <- ggplot(aggregated_diff_dat) +
    selected_geom_tile + 
    scale_fill_gradient2(low = "blue", mid = "white", high = "red") +
    theme(legend.position = "bottom") +
    labs(x = "Position",
         y = "Exposure",
         fill = fill_title,
         title = plot_title)

  if(panels){

    limit = 50
    length = max(aggregated_diff_dat[["position"]])
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

  return(plt)

  }


