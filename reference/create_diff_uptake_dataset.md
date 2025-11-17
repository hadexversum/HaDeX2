# Generate differential dataset

Calculates differential deuterium uptake values between two states.

## Usage

``` r
create_diff_uptake_dataset(
  dat,
  protein = unique(dat[["Protein"]])[1],
  state_1 = unique(dat[["State"]])[1],
  state_2 = unique(dat[["State"]])[2],
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

- state_1:

  biological state for chosen protein. From this state values the second
  state values are subtracted to get the deuterium uptake difference.

- state_2:

  biological state for chosen protein. This state values are subtracted
  from the first state values to get the deuterium uptake difference.

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

The function `create_diff_uptake_dataset` generates a dataset with
differential values between given biological states (state_1 - state_2).
For each peptide of chosen protein for time points of measurement
between minimal and maximal control time points of measurement deuterium
uptake difference, fractional deuterium uptake difference with respect
to controls or theoretical tabular values are calculated, with combined
and propagated uncertainty. Each peptide has an ID, based on its start
position. Function output can be visualized as a differential (Woods)
plot, butterfly differential plot or chiclet differential plot.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`calculate_diff_uptake`](https://hadexversum.github.io/HaDeX2/reference/calculate_diff_uptake.md)
[`plot_differential_butterfly`](https://hadexversum.github.io/HaDeX2/reference/plot_differential_butterfly.md)
[`plot_differential_chiclet`](https://hadexversum.github.io/HaDeX2/reference/plot_differential_chiclet.md)
[`plot_differential`](https://hadexversum.github.io/HaDeX2/reference/plot_differential.md)

## Examples

``` r
diff_uptake_dat <- create_diff_uptake_dataset(alpha_dat)
head(diff_uptake_dat)
#>   ID Exposure   Protein Start End MaxUptake Med_Sequence    Sequence
#> 1  1    0.167 db_eEF1Ba     1  11         9          6.0 GFGDLKSPAGL
#> 2  2    0.167 db_eEF1Ba     2  11         8          6.5  FGDLKSPAGL
#> 3  3    0.167 db_eEF1Ba     3  11         7          7.0   GDLKSPAGL
#> 4  4    0.167 db_eEF1Ba     5  10         4          7.5      LKSPAG
#> 5  5    0.167 db_eEF1Ba     5  11         5          8.0     LKSPAGL
#> 6  6    0.167 db_eEF1Ba     9  14         5         11.5      AGLQVL
#>   Modification diff_frac_deut_uptake err_diff_frac_deut_uptake diff_deut_uptake
#> 1           NA            1.23490646                 0.4904979      0.074472597
#> 2           NA           -0.66339760                 0.9028163     -0.028718113
#> 3           NA            0.63604010                 0.6879766      0.028522793
#> 4           NA           -0.04576019                 0.4744776     -0.001265667
#> 5           NA            5.11849900                 2.0657613      0.159790667
#> 6           NA            1.29121756                 3.1653660      0.045252333
#>   err_diff_deut_uptake diff_theo_frac_deut_uptake
#> 1           0.02076239                 0.91277301
#> 2           0.03494893                -0.39598134
#> 3           0.02552986                 0.44947217
#> 4           0.01288163                -0.03490343
#> 5           0.06447408                 3.52525231
#> 6           0.11087383                 0.99834299
#>   err_diff_theo_frac_deut_uptake diff_theo_deut_uptake
#> 1                      0.2544742           0.074472597
#> 2                      0.4818953          -0.028718113
#> 3                      0.4023085           0.028522793
#> 4                      0.3552381          -0.001265667
#> 5                      1.4224073           0.159790667
#> 6                      2.4460641           0.045252333
#>   err_diff_theo_deut_uptake
#> 1                0.02076239
#> 2                0.03494893
#> 3                0.02552986
#> 4                0.01288163
#> 5                0.06447408
#> 6                0.11087383
```
