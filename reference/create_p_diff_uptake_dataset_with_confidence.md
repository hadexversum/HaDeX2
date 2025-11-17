# Create differential dataset with statistical validity

Create differential dataset with statistical validity

## Usage

``` r
create_p_diff_uptake_dataset_with_confidence(
  p_diff_uptake_dat,
  houde_interval = NULL,
  houde_interval_times = NULL,
  theoretical = FALSE,
  fractional = FALSE
)
```

## Arguments

- p_diff_uptake_dat:

  differential uptake data alongside the P-value as calculated by
  [`create_p_diff_uptake_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_p_diff_uptake_dataset.md)

- houde_interval:

  interval value, as calculated by
  [`calculate_confidence_limit_values`](https://hadexversum.github.io/HaDeX2/reference/calculate_confidence_limit_values.md)

- houde_interval_times:

  specified time points to be used in calculcation

- theoretical:

  `logical`, determines if values are theoretical

- fractional:

  `logical`, determines if values are fractional

## Value

a [`data.frame`](https://rdrr.io/r/base/data.frame.html) object.

## Details

Function provides additional information on statistical relevance based
on supplied data.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`create_p_diff_uptake_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_p_diff_uptake_dataset.md)
[`calculate_confidence_limit_values`](https://hadexversum.github.io/HaDeX2/reference/calculate_confidence_limit_values.md)

## Examples

``` r
p_diff_uptake_dat <- create_p_diff_uptake_dataset(alpha_dat)
p_diff_uptake_dat_confidence <- create_p_diff_uptake_dataset_with_confidence(p_diff_uptake_dat)
head(p_diff_uptake_dat_confidence)
#>     Protein    Sequence Start End Exposure Modification ID MaxUptake
#> 1 db_eEF1Ba GFGDLKSPAGL     1  11    0.167           NA  1         9
#> 2 db_eEF1Ba GFGDLKSPAGL     1  11    1.000           NA  1         9
#> 3 db_eEF1Ba GFGDLKSPAGL     1  11    5.000           NA  1         9
#> 4 db_eEF1Ba GFGDLKSPAGL     1  11   25.000           NA  1         9
#> 5 db_eEF1Ba GFGDLKSPAGL     1  11  150.000           NA  1         9
#> 6 db_eEF1Ba GFGDLKSPAGL     1  11 1440.000           NA  1         9
#>   Med_Sequence diff_frac_deut_uptake err_diff_frac_deut_uptake diff_deut_uptake
#> 1            6           1.234906456                0.49049787       0.07447260
#> 2            6           7.739208705                0.87308467       0.43164420
#> 3            6           6.990918595                1.23236102       0.39465576
#> 4            6           9.408523973                2.13823364       0.53044168
#> 5            6           0.780359881                2.00916736       0.06695263
#> 6            6           0.006628648                0.01456231       0.02510190
#>   err_diff_deut_uptake diff_theo_frac_deut_uptake
#> 1           0.02076239                  0.9127730
#> 2           0.03913032                  5.2904450
#> 3           0.05731850                  4.8370964
#> 4           0.10681109                  6.5013558
#> 5           0.09457525                  0.8206046
#> 6           0.05514572                  0.3076613
#>   err_diff_theo_frac_deut_uptake diff_theo_deut_uptake
#> 1                      0.2544742            0.07447260
#> 2                      0.4796005            0.43164420
#> 3                      0.7025239            0.39465576
#> 4                      1.3091295            0.53044168
#> 5                      1.1591611            0.06695263
#> 6                      0.6758932            0.02510190
#>   err_diff_theo_deut_uptake     P_value log_p_value valid
#> 1                0.02076239 0.065344248   2.7280859 FALSE
#> 2                0.03913032 0.001789245   6.3259618  TRUE
#> 3                0.05731850          NA          NA    NA
#> 4                0.10681109 0.023503782   3.7505939 FALSE
#> 5                0.09457525 0.530754368   0.6334559 FALSE
#> 6                0.05514572 0.672642212   0.3965417 FALSE
```
