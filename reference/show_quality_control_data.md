# Show quality control data

Generates quality control data, based on the supplied parameters.

## Usage

``` r
show_quality_control_data(qc_dat)
```

## Arguments

- qc_dat:

  data produced by
  [`create_quality_control_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_quality_control_dataset.md)
  function, scaled if necessary.

## Value

a [`data.frame`](https://rdrr.io/r/base/data.frame.html) object.

## Details

This data frame presents the mean uncertainty in function of selected
maximal exchange control time of measurement. This data is available in
the GUI.

## See also

[`create_quality_control_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_quality_control_dataset.md)
[`plot_quality_control`](https://hadexversum.github.io/HaDeX2/reference/plot_quality_control.md)

## Examples

``` r
qc_dat <- create_quality_control_dataset(alpha_dat)  
show_quality_control_data(qc_dat)
#>   Out time Mean error - state 1 [%] Mean error - state 2 [%]
#> 1        1                     3.40                    34.52
#> 2        5                     3.93                     7.17
#> 3       25                     1.66                     4.93
#> 4      150                     1.24                     1.57
#> 5     1440                     0.72                     1.07
#>   Mean error of difference [%]
#> 1                        35.94
#> 2                         9.80
#> 3                         5.45
#> 4                         2.12
#> 5                         1.35
```
