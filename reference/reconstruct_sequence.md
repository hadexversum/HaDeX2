# Reconstruct protein sequence

Reconstruct protein sequence from experimental data

## Usage

``` r
reconstruct_sequence(
  dat,
  protein = dat[["Protein"]][1],
  states = unique(dat[["State"]]),
  end = NULL
)
```

## Arguments

- dat:

  data read by
  [`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)

- protein:

  selected protein

- states:

  selected biological states for given protein

- end:

  [`numeric`](https://rdrr.io/r/base/numeric.html), end position of the
  protein

## Value

a [`character`](https://rdrr.io/r/base/character.html) object.

## Details

The function `reconstruct_sequence` generates protein sequence from
supplied experimental data. For a position not covered, letter x is
shown. If the C-terminus of protein is not covered, there is a
possibility to manually fix the protein length by passing a value to the
\`end\` parameter.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)

## Examples

``` r
reconstruct_sequence(alpha_dat)
#> [1] "GFGDLKSPAGLQVLNDYLADKSYIEGYVPSQADVAVFEAVSSPPPADLCHALRWYNHIKSYEKEKASLPGVKKALGKYGPADVEDTTGSGATDSKDDDDIDLFGSDDEEESEEAKRLREERLAQYESKKAKKPALVAKSSILLDVKPWDDETDMAKLEECVRSIQADGLVWGSSKLVPVGYGIKKLQIQCVVEDDKVGTDMLEEQITAFEDYVQSMDVAAF"
```
