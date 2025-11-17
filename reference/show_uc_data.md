# Deuterium uptake curve data

Present deuterium uptake curve data

## Usage

``` r
show_uc_data(uc_dat, theoretical = FALSE, fractional = FALSE)
```

## Arguments

- uc_dat:

  calculated kinetic data by
  [`calculate_kinetics`](https://hadexversum.github.io/HaDeX2/reference/calculate_kinetics.md)
  or
  [`calculate_peptide_kinetics`](https://hadexversum.github.io/HaDeX2/reference/calculate_peptide_kinetics.md)
  or
  [`create_kinetic_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_kinetic_dataset.md)
  function

- theoretical:

  `logical`, indicator if values are calculated using theoretical
  controls

- fractional:

  `logical`, indicator if values are shown in fractional form

## Value

a [`data.frame`](https://rdrr.io/r/base/data.frame.html) object

## Details

The function
[`show_uptake_data`](https://hadexversum.github.io/HaDeX2/reference/show_uptake_data.md)
generates a subsets of the uc_dat based on selected parameters. The
numerical values are rounded to 4 places. The names of columns are
changed to user-friendly ones.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`calculate_kinetics`](https://hadexversum.github.io/HaDeX2/reference/calculate_kinetics.md)
[`calculate_peptide_kinetics`](https://hadexversum.github.io/HaDeX2/reference/calculate_peptide_kinetics.md)

## Examples

``` r
uc_dat <- calculate_kinetics(alpha_dat,
                             sequence = "GFGDLKSPAGL", 
                             state = "ALPHA_Gamma",
                             start = 1, end = 11)
show_uc_data(uc_dat)
#>     Protein    Sequence       State Start End Time Point DU [Da] Err DU [Da]
#> 1 db_eEF1Ba GFGDLKSPAGL ALPHA_Gamma     1  11      0.167  1.6651      0.0031
#> 2 db_eEF1Ba GFGDLKSPAGL ALPHA_Gamma     1  11      1.000  2.8430      0.0351
#> 3 db_eEF1Ba GFGDLKSPAGL ALPHA_Gamma     1  11      5.000  3.5954      0.0573
#> 4 db_eEF1Ba GFGDLKSPAGL ALPHA_Gamma     1  11     25.000  4.6885      0.0724
#> 5 db_eEF1Ba GFGDLKSPAGL ALPHA_Gamma     1  11    150.000  5.3574      0.0805
```
