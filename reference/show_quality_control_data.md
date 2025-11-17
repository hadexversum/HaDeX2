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
dat <- read_hdx(system.file(package = "HaDeX", "HaDeX/data/KD_180110_CD160_HVEM.csv"))
#> [1] ""
qc_dat <- create_quality_control_dataset(dat)  
show_quality_control_data(qc_dat)
#>   Out time Mean error - state 1 [%] Mean error - state 2 [%]
#> 1    0.167                     0.01                     0.02
#> 2    1.000                     0.01                     0.02
#> 3    5.000                     0.01                     0.01
#> 4   25.000                     0.00                     0.01
#> 5  120.000                     0.00                     0.00
#> 6 1440.000                     0.00                     0.00
#>   Mean error of difference [%]
#> 1                         0.02
#> 2                         0.02
#> 3                         0.01
#> 4                         0.01
#> 5                         0.00
#> 6                         0.00
```
