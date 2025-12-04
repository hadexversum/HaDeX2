# Summary data

Show summary table

## Usage

``` r
show_summary_data(
  dat,
  confidence_level = "",
  protein_length = max(dat[["End"]])
)
```

## Arguments

- dat:

  data imported by the
  [`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
  function

- confidence_level:

  confidence level for the test, from range \[0, 1\].

- protein_length:

  the length of the protein sequence

## Value

a `data.table` object

## Details

The format in the table is suggested by the community and should be
provided for experimetal data.

## References

Masson, G.R., Burke, J.E., Ahn, N.G., Anand, G.S., Borchers, C., Brier,
S., Bou-Assaf, G.M., Engen, J.R., Englander, S.W., Faber, J., et al.
(2019). Recommendations for performing, interpreting and reporting
hydrogen deuterium exchange mass spectrometry (HDX-MS) experiments. Nat
Methods 16, 595–602

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)

## Examples

``` r
dat <- read_hdx(system.file(package = "HaDeX2", "HaDeX/data/KD_180110_CD160_HVEM.csv"))
show_summary_data(dat)
#>                             Name  Value
#> 1                HDX time course      7
#> 2             Number of peptides     41
#> 3             Sequence coverage  86.36%
#> 4         Average peptide length  14.68
#> 5                     Redundancy   4.56
#> 6                     Replicates      4
#> 7 Significant differences in HDX       
```
