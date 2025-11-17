# Get number of replicates

Calculates the number of replicates from the experimental data.

## Usage

``` r
get_n_replicates(dat, protein = dat[["Protein"]][1])
```

## Arguments

- dat:

  data imported by the
  [`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
  function.

- protein:

  chosen protein

## Value

a [`numeric`](https://rdrr.io/r/base/numeric.html) value.

## Details

Calculate the number of replicates of experiment.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)

## Examples

``` r
get_n_replicates(alpha_dat)
#> [1] 3
```
