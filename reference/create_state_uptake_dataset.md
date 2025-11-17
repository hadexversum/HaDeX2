# Create uptake dataset for chosen state

Calculates deuterium uptake values for one biological state.

## Usage

``` r
create_state_uptake_dataset(
  dat,
  protein = unique(dat[["Protein"]])[1],
  state = (dat[["State"]])[1],
  time_0 = min(dat[dat[["Exposure"]] > 0, ][["Exposure"]]),
  time_100 = max(dat[["Exposure"]]),
  deut_part = 0.9
)
```

## Arguments

- dat:

  data imported by the
  [`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
  function.

- protein:

  chosen protein.

- state:

  biological state for chosen protein.

- time_0:

  minimal exchange control time point of measurement \[min\].

- time_100:

  maximal exchange control time point of measurement \[min\].

- deut_part:

  deuterium percentage in solution used in experiment, value from range
  \[0, 1\].

## Value

a [`data.frame`](https://rdrr.io/r/base/data.frame.html) object.

## Details

The function
[`create_uptake_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_uptake_dataset.md)
generates a dataset with deuterium uptake values in different forms. For
each peptide in chosen protein in chosen state for time points of
measurement between minimal and maximal control time points of
measurement deuterium uptake, fractional deuterium uptake with respect
to controls or theoretical tabular values are calculated, with combined
and propagated uncertainty. Each peptide has an ID, based on its start
position. This data can be presented in a form of comparison plot,
butterfly plot or chiclet plot.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`calculate_state_uptake`](https://hadexversum.github.io/HaDeX2/reference/calculate_state_uptake.md)

## Examples

``` r
state_uptake_dat <- create_state_uptake_dataset(alpha_dat)
head(state_uptake_dat)
#>   ID Exposure   Protein    Sequence Start End       State MaxUptake
#> 1  1        1 db_eEF1Ba GFGDLKSPAGL     1  11 ALPHA_Gamma         9
#> 2  2        1 db_eEF1Ba  FGDLKSPAGL     2  11 ALPHA_Gamma         8
#> 3  3        1 db_eEF1Ba   GDLKSPAGL     3  11 ALPHA_Gamma         7
#> 4  4        1 db_eEF1Ba      LKSPAG     5  10 ALPHA_Gamma         4
#> 5  5        1 db_eEF1Ba     LKSPAGL     5  11 ALPHA_Gamma         5
#> 6  6        1 db_eEF1Ba      AGLQVL     9  14 ALPHA_Gamma         5
#>   Modification frac_deut_uptake err_frac_deut_uptake deut_uptake
#> 1           NA         31.26434            0.9842724   1.1779414
#> 2           NA         55.16138            1.8959005   1.2928773
#> 3           NA         55.03468            1.6368399   1.3274782
#> 4           NA         49.78063            2.2253434   0.8577247
#> 5           NA         49.11009            1.4982868   0.9622390
#> 6           NA         20.49408            1.7389609   0.6691550
#>   err_deut_uptake theo_frac_deut_uptake err_theo_frac_deut_uptake
#> 1      0.03520201             31.772784                 0.4298208
#> 2      0.04425269             44.516990                 0.5694457
#> 3      0.04011971             48.081013                 0.5628045
#> 4      0.03897489             34.926328                 1.0487918
#> 5      0.02979938             37.110129                 0.6431995
#> 6      0.06028457              5.666351                 1.0629184
#>   theo_deut_uptake err_theo_deut_uptake Med_Sequence
#> 1        2.5923222           0.03506882          6.0
#> 2        3.2285460           0.04129842          6.5
#> 3        3.0511450           0.03571469          7.0
#> 4        1.2664969           0.03803124          7.5
#> 5        1.6821072           0.02915459          8.0
#> 6        0.2568412           0.04817937         11.5
```
