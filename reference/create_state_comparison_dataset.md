# Creates comparison uptake dataset

Calculates deuterium uptake values for selected biological states in
selected time point of measurements.

## Usage

``` r
create_state_comparison_dataset(
  dat,
  protein = unique(dat[["Protein"]])[1],
  states = unique(dat[["State"]]),
  time_0 = min(dat[["Exposure"]]),
  time_t = unique(dat[["Exposure"]])[3],
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

  vector of states (for chosen protein), for which the calculations are
  done.

- time_0:

  minimal exchange control time point of measurement \[min\].

- time_t:

  time point of the measurement for which the calculations are done
  \[min\].

- time_100:

  maximal exchange control time point of measurement \[min\].

- deut_part:

  deuterium percentage in solution used in experiment, value from range
  \[0, 1\].

## Value

a [`data.frame`](https://rdrr.io/r/base/data.frame.html) object.

## Details

Function `create_state_comparison_dataset` is a wrapper for
[`calculate_state_uptake`](https://hadexversum.github.io/HaDeX2/reference/calculate_state_uptake.md)
function, calls this function for all (default) or chosen states in
states vector.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`calculate_state_uptake`](https://hadexversum.github.io/HaDeX2/reference/calculate_state_uptake.md)

## Examples

``` r
comparison_dat <- create_state_comparison_dataset(alpha_dat)
head(comparison_dat)
#>     Protein    Sequence Exposure Start End       State MaxUptake Modification
#> 1 db_eEF1Ba GFGDLKSPAGL        1     1  11 ALPHA_Gamma         9           NA
#> 2 db_eEF1Ba  FGDLKSPAGL        1     2  11 ALPHA_Gamma         8           NA
#> 3 db_eEF1Ba   GDLKSPAGL        1     3  11 ALPHA_Gamma         7           NA
#> 4 db_eEF1Ba      LKSPAG        1     5  10 ALPHA_Gamma         4           NA
#> 5 db_eEF1Ba     LKSPAGL        1     5  11 ALPHA_Gamma         5           NA
#> 6 db_eEF1Ba      AGLQVL        1     9  14 ALPHA_Gamma         5           NA
#>   frac_deut_uptake err_frac_deut_uptake deut_uptake err_deut_uptake
#> 1         52.33080            0.7419739   2.8429948      0.03506882
#> 2         75.72315            1.0628074   3.2780131      0.04129842
#> 3         75.81416            0.9153440   3.3998354      0.03571469
#> 4         68.71564            1.3799684   1.9005843      0.03803124
#> 5         68.05998            0.9359831   2.1247147      0.02915459
#> 6         25.92761            1.4087496   0.9086657      0.04817937
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
