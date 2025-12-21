.onLoad <- function(libname, pkgname) {
  if (is.null(getOption("hadex_use_interactive_plots")))
    options(hadex_use_interactive_plots = FALSE)
}

.onAttach <- function(libname, pkgname) {
  if (!is_GUI_installed() & sample(1L:10, 1) == 1)
    packageStartupMessage("To be able to run HaDeX Graphical User Interface, you have to have the 'HaDeXGUI' package installed. You can do it by calling 'HaDeX::install_GUI()'.")
}

# controlling r3dmol version
.HaDeX_msg <- new.env(parent = emptyenv())
.HaDeX_msg[["r3dmol"]] <- TRUE
