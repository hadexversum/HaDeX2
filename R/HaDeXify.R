#' HaDeX customized ggplot theme
#'
#' @description This function HaDeXifies plot. It adds HaDeX logo 
#' and ggplot theme.
#' 
#' @importFrom magick image_read
#' @importFrom ggplot2 element_text annotation_custom
#' 
#' @param plt ggplot object. Plot to HaDeXify.
#'
#' @details Function adds the logo of HaDeX package in the left down
#' corner of the plot and the HaDeX theme. 
#' 
#' @return a \code{\link{ggplot2}} object.
#' 
#' @seealso 
#' \code{\link{read_hdx}}
#' \code{\link{plot_differential}}
#' \code{\link{plot_butterfly}}
#' 
#' @examples
#' diff_uptake_dat <- create_diff_uptake_dataset(alpha_dat)
#' HaDeXify(plot_differential(diff_uptake_dat))
#'
#' @export HaDeXify

HaDeXify <- function(plt) {

  bitmap <- readRDS(system.file(package = "HaDeX2",
                                "HaDeX/www/HaDeX_logo.RDS"))
  img <- image_read(bitmap)

  suppressMessages({
    plt  +
     # theme(text = element_text(family = "Lato")) +
      annotation_custom(grid::rasterGrob(img, interpolate = TRUE,
                                         height = 0.05,
                                         x = 0.99, y = 0.01,
                                         hjust = 1, vjust = 0)) 
    
  })
}
