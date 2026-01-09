# Plot overlap data

Generates overlapping peptide plot based on supplied data and
parameters.

## Usage

``` r
plot_overlap(dat, protein = dat[["Protein"]][1], state = dat[["State"]][1])
```

## Arguments

- dat:

  data imported by the
  [`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
  function.

- protein:

  protein included in calculations

- state:

  state included in calculations

## Value

a [`ggplot`](https://ggplot2.tidyverse.org/reference/ggplot.html)
object.

## Details

The overlap plot presents all the peptides in given state on the protein
sequence. This plot is visible in GUI.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`show_overlap_data`](https://hadexversum.github.io/HaDeX2/reference/show_overlap_data.md)

## Examples

``` r
plot_overlap(alpha_dat)

```
