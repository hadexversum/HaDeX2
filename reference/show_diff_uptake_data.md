# Differential deuterium uptake data

Present differential deuterium uptake values in selected form

## Usage

``` r
show_diff_uptake_data(
  diff_uptake_dat,
  theoretical = FALSE,
  fractional = FALSE,
  renamed = TRUE
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

- renamed:

  `logical`, indicator if the names of the columns are renamed to
  user-friendly ones. Currently FALSE not implemented.

## Value

a [`data.frame`](https://rdrr.io/r/base/data.frame.html) object

## Details

The function
[`show_uptake_data`](https://hadexversum.github.io/HaDeX2/reference/show_uptake_data.md)
generates a subsets of the diff_uptake_dat based on selected parameters.
The numerical values are rounded to 4 places. The names of columns are
changed to user-friendly ones.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`create_diff_uptake_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_diff_uptake_dataset.md)

## Examples

``` r
diff_uptake_dat <- create_diff_uptake_dataset(alpha_dat)
head(show_diff_uptake_data(diff_uptake_dat))
#>      Protein    ID    Sequence Modification Start   End Exposure Diff DU [Da]
#>       <char> <int>      <char>       <lgcl> <int> <int>    <num>        <num>
#> 1: db_eEF1Ba     1 GFGDLKSPAGL           NA     1    11    0.167       0.0745
#> 2: db_eEF1Ba     1 GFGDLKSPAGL           NA     1    11    1.000       0.4316
#> 3: db_eEF1Ba     1 GFGDLKSPAGL           NA     1    11    5.000       0.3947
#> 4: db_eEF1Ba     1 GFGDLKSPAGL           NA     1    11   25.000       0.5304
#> 5: db_eEF1Ba     1 GFGDLKSPAGL           NA     1    11  150.000       0.0670
#> 6: db_eEF1Ba     1 GFGDLKSPAGL           NA     1    11 1440.000       0.0251
#>    U(Diff DU) [Da]
#>              <num>
#> 1:          0.0208
#> 2:          0.0391
#> 3:          0.0573
#> 4:          0.1068
#> 5:          0.0946
#> 6:          0.0551
```
