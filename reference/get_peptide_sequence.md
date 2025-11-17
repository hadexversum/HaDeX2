# Get peptide sequence based on the position

Gets the peptide sequence based on selected parameters (start and end
position, modification).

## Usage

``` r
get_peptide_sequence(
  dat,
  protein = dat[["Protein"]][1],
  start,
  end,
  modification = FALSE
)
```

## Arguments

- dat:

  any data frame that contains following information: protein, sequence,
  start, end, modification.

- protein:

  chosen protein.

- start:

  start position of the peptide of interest.

- end:

  end position of the peptide of interest.

- modification:

  logical value to indicate if peptide of interest has modification or
  not.

## Value

a [`character`](https://rdrr.io/r/base/character.html) value.

## Details

Function returns peptide sequence for selected parameters. Peptide
sequence is often required to properly identify peptide of interest, and
to avoid mistakes sequence is returned by the function. Moreover,
function uses the modification value to select peptide sequence.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)

## Examples

``` r
get_peptide_sequence(alpha_dat, start = 1, end = 11)
#> [1] "GFGDLKSPAGL"
```
