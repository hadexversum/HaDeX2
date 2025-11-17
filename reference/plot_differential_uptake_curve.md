# Plot differential uptake curve

Differential uptake curve for one peptide between two biological states.

## Usage

``` r
plot_differential_uptake_curve(
  diff_uptake_dat = NULL,
  diff_p_uptake_dat = NULL,
  sequence = NULL,
  theoretical = FALSE,
  fractional = FALSE,
  uncertainty_type = "ribbon",
  log_x = TRUE,
  show_houde_interval = FALSE,
  show_tstud_confidence = FALSE,
  interactive = getOption("hadex_use_interactive_plots")
)
```

## Arguments

- diff_uptake_dat:

  produced by
  [`create_diff_uptake_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_diff_uptake_dataset.md)
  function

- diff_p_uptake_dat:

  differential uptake data alongside the P-value as calculated by
  [`create_p_diff_uptake_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_p_diff_uptake_dataset.md)

- sequence:

  sequence of chosen peptide

- theoretical:

  `logical`, determines if plot shows theoretical values

- fractional:

  `logical`, determines if plot shows fractional values

- uncertainty_type:

  type of presenting uncertainty, possible values: "ribbon", "bars" or
  "bars + line"

- log_x:

  `logical`, determines if x axis shows logarithmic values

- show_houde_interval:

  `logical`, determines if houde interval is shown

- show_tstud_confidence:

  `logical`, determines if t-Student test validity is shown

- interactive:

  `logical`, whether plot should have an interactive layer created with
  with ggiraph, which would add tooltips to the plot in an interactive
  display (HTML/Markdown documents or shiny app).

## Value

a `ggplot` object.

## Details

This plot shows the differential deuterium uptake between two biological
states for selected peptides in different time points. The possibility
to plot multiple differences (between state and mutant) for the peptide
will be added soon.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`create_diff_uptake_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_diff_uptake_dataset.md)

## Examples

``` r
diff_uptake_dat <- create_diff_uptake_dataset(alpha_dat)
plot_differential_uptake_curve(diff_uptake_dat = diff_uptake_dat, sequence = "GDLKSPAGL")
#> Warning: NaNs produced


diff_p_uptake_dat <- create_p_diff_uptake_dataset(alpha_dat)
plot_differential_uptake_curve(diff_p_uptake_dat = diff_p_uptake_dat, 
                               sequence = "GDLKSPAGL", show_houde_interval = TRUE)
#> Warning: NaNs produced

plot_differential_uptake_curve(diff_p_uptake_dat = diff_p_uptake_dat, 
                               sequence = "GDLKSPAGL", show_houde_interval = TRUE, 
                               show_tstud_confidence = TRUE)
#> Warning: NaNs produced

plot_differential_uptake_curve(diff_p_uptake_dat = diff_p_uptake_dat, 
                               sequence = "GDLKSPAGL", show_tstud_confidence = TRUE)
#> Warning: NaNs produced

```
