# Deuterium uptake data

Present deuterium uptake values in selected form

## Usage

``` r
show_uptake_data(
  uptake_dat,
  theoretical = FALSE,
  fractional = FALSE,
  renamed = TRUE
)
```

## Arguments

- uptake_dat:

  data produced by
  [`create_uptake_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_uptake_dataset.md)
  function or
  [`create_state_uptake_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_state_uptake_dataset.md)

- theoretical:

  `logical`, indicator if values are calculated using theoretical
  controls

- fractional:

  `logical`, indicator if values are shown in fractional form

- renamed:

  `logical`, indicator if the names of the columns are renamed to
  user-friendly ones. Currently FALSE not implemented.

## Value

a [`data.frame`](https://rdrr.io/r/base/data.frame.html) object

## Details

The function `show_uptake_data` generates a subsets of the uptake_dat
based on selected parameters. The numerical values are rounded to 4
places. The names of columns are changed to user-friendly ones.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`create_uptake_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_uptake_dataset.md)

## Examples

``` r
uptake_dat <- create_uptake_dataset(alpha_dat)
show_uptake_data(uptake_dat)
#>         Protein    Sequence    ID Modification       State Start   End Exposure
#>          <char>      <char> <int>       <lgcl>      <char> <int> <int>    <num>
#>    1: db_eEF1Ba GFGDLKSPAGL     1           NA ALPHA_Gamma     1    11    0.167
#>    2: db_eEF1Ba GFGDLKSPAGL     1           NA ALPHA_Gamma     1    11    1.000
#>    3: db_eEF1Ba GFGDLKSPAGL     1           NA ALPHA_Gamma     1    11    5.000
#>    4: db_eEF1Ba GFGDLKSPAGL     1           NA ALPHA_Gamma     1    11   25.000
#>    5: db_eEF1Ba GFGDLKSPAGL     1           NA ALPHA_Gamma     1    11  150.000
#>   ---                                                                          
#> 1904: db_eEF1Ba       DVAAF   106           NA  Alpha_KSCN   217   221    1.000
#> 1905: db_eEF1Ba       DVAAF   106           NA  Alpha_KSCN   217   221    5.000
#> 1906: db_eEF1Ba       DVAAF   106           NA  Alpha_KSCN   217   221   25.000
#> 1907: db_eEF1Ba       DVAAF   106           NA  Alpha_KSCN   217   221  150.000
#> 1908: db_eEF1Ba       DVAAF   106           NA  Alpha_KSCN   217   221 1440.000
#>       DU [Da] U(DU) [Da]
#>         <num>      <num>
#>    1:  1.6651     0.0031
#>    2:  2.8430     0.0351
#>    3:  3.5954     0.0573
#>    4:  4.6885     0.0724
#>    5:  5.3574     0.0805
#>   ---                   
#> 1904:  1.2078     0.0259
#> 1905:  1.4583     0.0190
#> 1906:  1.8349     0.0254
#> 1907:  1.9907     0.0123
#> 1908:  1.9832     0.0053
```
