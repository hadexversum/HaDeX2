#' Calculates aggregated deuterium uptake for one time point
#'
#' @param kin_dat single state uptake data, product of e.q.
#' \code{\link{create_uptake_dataset}}
#' @param state state included in calculations
#' @param time_t chosen time point 
#'
#' @description
#' Function aggregates the deuterium uptake values from
#' peptide level into single-amino resolution using `weighted
#' approach` (definied in `vignette("datafiles"))`. For 
#' visualization use \code{\link{plot_aggregated_uptake}}
#' 
#' @return a \code{\link{data.frame}} object
#' 
#' @examples
#' dat <- read_hdx(system.file(package = "HaDeX", "HaDeX/data/KD_180110_CD160_HVEM.csv"))
#' kin_dat <- create_uptake_dataset(alpha_dat, states = "Alpha_KSCN")
#' head(create_aggregated_uptake_dataset(kin_dat))
#'
#' @export

calculate_aggregated_uptake <- function(kin_dat,
                                        state = unique(kin_dat[["State"]])[1],
                                        time_t){

  kin_dat <- as.data.table(kin_dat)
  kin_dat_t <- kin_dat[Exposure == time_t]

  residues <- get_residue_positions(kin_dat)
  
  residues["frac_deut_uptake"] <- NA
  residues["err_frac_deut_uptake"] <- NA
  residues["deut_uptake"] <- NA
  residues["err_deut_uptake"] <- NA
  residues["theo_frac_deut_uptake"] <- NA
  residues["err_theo_frac_deut_uptake"] <- NA
  residues["theo_deut_uptake"] <- NA
  residues["err_theo_deut_uptake"] <- NA


  lapply(residues[["position"]], function(i){

    x <- kin_dat_t[Start <= i & i <= End & State == state]
    x[, weight := 1/MaxUptake/sum(1/MaxUptake)]
    
    ##
    frac_deut_uptake = weighted.mean(x[["frac_deut_uptake"]], w = x[["weight"]])
    x[, tmp_err_frac_deut_uptake := (weight * err_frac_deut_uptake)^2]
    err_frac_deut_uptake = sqrt(sum(x[["err_frac_deut_uptake"]]))
    ##
    deut_uptake = weighted.mean(x[["deut_uptake"]], w = x[["weight"]])
    x[, tmp_err_deut_uptake := (weight * err_deut_uptake)^2]
    err_deut_uptake = sqrt(sum(x[["tmp_err_deut_uptake"]]))
    ##
    theo_frac_deut_uptake = weighted.mean(x[["theo_frac_deut_uptake"]], w = x[["weight"]])
    x[, tmp_err_theo_frac_deut_uptake := (weight * err_theo_frac_deut_uptake)^2]
    err_theo_frac_deut_uptake = sqrt(sum(x[["tmp_err_theo_frac_deut_uptake"]]))
    ##
    theo_deut_uptake = weighted.mean(x[["theo_deut_uptake"]], w = x[["weight"]])
    x[, tmp_err_theo_deut_uptake := (weight * err_theo_deut_uptake)^2]
    err_theo_deut_uptake = sqrt(sum(x[["tmp_err_theo_deut_uptake"]]))
    ##
    
    residues[i, "frac_deut_uptake"] <<- frac_deut_uptake
    residues[i, "err_frac_deut_uptake"] <<- err_frac_deut_uptake
    residues[i, "deut_uptake"] <<- deut_uptake
    residues[i, "err_deut_uptake"] <<- err_deut_uptake
    residues[i, "theo_frac_deut_uptake"] <<- theo_frac_deut_uptake
    residues[i, "err_theo_frac_deut_uptake"] <<- err_theo_frac_deut_uptake
    residues[i, "theo_deut_uptake"] <<- theo_deut_uptake
    residues[i, "err_theo_deut_uptake"] <<- err_theo_deut_uptake

  })

  residues["Exposure"] <- time_t

  return(as.data.frame(residues))

}
