# Get protein redundancy

Calculates the protein redundancy in the whole experiment (all
biological states).

## Usage

``` r
get_protein_redundancy(dat, protein_length = NULL)
```

## Arguments

- dat:

  data imported by the
  [`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
  function.

- protein_length:

  [`numeric`](https://rdrr.io/r/base/numeric.html), indicates the length
  of the protein. If not provided, the maximal end value from the file
  is used.

## Value

a [`numeric`](https://rdrr.io/r/base/numeric.html) value.

## Details

Function `get_protein_redundancy` calculates the redundancy of the
protein, based on provided experimental data.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)

## Examples

``` r
get_protein_redundancy(alpha_dat)
#> [1] 5.13
```
