# Prepares data export for HDX-Viewer

Prepares data export for HDX-Viewer

## Usage

``` r
prepare_hdxviewer_export(
  x_dat,
  differential = FALSE,
  fractional = TRUE,
  theoretical = FALSE,
  download = FALSE
)
```

## Arguments

- x_dat:

  one state deuterium uptake data or differential uptake data

- differential:

  indicator of x_dat type

- fractional:

  indicator if fractional values are used

- theoretical:

  indicator if theoretical values are used

- download:

  indicator if the result should be downloaded

## Examples

``` r
# \donttest{
# disabled due to long execution time and attempt to save a file

kin_dat <- create_uptake_dataset(alpha_dat, states = "Alpha_KSCN" )
aggregated_dat <- create_aggregated_uptake_dataset(kin_dat)
diff_uptake_dat <- create_diff_uptake_dataset(alpha_dat)
diff_aggregated_dat <- create_aggregated_diff_uptake_dataset(diff_uptake_dat)
prepare_hdxviewer_export(aggregated_dat, differential = FALSE)
#> Key: <Residues>
#>      Residues 10.02s 1500s  300s   60s 86400s 9000s
#>         <int>  <num> <num> <num> <num>  <num> <num>
#>   1:        1  0.324 0.846 0.629 0.510  0.014 0.970
#>   2:        2  0.545 0.926 0.834 0.745  0.012 0.984
#>   3:        3  0.624 0.957 0.900 0.827  0.010 0.990
#>   4:        4  0.624 0.957 0.900 0.827  0.010 0.990
#>   5:        5  0.662 0.973 0.958 0.892  0.007 0.993
#>  ---                                               
#> 217:      217  0.248 0.868 0.563 0.415  0.006 0.996
#> 218:      218  0.357 0.896 0.660 0.524  0.006 0.995
#> 219:      219  0.418 0.925 0.735 0.609  0.002 1.004
#> 220:      220  0.418 0.925 0.735 0.609  0.002 1.004
#> 221:      221  0.418 0.925 0.735 0.609  0.002 1.004
# prepare_hdxviewer_export(aggregated_dat, differential = TRUE) # shouldnt work
prepare_hdxviewer_export(diff_aggregated_dat, differential = TRUE)
#> Key: <Residues>
#>      Residues 10.02s 1500s  300s   60s 86400s  9000s
#>         <int>  <num> <num> <num> <num>  <num>  <num>
#>   1:        1  0.012 0.094 0.070 0.077      0  0.008
#>   2:        2  0.002 0.051 0.061 0.087      0 -0.014
#>   3:        3  0.004 0.039 0.055 0.092      0 -0.006
#>   4:        4  0.004 0.039 0.055 0.092      0 -0.006
#>   5:        5  0.014 0.029 0.058 0.094      0  0.001
#>  ---                                                
#> 217:      217  0.053 0.070 0.071 0.086      0 -0.001
#> 218:      218  0.018 0.068 0.070 0.085      0  0.000
#> 219:      219  0.017 0.081 0.059 0.087      0 -0.008
#> 220:      220  0.017 0.081 0.059 0.087      0 -0.008
#> 221:      221  0.017 0.081 0.059 0.087      0 -0.008
# prepare_hdxviewer_export(aggregated_dat, differential = FALSE, download = TRUE)
# }
```
