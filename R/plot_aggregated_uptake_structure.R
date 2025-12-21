#' Plot aggregated uptake on the 3D structure
#' 
#' @importFrom ggplot2 ggplot_build
#'
#' @param aggregated_dat aggregated data, either for single uptake or differential
#' @param differential indicator if the aggregated_dat contains differential 
#' results
#' @param fractional indicator if fractional values are used
#' @param theoretical indicator if theoretical values are used
#' @param time_t time point from aggregated_dat to be shown on the structure
#' @param pdb_file_path file path to the pdb file 
#' 
#' @description Function plots the aggregated data (either one state deuterium uptake or
#' differential deuterium uptake) on the 3d structure.
#' 
#' @return a r3dmol object.
#' 
#' @examples
#' diff_uptake_dat <- create_diff_uptake_dataset(alpha_dat)
#' diff_aggregated_dat <- create_aggregated_diff_uptake_dataset(diff_uptake_dat)
#' pdb_file_path <- system.file(package = "HaDeX", "HaDeX/data/Model_eEF1Balpha.pdb")
#' 
#' plot_aggregated_uptake_structure(diff_aggregated_dat, 
#'                                  differential = TRUE,
#'                                  time_t = 1,
#'                                  pdb_file_path = pdb_file_path)
#'                                   
#' kin_dat <- create_uptake_dataset(alpha_dat, states = "Alpha_KSCN" )
#' aggregated_dat <- create_aggregated_uptake_dataset(kin_dat)
#' plot_aggregated_uptake_structure(aggregated_dat, 
#'                                  differential = FALSE,
#'                                  time_t = 1,
#'                                  pdb_file_path = pdb_file_path)
#'                                  
#'
#' @export

plot_aggregated_uptake_structure <- function(aggregated_dat,
                                             differential = FALSE,
                                             fractional = TRUE,
                                             theoretical = FALSE,
                                             time_t,
                                             pdb_file_path){
  
  if(packageVersion("r3dmol") < "0.2" & .HaDeX_msg[["r3dmol"]]) {
    message("Please considering installing at least the 0.2 version of the r3dmol package.
            \nAvailable at: https://github.com/swsoyee/r3dmol.")
    .HaDeX_msg[["r3dmol"]] <- FALSE
  }
  
  if(is.null(aggregated_dat)) stop("No data supplied!")
  if(is.null(time_t)) stop("No time point supplied!")
  if(is.null(pdb_file_path)) stop("No pdb file supplied!")
  
  value <- get_uptake_name(differential = differential,
                           fractional = fractional,
                           theoretical = theoretical)

  tmp_plt <- ggplot(aggregated_dat) +
    geom_tile(aes(x = position, y = Exposure, fill = get(value)))
  
  if(differential){

    tmp_plt <- tmp_plt + scale_fill_gradient2(low ="blue", mid = "white", high = "red")

  } else {

    tmp_plt <- tmp_plt + scale_fill_gradient2(low = "white", high = "red")

  }

  plot_x <- ggplot_build(tmp_plt)$data[[1]]
  plot_colors <- plot_x[plot_x[["y"]] == time_t, ][["fill"]]
  
  color_vector <- paste0("\"", paste0(plot_colors, collapse = "\",\""), "\"")

  r3dmol::r3dmol(
    viewer_spec = r3dmol::m_viewer_spec(
      cartoonQuality = 10,
      lowerZoomLimit = 50,
      upperZoomLimit = 350
    ),
    id = "blank_structure",
    elementId = "blank_structure",
    backgroundColor = "#FFFFFF") %>%
    r3dmol::m_add_model(data = pdb_file_path,
                        format = "pdb") %>%
    r3dmol::m_set_style(
      style = r3dmol::m_style_cartoon(color = "white")) %>%
    r3dmol::m_zoom_to() %>%
    r3dmol::m_set_style(
      style = r3dmol::m_style_cartoon(
        colorfunc = paste0("
        function(atom) {
          const color = [", color_vector, "];
          return color[atom.resi];
        }")
      ))
}


#' Get color palette for 3D structure
#' 
#' @param aggregated_dat aggregated data, either for single uptake or differential
#' @param differential indicator if the aggregated_dat contains differential 
#' results
#' @param fractional indicator if fractional values are used
#' @param theoretical indicator if theoretical values are used
#' @param time_t time point from aggregated_dat to be shown on the structure
#' 
#' @description
#' This function provides a set of color codes associated with aggregated values
#' to be presented on 3D structure.
#' 
#' @return a list
#' 
#' @examples
#' diff_uptake_dat <- create_diff_uptake_dataset(alpha_dat)
#' diff_aggregated_dat <- create_aggregated_diff_uptake_dataset(diff_uptake_dat)
#' get_structure_color(diff_aggregated_dat, 
#'                     differential = TRUE,
#'                     time_t = 1)
#' 
#' @export
get_structure_color <- function(aggregated_dat,
                                differential = FALSE,
                                fractional = TRUE,
                                theoretical = FALSE,
                                time_t){
  
  if(is.null(aggregated_dat)) stop("No data supplied!")
  if(is.null(time_t)) stop("No time point supplied!")
  
  value <- get_uptake_name(differential = differential,
                           fractional = fractional,
                           theoretical = theoretical)
  
  tmp_plt <- ggplot(aggregated_dat) +
    geom_tile(aes(x = position, y = Exposure, fill = get(value)))
  
  if(differential){
    
    tmp_plt <- tmp_plt + scale_fill_gradient2(low ="blue", mid = "white", high = "red")
    
  } else {
    
    tmp_plt <- tmp_plt + scale_fill_gradient2(low = "white", high = "red")
    
  }
  
  plot_x <- ggplot_build(tmp_plt)$data[[1]]
  plot_colors <- plot_x[plot_x[["y"]] == time_t, ][["fill"]]
  
  return(plot_colors)
}
