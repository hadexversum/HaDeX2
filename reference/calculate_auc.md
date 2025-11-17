# Calculate Area Under the Curve

Calculates area under the deuterium uptake curve

## Usage

``` r
calculate_auc(
  uptake_dat,
  protein = uptake_dat[["Protein"]][1],
  state = uptake_dat[["State"]][1],
  preserve_values = FALSE
)
```

## Arguments

- uptake_dat:

  data with deuterium uptake values, calculated e.q. by
  [`create_uptake_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_uptake_dataset.md)

- protein:

  chosen protein

- state:

  state included in calculations

- preserve_values:

  indicator if the original columns form uptake_dat should be preserve
  in the result

## Value

a [`data.frame`](https://rdrr.io/r/base/data.frame.html) object

## Details

The AUC is calculated on the data normalized to unit square by division
by maximum values of exposure time and deuterium uptake, respectively.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`create_uptake_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_uptake_dataset.md)

## Examples

``` r
uptake_dat <- create_uptake_dataset(alpha_dat)
head(calculate_auc(uptake_dat))
#>     Protein    Sequence Start End       State Modification       auc
#> 1 db_eEF1Ba GFGDLKSPAGL     1  11 ALPHA_Gamma           NA 0.9973726
#> 2 db_eEF1Ba  FGDLKSPAGL     2  11 ALPHA_Gamma           NA 0.9993199
#> 3 db_eEF1Ba   GDLKSPAGL     3  11 ALPHA_Gamma           NA 1.0119067
#> 4 db_eEF1Ba      LKSPAG     5  10 ALPHA_Gamma           NA 0.9991318
#> 5 db_eEF1Ba     LKSPAGL     5  11 ALPHA_Gamma           NA 0.9991318
#> 6 db_eEF1Ba      AGLQVL     9  14 ALPHA_Gamma           NA 0.8587529
```
