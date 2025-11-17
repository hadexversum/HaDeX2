# Plot peptide mass measurement

Plot the mass measurements from replicates for peptide in specific time
point.

## Usage

``` r
plot_peptide_mass_measurement(
  dat,
  protein = dat[["Protein"]][1],
  state = dat[["State"]][1],
  sequence = dat[["Sequence"]][1],
  show_charge_values = TRUE,
  time_t = unique(dat[["Exposure"]])[3],
  interactive = getOption("hadex_use_interactive_plots")
)
```

## Arguments

- dat:

  data produced by
  [`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
  function

- protein:

  chosen protein

- state:

  biological state for chosen protein

- sequence:

  sequence of chosen peptide

- show_charge_values:

  `logical`, indicator if the data is shown for replicates or for charge
  values within the replicates

- time_t:

  chosen time point

- interactive:

  `logical`, whether plot should have an interactive layer created with
  with ggiraph, which would add tooltips to the plot in an interactive
  display (HTML/Markdown documents or shiny app)

## Value

a `ggplot` object.

## Details

This function shows the measurements of mass from different replicates
for specific peptide in specific state in specific time point of
measurement on the plot. Moreover, on the plot is shown the average mass
from the replicates, used later in calculations. The ribbon next to the
dotted average mass indicates the uncertainty.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`calculate_exp_masses_per_replicate`](https://hadexversum.github.io/HaDeX2/reference/calculate_exp_masses_per_replicate.md)
[`calculate_exp_masses`](https://hadexversum.github.io/HaDeX2/reference/calculate_exp_masses.md)
[`calculate_state_uptake`](https://hadexversum.github.io/HaDeX2/reference/calculate_state_uptake.md)
[`calculate_diff_uptake`](https://hadexversum.github.io/HaDeX2/reference/calculate_diff_uptake.md)

## Examples

``` r
plot_peptide_mass_measurement(alpha_dat, sequence = "FGSDDEEESEEAKRLRE")

plot_peptide_mass_measurement(alpha_dat, sequence = "FGSDDEEESEEAKRLRE", show_charge_values = FALSE)

```
