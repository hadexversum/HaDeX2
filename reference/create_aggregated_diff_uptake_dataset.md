# Calculates aggregated uptake difference for peptide pool

This is a wrapper function for
[`calculate_aggregated_diff_uptake`](https://hadexversum.github.io/HaDeX2/reference/calculate_aggregated_diff_uptake.md),
which calculates aggregated differential uptake for only one time point.
This function returns values for all time points from
\`diff_uptake_dat\`.

## Usage

``` r
create_aggregated_diff_uptake_dataset(diff_uptake_dat)
```

## Arguments

- diff_uptake_dat:

  differential uptake data, product of e.q.
  [`create_diff_uptake_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_diff_uptake_dataset.md)

## Value

a [`data.frame`](https://rdrr.io/r/base/data.frame.html) object

## Examples

``` r
# \donttest{
# disabled due to long execution time 

diff_uptake_dat <- create_diff_uptake_dataset(alpha_dat)
head(create_aggregated_diff_uptake_dataset(diff_uptake_dat))
#>   position aa diff_frac_deut_uptake err_diff_frac_deut_uptake diff_deut_uptake
#> 1        1  G             1.2349065                 0.4904979       0.07447260
#> 2        2  F             0.2299220                 0.5307790       0.01984222
#> 3        3  G             0.3830136                 0.4202586       0.02311448
#> 4        4  D             0.3830136                 0.4202586       0.02311448
#> 5        5  L             1.3962052                 0.5529766       0.04873693
#> 6        6  K             1.3962052                 0.5529766       0.04873693
#>   err_diff_deut_uptake diff_theo_frac_deut_uptake
#> 1           0.02076239                  0.9127730
#> 2           0.02092370                  0.2199031
#> 3           0.01620374                  0.3064422
#> 4           0.01620374                  0.3064422
#> 5           0.01766158                  0.9800815
#> 6           0.01766158                  0.9800815
#>   err_diff_theo_frac_deut_uptake diff_theo_deut_uptake
#> 1                      0.2544742            0.07447260
#> 2                      0.2818287            0.01984222
#> 3                      0.2320153            0.02311448
#> 4                      0.2320153            0.02311448
#> 5                      0.3748293            0.04873693
#> 6                      0.3748293            0.04873693
#>   err_diff_theo_deut_uptake Exposure
#> 1                0.02076239    0.167
#> 2                0.02092370    0.167
#> 3                0.01620374    0.167
#> 4                0.01620374    0.167
#> 5                0.01766158    0.167
#> 6                0.01766158    0.167
# }
```
