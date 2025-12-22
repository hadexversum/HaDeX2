# Deuterium uptake curve

Plot deuterium uptake curve for selected peptides

## Usage

``` r
plot_uptake_curve(
  uc_dat,
  theoretical = FALSE,
  fractional = FALSE,
  uncertainty_type = "ribbon",
  log_x = TRUE,
  interactive = getOption("hadex_use_interactive_plots")
)
```

## Arguments

- uc_dat:

  data produced by
  [`calculate_kinetics`](https://hadexversum.github.io/HaDeX2/reference/calculate_kinetics.md)
  or
  [`calculate_peptide_kinetics`](https://hadexversum.github.io/HaDeX2/reference/calculate_peptide_kinetics.md)
  or
  [`create_kinetic_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_kinetic_dataset.md)
  functions

- theoretical:

  `logical`, indicator if values are calculated using theoretical
  controls

- fractional:

  `logical`, indicator if values are shown in fractional form

- uncertainty_type:

  type of uncertainty presentation, possible values: "ribbon", "bars" or
  "bars + line"

- log_x:

  `logical`, indicator if the X axis values are transformed to log10

- interactive:

  `logical`, whether plot should have an interactive layer created with
  with ggiraph, which would add tooltips to the plot in an interactive
  display (HTML/Markdown documents or shiny app).

## Value

a `ggplot` object

## Details

The function `plot_uptake_curve` generates the deuterium uptake curve
for selected peptides from selected protein. On X-axis there are time
points of measurements. On Y-axis there is deuterium uptake in selected
form. The combined and propagated uncertainty can be presented as
ribbons or error bars.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`calculate_kinetics`](https://hadexversum.github.io/HaDeX2/reference/calculate_kinetics.md)
[`calculate_peptide_kinetics`](https://hadexversum.github.io/HaDeX2/reference/calculate_peptide_kinetics.md)
[`create_kinetic_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_kinetic_dataset.md)

## Examples

``` r
uc_dat <- calculate_kinetics(alpha_dat, protein = "db_eEF1Ba",
                             sequence = "GFGDLKSPAGL", 
                             state = "Alpha_KSCN",
                             start = 1, end = 11,
                             time_0 = 0, time_100 = 1440)
plot_uptake_curve(uc_dat = uc_dat, 
                  theoretical = FALSE, 
                  fractional = TRUE)
#> Warning: NaNs produced

                
```
