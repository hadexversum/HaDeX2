# Get protein coverage

Calculate protein coverage by the peptides in selected biological state
or states.

## Usage

``` r
get_protein_coverage(
  dat,
  protein = dat[["Protein"]][1],
  states = unique(dat[["State"]]),
  protein_length = NULL
)
```

## Arguments

- dat:

  data imported by the
  [`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
  function

- protein:

  selected protein

- states:

  selected biological states

- protein_length:

  [`numeric`](https://rdrr.io/r/base/numeric.html), indicates the length
  of the protein. If not provided, the maximal end value from the file
  is used.

## Value

a [`numeric`](https://rdrr.io/r/base/numeric.html) percentage value
(rounded to two decimal places).

## Details

Function `get_protein_coverage` calculates the percentage coverage of
the protein sequence, rounded to two decimal places.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)

## Examples

``` r
get_protein_coverage(alpha_dat)
#> [1] 100
get_protein_coverage(alpha_dat, protein_length = 230)
#> [1] 96.09
```
