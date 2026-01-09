# Plot overlap distribution

Generates overlap distribution plot based on supplied data and
parameters.

## Usage

``` r
plot_overlap_distribution(
  overlap_dist_dat,
  start = 1,
  end = max(overlap_dist_dat[["pos"]]),
  interactive = getOption("hadex_use_interactive_plots")
)
```

## Arguments

- overlap_dist_dat:

  produced by
  [`create_overlap_distribution_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_overlap_distribution_dataset.md)
  function

- start:

  start start position of chosen protein.

- end:

  end position of chosen protein.

- interactive:

  `logical`, whether plot should have an interactive layer created with
  with ggiraph, which would add tooltips to the plot in an interactive
  display (HTML/Markdown documents or shiny app).

## Value

a [`ggplot`](https://ggplot2.tidyverse.org/reference/ggplot.html)
object.

## Details

This plot presents how many times (by how many peptides) a amino
position in protein sequence is covered. This plot is visible in GUI.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`reconstruct_sequence`](https://hadexversum.github.io/HaDeX2/reference/reconstruct_sequence.md)
[`create_overlap_distribution_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_overlap_distribution_dataset.md)

## Examples

``` r
overlap_dist_dat <- create_overlap_distribution_dataset(alpha_dat)
plot_overlap_distribution(overlap_dist_dat)

```
