# Create uptake dataset for multiple states

Calculates deuterium uptake values for selected biological states in
multiple time points of measurements.

## Usage

``` r
create_uptake_dataset(
  dat,
  protein = unique(dat[["Protein"]])[1],
  states = unique(dat[["State"]]),
  time_0 = min(dat[["Exposure"]]),
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

- states:

  list of biological states for chosen protein.

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

Function `create_uptake_dataset` generates a dataset with deuterium
uptake values in different forms. For each peptide in chosen protein in
chosen states for time points of measurement between minimal and maximal
control time points of measurement deuterium uptake, fractional
deuterium uptake with respect to controls or theoretical tabular values
are calculated, with combined and propagated uncertainty. Each peptide
has an ID, based on its start position. This function is a wrapper for
[`create_state_uptake_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_state_uptake_dataset.md)
but for multiple states. The output of this function can be presented in
a form of comparison plot.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`calculate_state_uptake`](https://hadexversum.github.io/HaDeX2/reference/calculate_state_uptake.md)
[`create_state_uptake_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_state_uptake_dataset.md)

## Examples

``` r
uptake_dat <- create_uptake_dataset(alpha_dat, states = c("Alpha_KSCN", "ALPHA_Gamma"))
head(uptake_dat)
#>     Protein    Sequence Exposure Start End      State MaxUptake Modification
#> 1 db_eEF1Ba GFGDLKSPAGL    0.167     1  11 Alpha_KSCN         9           NA
#> 2 db_eEF1Ba  FGDLKSPAGL    0.167     2  11 Alpha_KSCN         8           NA
#> 3 db_eEF1Ba   GDLKSPAGL    0.167     3  11 Alpha_KSCN         7           NA
#> 4 db_eEF1Ba      LKSPAG    0.167     5  10 Alpha_KSCN         4           NA
#> 5 db_eEF1Ba     LKSPAGL    0.167     5  11 Alpha_KSCN         5           NA
#> 6 db_eEF1Ba      AGLQVL    0.167     9  14 Alpha_KSCN         5           NA
#>   frac_deut_uptake err_frac_deut_uptake deut_uptake err_deut_uptake
#> 1         32.40425            1.1841232    1.760438      0.06314206
#> 2         74.06056            0.7801511    3.206041      0.02733533
#> 3         75.44149            1.1145377    3.383123      0.04574589
#> 4         69.12906            1.2950988    1.912019      0.03567309
#> 5         69.60422            1.2252841    2.172923      0.03819919
#> 6         31.23305            0.6744664    1.094601      0.01974822
#>   theo_frac_deut_uptake err_theo_frac_deut_uptake theo_deut_uptake
#> 1             18.504430                 0.7739003        1.5097652
#> 2             43.524594                 0.3769147        3.1565736
#> 3             47.817653                 0.7208798        3.0344326
#> 4             35.241663                 0.9837608        1.2779315
#> 5             38.173687                 0.8427387        1.7303155
#> 6              9.768406                 0.4356792        0.4427769
#>   err_theo_deut_uptake Med_Sequence
#> 1           0.06314206          6.0
#> 2           0.02733533          6.5
#> 3           0.04574589          7.0
#> 4           0.03567309          7.5
#> 5           0.03819919          8.0
#> 6           0.01974822         11.5
```
