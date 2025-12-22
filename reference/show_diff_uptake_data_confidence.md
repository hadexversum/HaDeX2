# Differential uptake data with confidence

Present differential deuterium uptake values in selected form,
accompanied by the significance

## Usage

``` r
show_diff_uptake_data_confidence(
  diff_uptake_dat,
  theoretical = FALSE,
  fractional = FALSE,
  confidence_level = 0.98,
  hybrid = FALSE
)
```

## Arguments

- diff_uptake_dat:

  data produced by
  [`create_diff_uptake_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_diff_uptake_dataset.md)
  function

- theoretical:

  `logical`, indicator if values are calculated using theoretical
  controls

- fractional:

  `logical`, indicator if values are shown in fractional form

- confidence_level:

  confidence level for the test, from range \[0, 1\].

- hybrid:

  `logical`, indicator if the hybrid testing was applied in
  diff_uptake_dat.

## Value

a [`data.frame`](https://rdrr.io/r/base/data.frame.html) object

## Details

The function
[`show_uptake_data`](https://hadexversum.github.io/HaDeX2/reference/show_uptake_data.md)
generates a subsets of the uptake dat based on selected parameters. It
contains the information if the value is statistically significant at
selected confidence level. The numerical values are rounded to 4 places.
The names of columns are changed to user-friendly ones.

## See also

[`create_diff_uptake_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_diff_uptake_dataset.md)
[`plot_differential`](https://hadexversum.github.io/HaDeX2/reference/plot_differential.md)

## Examples

``` r
diff_uptake_dat <- create_diff_uptake_dataset(alpha_dat)
show_diff_uptake_data_confidence(diff_uptake_dat)
#>        Protein    Sequence    ID Modification Start   End Exposure Diff DU [Da]
#>         <char>      <char> <int>       <lgcl> <int> <int>    <num>        <num>
#>   1: db_eEF1Ba GFGDLKSPAGL     1           NA     1    11    0.167       0.0745
#>   2: db_eEF1Ba GFGDLKSPAGL     1           NA     1    11    1.000       0.4316
#>   3: db_eEF1Ba GFGDLKSPAGL     1           NA     1    11    5.000       0.3947
#>   4: db_eEF1Ba GFGDLKSPAGL     1           NA     1    11   25.000       0.5304
#>   5: db_eEF1Ba GFGDLKSPAGL     1           NA     1    11  150.000       0.0670
#>  ---                                                                           
#> 632: db_eEF1Ba       DVAAF   106           NA   217   221    1.000       0.1729
#> 633: db_eEF1Ba       DVAAF   106           NA   217   221    5.000       0.1173
#> 634: db_eEF1Ba       DVAAF   106           NA   217   221   25.000       0.1597
#> 635: db_eEF1Ba       DVAAF   106           NA   217   221  150.000      -0.0166
#> 636: db_eEF1Ba       DVAAF   106           NA   217   221 1440.000       0.0000
#>      U(Diff DU) [Da] Valid At 0.98
#>                <num>        <lgcl>
#>   1:          0.0208          TRUE
#>   2:          0.0391          TRUE
#>   3:          0.0573          TRUE
#>   4:          0.1068          TRUE
#>   5:          0.0946          TRUE
#>  ---                              
#> 632:          0.0266          TRUE
#> 633:          0.0057          TRUE
#> 634:          0.0318          TRUE
#> 635:          0.0132          TRUE
#> 636:          0.0075         FALSE
```
