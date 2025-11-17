# HaDeX Graphical User Interface

Launches graphical user interface from HaDeXGUI package. If the GUI
package is not installed, it asks user whether to install it

## Usage

``` r
HaDeX_GUI(port = getOption("shiny.port"), prod = TRUE, ...)
```

## Arguments

- port:

  number of port for the app to run on.

- prod:

  should the app run in production mode (TRUE) or development (FALSE)?

- ...:

  arguments to pass to
  [`HaDeXGUI::run_app()`](https://rdrr.io/pkg/HaDeXGUI/man/run_app.html).
  See [`run_app`](https://rdrr.io/pkg/HaDeXGUI/man/run_app.html).

## Warning

Any ad-blocking software may cause malfunctions.
