# Plot peptide charge measurement

Plot the charge measurements from replicates for peptide in specific
time point.

## Usage

``` r
plot_peptide_charge_measurement(
  dat,
  protein = dat[["Protein"]][1],
  state = dat[["State"]][1],
  sequence = dat[["Sequence"]][1],
  time_t = unique(dat[["Exposure"]])[3]
)
```

## Arguments

- dat:

  data as imported by the
  [`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
  function.

- protein:

  chosen protein.

- state:

  biological state for chosen protein.

- sequence:

  sequence of chosen peptide.

- time_t:

  time point of the measurement.

## Value

a `ggplot` object.

## Details

This function shows the measurements of charge from different replicates
for specific peptide in specific state in specific time point of
measurement on the plot.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`show_peptide_charge_measurement`](https://hadexversum.github.io/HaDeX2/reference/show_peptide_charge_measurement.md)

## Examples

``` r
plot_peptide_charge_measurement(alpha_dat)

```
