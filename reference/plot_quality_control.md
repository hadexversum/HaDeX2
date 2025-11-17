# Plot quality control data

Generates quality control plot based on supplied data.

## Usage

``` r
plot_quality_control(qc_dat)
```

## Arguments

- qc_dat:

  data produced by
  [`create_quality_control_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_quality_control_dataset.md)
  function, scaled if necessary.

## Value

a `ggplot2` object.

## Details

This plot presents the mean uncertainty in function of selected maximal
exchange control time of measurement. This plot is visible in GUI.

## See also

[`create_quality_control_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_quality_control_dataset.md)
[`show_quality_control_data`](https://hadexversum.github.io/HaDeX2/reference/show_quality_control_data.md)

## Examples

``` r
dat <- read_hdx(system.file(package = "HaDeX", "HaDeX/data/KD_180110_CD160_HVEM.csv"))
#> [1] ""
qc_dat <- create_quality_control_dataset(dat)  
plot_quality_control(qc_dat)

```
