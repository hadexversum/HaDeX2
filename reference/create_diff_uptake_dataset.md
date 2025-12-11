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
#>   ID Exposure   Protein    Sequence Start End MaxUptake Modification
#> 1  1    0.167 db_eEF1Ba GFGDLKSPAGL     1  11         9           NA
#> 2  1    1.000 db_eEF1Ba GFGDLKSPAGL     1  11         9           NA
#> 3  1    5.000 db_eEF1Ba GFGDLKSPAGL     1  11         9           NA
#> 4  1   25.000 db_eEF1Ba GFGDLKSPAGL     1  11         9           NA
#> 5  1  150.000 db_eEF1Ba GFGDLKSPAGL     1  11         9           NA
#> 6  1 1440.000 db_eEF1Ba GFGDLKSPAGL     1  11         9           NA
#>   Med_Sequence     State_1 frac_deut_uptake_1 err_frac_deut_uptake_1
#> 1            6 ALPHA_Gamma          30.648518             0.22154053
#> 2            6 ALPHA_Gamma          52.330800             0.74197387
#> 3            6 ALPHA_Gamma          66.179800             1.15204366
#> 4            6 ALPHA_Gamma          86.300338             1.46322512
#> 5            6 ALPHA_Gamma          98.612529             1.63494174
#> 6            6 ALPHA_Gamma           1.434621             0.01002946
#>   deut_uptake_1 err_deut_uptake_1 theo_frac_deut_uptake_1
#> 1      1.665053       0.003059254                17.33535
#> 2      2.842995       0.035068821                31.77278
#> 3      3.595375       0.057318502                40.99432
#> 4      4.688471       0.072421134                54.39185
#> 5      5.357359       0.080539467                62.59008
#> 6      5.432737       0.037980370                63.51395
#>   err_theo_frac_deut_uptake_1 theo_deut_uptake_1 err_theo_deut_uptake_1
#> 1                  0.03749574           1.414381            0.003059254
#> 2                  0.42982083           2.592322            0.035068821
#> 3                  0.70252393           3.344702            0.057318502
#> 4                  0.88762927           4.437798            0.072421134
#> 5                  0.98713157           5.106687            0.080539467
#> 6                  0.46550621           5.182064            0.037980370
#>            State_2 frac_deut_uptake_2 err_frac_deut_uptake_2 deut_uptake_2
#> 1 ALPHA_beta_gamma          29.413612             0.43761622      1.590581
#> 2 ALPHA_beta_gamma          44.591592             0.46016476      2.411351
#> 3 ALPHA_beta_gamma          59.188881             0.43761754      3.200719
#> 4 ALPHA_beta_gamma          76.891814             1.55917136      4.158029
#> 5 ALPHA_beta_gamma          97.832169             1.16778379      5.290407
#> 6 ALPHA_beta_gamma           1.427992             0.01055797      5.407635
#>   err_deut_uptake_2 theo_frac_deut_uptake_2 err_theo_frac_deut_uptake_2
#> 1        0.02053577                16.42258                   0.2516966
#> 2        0.01735971                26.48234                   0.2127692
#> 3        0.00000000                36.15723                   0.0000000
#> 4        0.07850979                47.89049                   0.9622549
#> 5        0.04957693                61.76948                   0.6076394
#> 6        0.03998177                63.20629                   0.4900363
#>   theo_deut_uptake_2 err_theo_deut_uptake_2 diff_frac_deut_uptake
#> 1           1.339908             0.02053577           1.234906456
#> 2           2.160678             0.01735971           7.739208705
#> 3           2.950046             0.00000000           6.990918595
#> 4           3.907356             0.07850979           9.408523973
#> 5           5.039734             0.04957693           0.780359881
#> 6           5.156963             0.03998177           0.006628648
#>   err_diff_frac_deut_uptake diff_deut_uptake err_diff_deut_uptake
#> 1                0.49049787       0.07447260           0.02076239
#> 2                0.87308467       0.43164420           0.03913032
#> 3                1.23236102       0.39465576           0.05731850
#> 4                2.13823364       0.53044168           0.10681109
#> 5                2.00916736       0.06695263           0.09457525
#> 6                0.01456231       0.02510190           0.05514572
#>   diff_theo_frac_deut_uptake err_diff_theo_frac_deut_uptake
#> 1                  0.9127730                      0.2544742
#> 2                  5.2904450                      0.4796005
#> 3                  4.8370964                      0.7025239
#> 4                  6.5013558                      1.3091295
#> 5                  0.8206046                      1.1591611
#> 6                  0.3076613                      0.6758932
#>   diff_theo_deut_uptake err_diff_theo_deut_uptake
#> 1            0.07447260                0.02076239
#> 2            0.43164420                0.03913032
#> 3            0.39465576                0.05731850
#> 4            0.53044168                0.10681109
#> 5            0.06695263                0.09457525
#> 6            0.02510190                0.05514572
```
