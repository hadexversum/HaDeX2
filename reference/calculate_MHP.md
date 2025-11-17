# Calculate MHP of the peptide

Calculate the mass of the singly charged monoisotopic (or not) molecular
ion of for given peptide.

## Usage

``` r
calculate_MHP(Sequence, mono = FALSE)
```

## Arguments

- Sequence:

  sequence of the peptide (string) or vector of sequences. Each letter
  of the sequence of the peptide represents different amino acid (three
  letter representation not allowed)

- mono:

  logical value to determine if the mass should be monoisotopic or not.
  FALSE by default

## Value

vector of numeric MHP values of provided Sequences

## Details

This function calculates the mass of the singly charged monoisotopic (or
not) molecular ion for given peptide. It is the sum of the residue
masses plus the masses of the terminating group (H and OH). The source
of the masses can be found here:
[http://www.matrixscience.com/help/aa_help.html](http://www.matrixscience.com/help/aa_help.md).
Keep in mind that this function returns the value of an unmodified
peptide.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`calculate_state_uptake`](https://hadexversum.github.io/HaDeX2/reference/calculate_state_uptake.md)

## Examples

``` r
calculate_MHP("CHERICHERILADY")
#> [1] 1757.99
calculate_MHP("CHERICHERILADY", mono = TRUE)
#> [1] 1756.814
```
