# Calculates aggregated deuterium uptake for one time point

Function aggregates the deuterium uptake values from peptide level into
single-amino resolution using \`weighted approach\` (defined in
\`vignette("datafiles"))\`. For visualization use
[`plot_aggregated_uptake`](https://hadexversum.github.io/HaDeX2/reference/plot_aggregated_uptake.md)

## Usage

``` r
calculate_aggregated_uptake(
  kin_dat,
  state = unique(kin_dat[["State"]])[1],
  time_t
)
```

## Arguments

- kin_dat:

  single state uptake data, product of e.q.
  [`create_uptake_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_uptake_dataset.md)

- state:

  state included in calculations

- time_t:

  chosen time point

## Value

a [`data.frame`](https://rdrr.io/r/base/data.frame.html) object

## Examples

``` r
dat <- read_hdx(system.file(package = "HaDeX", "HaDeX/data/KD_180110_CD160_HVEM.csv"))
kin_dat <- create_uptake_dataset(alpha_dat, states = "Alpha_KSCN")
head(create_aggregated_uptake_dataset(kin_dat))
#>   position aa frac_deut_uptake err_frac_deut_uptake deut_uptake err_deut_uptake
#> 1        1  G         32.40425             1.088174    1.760438      0.06314206
#> 2        2  F         54.45759             1.401526    2.525757      0.03305064
#> 3        3  G         62.36775             1.754654    2.848953      0.02685878
#> 4        4  D         62.36775             1.754654    2.848953      0.02685878
#> 5        5  L         66.15272             2.366262    2.403291      0.01874680
#> 6        6  K         66.15272             2.366262    2.403291      0.01874680
#>   theo_frac_deut_uptake err_theo_frac_deut_uptake theo_deut_uptake
#> 1              18.50443                 0.7739003         1.509765
#> 2              31.75040                 0.4152717         2.381605
#> 3              37.80716                 0.3752152         2.627697
#> 4              37.80716                 0.3752152         2.627697
#> 5              37.12189                 0.3984766         2.004130
#> 6              37.12189                 0.3984766         2.004130
#>   err_theo_deut_uptake Exposure
#> 1           0.06314206    0.167
#> 2           0.03305064    0.167
#> 3           0.02685878    0.167
#> 4           0.02685878    0.167
#> 5           0.01874680    0.167
#> 6           0.01874680    0.167
```
