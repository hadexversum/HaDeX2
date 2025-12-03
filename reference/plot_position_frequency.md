# Position frequency

Plot the frequency of coverage for protein sequence

## Usage

``` r
plot_position_frequency(
  dat,
  protein = dat[["Protein"]][1],
  state = dat[["State"]][1]
)
```

## Arguments

- dat:

  data as imported by the
  [`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
  function

- protein:

  selected protein

- state:

  selected biological state for given protein

## Value

a `ggplot` object

## Details

The function `plot_position_frequency` generates a histogram of the
coverage frequency in selected biological states for selected protein.
The position frequency plot presents how many times each position of the
sequence is covered by different peptides.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`plot_coverage`](https://hadexversum.github.io/HaDeX2/reference/plot_coverage.md)

## Examples

``` r
plot_position_frequency(alpha_dat)
#> Warning: The dot-dot notation (`..count..`) was deprecated in ggplot2 3.4.0.
#> ℹ Please use `after_stat(count)` instead.
#> ℹ The deprecated feature was likely used in the HaDeX2 package.
#>   Please report the issue to the authors.

```
