# Calculate differential uptake

Calculates differential deuterium uptake between two selected biological
states.

## Usage

``` r
calculate_diff_uptake(
  dat,
  protein = unique(dat[["Protein"]][1]),
  states = unique(dat[["State"]])[1:2],
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
  function

- protein:

  chosen protein

- states:

  vector of two states for chosen protein. Order is important, as the
  deuterium uptake difference is calculated as state_1 - state_2

- time_0:

  minimal exchange control time point of measurement \[min\]

- time_t:

  time point of the measurement for which the calculations are done
  \[min\]

- time_100:

  maximal exchange control time point of measurement \[min\]

- deut_part:

  deuterium percentage in solution used in experiment, value from range
  \[0, 1\]

## Value

a [`data.frame`](https://rdrr.io/r/base/data.frame.html) object.

## Details

Function `calculate_diff_uptake` calculates differential values based on
provided criteria for peptides for chosen protein in selected states.
The methods of calculation of deuterium uptake difference, fractional
deuterium uptake difference with respect to minimal/maximal exchange
controls or theoretical tabular values are thoroughly described in the
\`Data processing\` article, as well as law of propagation of
uncertainty, used to calculate uncertainty.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`calculate_state_uptake`](https://hadexversum.github.io/HaDeX2/reference/calculate_state_uptake.md)

## Examples

``` r
diff_dat <- calculate_diff_uptake(alpha_dat)
head(diff_dat)
#>     Protein Start End MaxUptake Med_Sequence    Sequence Exposure Modification
#> 1 db_eEF1Ba     1  11         9          6.0 GFGDLKSPAGL        1           NA
#> 2 db_eEF1Ba     2  11         8          6.5  FGDLKSPAGL        1           NA
#> 3 db_eEF1Ba     3  11         7          7.0   GDLKSPAGL        1           NA
#> 4 db_eEF1Ba     5  10         4          7.5      LKSPAG        1           NA
#> 5 db_eEF1Ba     5  11         5          8.0     LKSPAGL        1           NA
#> 6 db_eEF1Ba     9  14         5         11.5      AGLQVL        1           NA
#>   diff_frac_deut_uptake err_diff_frac_deut_uptake diff_deut_uptake
#> 1              7.739209                 0.8730847        0.4316442
#> 2              9.485526                 1.2148237        0.4106231
#> 3              9.954930                 1.4161479        0.4464222
#> 4             11.304104                 1.6267043        0.3126567
#> 5              7.422823                 2.0256317        0.2317277
#> 6             10.155951                 1.4919668        0.3559280
#>   err_diff_deut_uptake diff_theo_frac_deut_uptake
#> 1           0.03913032                   5.290445
#> 2           0.04516371                   5.661900
#> 3           0.05757340                   7.034877
#> 4           0.04479526                   8.622168
#> 5           0.06318272                   5.112304
#> 6           0.05074159                   7.852374
#>   err_diff_theo_frac_deut_uptake diff_theo_deut_uptake
#> 1                      0.4796005             0.4316442
#> 2                      0.6227424             0.4106231
#> 3                      0.9072618             0.4464222
#> 4                      1.2353239             0.3126567
#> 5                      1.3939177             0.2317277
#> 6                      1.1194452             0.3559280
#>   err_diff_theo_deut_uptake ID
#> 1                0.03913032  1
#> 2                0.04516371  2
#> 3                0.05757340  3
#> 4                0.04479526  4
#> 5                0.06318272  5
#> 6                0.05074159  6
```
