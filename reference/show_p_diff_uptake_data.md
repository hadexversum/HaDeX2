# Differential deuterium uptake data

Present differential deuterium uptake values in selected form

## Usage

``` r
show_p_diff_uptake_data(
  p_diff_uptake_dat,
  theoretical = FALSE,
  fractional = FALSE,
  renamed = TRUE
)
```

## Arguments

- p_diff_uptake_dat:

  data produced by
  [`create_p_diff_uptake_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_p_diff_uptake_dataset.md)
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
dat <- read_hdx(system.file(package = "HaDeX", "HaDeX/data/KD_180110_CD160_HVEM.csv"))
p_diff_uptake_dat <- create_p_diff_uptake_dataset(dat)
head(show_p_diff_uptake_data(p_diff_uptake_dat))
#>     Protein    ID        Sequence Modification Start   End Exposure
#>      <char> <int>          <char>       <lgcl> <int> <int>    <num>
#> 1: db_CD160     1 INITSSASQEGTRLN           NA     1    15    0.001
#> 2: db_CD160     1 INITSSASQEGTRLN           NA     1    15    0.167
#> 3: db_CD160     1 INITSSASQEGTRLN           NA     1    15    1.000
#> 4: db_CD160     1 INITSSASQEGTRLN           NA     1    15    5.000
#> 5: db_CD160     1 INITSSASQEGTRLN           NA     1    15   25.000
#> 6: db_CD160     1 INITSSASQEGTRLN           NA     1    15  120.000
#>    Diff DU [Da] U(Diff DU) [Da] P value log(P value)
#>           <num>           <num>   <num>        <num>
#> 1:       0.0000          0.0000      NA           NA
#> 2:       0.3189          0.0460  0.0006       7.4571
#> 3:       0.3413          0.0969  0.0150       4.2002
#> 4:       0.5490          0.0825  0.0006       7.3645
#> 5:       0.6439          0.0549  0.0002       8.4948
#> 6:       0.1082          0.0856  0.2757       1.2885
```
