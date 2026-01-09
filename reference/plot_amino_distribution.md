# generate_amino_distribution

Generates amino distribution based on the protein sequence and shows if
the amino acid is hydrophobic or hydrophylic.

## Usage

``` r
plot_amino_distribution(
  position_in_sequence,
  hydro_properties,
  protein,
  charge_colors,
  interactive = getOption("hadex_use_interactive_plots")
)
```

## Arguments

- position_in_sequence:

  custom format

- hydro_properties:

  data with hydrophobic properties

- protein:

  chosen protein

- charge_colors:

  vector of desired colors

- interactive:

  `logical`, whether plot should have an interactive layer created with
  with ggiraph, which would add tooltips to the plot in an interactive
  display (HTML/Markdown documents or shiny app).

## Value

a [`ggplot`](https://ggplot2.tidyverse.org/reference/ggplot.html)
object.

## Details

The data for this function is not packaged yet.
