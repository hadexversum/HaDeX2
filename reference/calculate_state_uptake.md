# Calculate deuterium uptake

Calculates deuteration uptake based on supplied parameters.

## Usage

``` r
calculate_state_uptake(
  dat,
  protein = unique(dat[["Protein"]])[1],
  state = unique(dat[["State"]])[1],
  time_0 = min(dat[dat[["Exposure"]] > 0, ][["Exposure"]]),
  time_t = unique(dat[["Exposure"]])[3],
  time_100 = max(dat[["Exposure"]]),
  deut_part = 0.9
)
```

## Arguments

- dat:

  data as imported by the
  [`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
  function

- protein:

  chosen protein

- state:

  state included in calculations

- time_0:

  minimal exchange control

- time_t:

  chosen time point

- time_100:

  maximal exchange control

- deut_part:

  percentage of deuterium the protein was exposed to, value in range
  \[0, 1\]

## Value

a [`data.frame`](https://rdrr.io/r/base/data.frame.html) object

## Details

The function `calculate_state_uptake` calculates deuterium uptake (in
different forms) for all of the peptides in given protein in given state
based on supplied parameters: \`time_0\`, \`time_100\` and \`time_t\`.
All four variants (fractional) are supplied (mean values and
uncertainty). Manual correction of percentage of deuterium the protein
was exposed to during the exchange in theoretical calculations is
provided.

Methods of calculation and uncertainty are profoundly discussed in the
vignette.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`create_uptake_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_uptake_dataset.md)
[`calculate_confidence_limit_values`](https://hadexversum.github.io/HaDeX2/reference/calculate_confidence_limit_values.md)
[`add_stat_dependency`](https://hadexversum.github.io/HaDeX2/reference/add_stat_dependency.md)

## Examples

``` r
head(calculate_state_uptake(alpha_dat))
#>     Protein    Sequence Exposure Start End       State MaxUptake Modification
#> 1 db_eEF1Ba GFGDLKSPAGL        1     1  11 ALPHA_Gamma         9           NA
#> 2 db_eEF1Ba  FGDLKSPAGL        1     2  11 ALPHA_Gamma         8           NA
#> 3 db_eEF1Ba   GDLKSPAGL        1     3  11 ALPHA_Gamma         7           NA
#> 4 db_eEF1Ba      LKSPAG        1     5  10 ALPHA_Gamma         4           NA
#> 5 db_eEF1Ba     LKSPAGL        1     5  11 ALPHA_Gamma         5           NA
#> 6 db_eEF1Ba      AGLQVL        1     9  14 ALPHA_Gamma         5           NA
#>   frac_deut_uptake err_frac_deut_uptake deut_uptake err_deut_uptake
#> 1         31.26434            0.9842724   1.1779414      0.03520201
#> 2         55.16138            1.8959005   1.2928773      0.04425269
#> 3         55.03468            1.6368399   1.3274782      0.04011971
#> 4         49.78063            2.2253434   0.8577247      0.03897489
#> 5         49.11009            1.4982868   0.9622390      0.02979938
#> 6         20.49408            1.7389609   0.6691550      0.06028457
#>   theo_frac_deut_uptake err_theo_frac_deut_uptake theo_deut_uptake
#> 1             31.772784                 0.4298208        2.5923222
#> 2             44.516990                 0.5694457        3.2285460
#> 3             48.081013                 0.5628045        3.0511450
#> 4             34.926328                 1.0487918        1.2664969
#> 5             37.110129                 0.6431995        1.6821072
#> 6              5.666351                 1.0629184        0.2568412
#>   err_theo_deut_uptake Med_Sequence
#> 1           0.03506882          6.0
#> 2           0.04129842          6.5
#> 3           0.03571469          7.0
#> 4           0.03803124          7.5
#> 5           0.02915459          8.0
#> 6           0.04817937         11.5
                            
```
