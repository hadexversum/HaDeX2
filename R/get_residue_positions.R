#' Get residue positions
#' 
#' @importFrom purrr map_chr
#'
#' @param dat data imported by the \code{\link{read_hdx}} function.
#' 
#' @details
#' Prepares data table for high-resolution values. It creates a long data frame 
#' with each position in the sequence accompanied by the amino acid placed in this
#' position.
#' 
#' @return a \code{data.frame} object.
#' 
#' @examples
#' get_residue_positions(alpha_dat)
#'
#' @export

get_residue_positions <- function(dat){
  
  clean_dat <- dat[, Sequence := map_chr(strsplit(Sequence, "[+]"), 1)]
  
  x <- do.call(rbind, lapply(1:nrow(clean_dat), function(i){
    data.frame(position = clean_dat[i, Start]:clean_dat[i, End],
               aa = strsplit(clean_dat[i, Sequence], split="")[[1]])
  })) %>% unique(.) %>% arrange(position)
  
  x_blank <- data.frame(position = 1:max(x[["position"]]))
  
  merge(x, x_blank, by = "position", all.y = T)
  
}