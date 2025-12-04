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
dat <- read_hdx(system.file(package = "HaDeX2", "HaDeX/data/KD_180110_CD160_HVEM.csv"))
diff_uptake_dat <- create_diff_uptake_dataset(dat)
show_diff_uptake_data_confidence(diff_uptake_dat)
#>       Protein        Sequence    ID Modification Start   End Exposure
#>        <char>          <char> <int>       <lgcl> <int> <int>    <num>
#>   1: db_CD160 INITSSASQEGTRLN     1           NA     1    15    0.001
#>   2: db_CD160 INITSSASQEGTRLN     1           NA     1    15    0.167
#>   3: db_CD160 INITSSASQEGTRLN     1           NA     1    15    1.000
#>   4: db_CD160 INITSSASQEGTRLN     1           NA     1    15    5.000
#>   5: db_CD160 INITSSASQEGTRLN     1           NA     1    15   25.000
#>  ---                                                                 
#> 283: db_CD160        FSHNEGTL    41           NA   125   132    1.000
#> 284: db_CD160        FSHNEGTL    41           NA   125   132    5.000
#> 285: db_CD160        FSHNEGTL    41           NA   125   132   25.000
#> 286: db_CD160        FSHNEGTL    41           NA   125   132  120.000
#> 287: db_CD160        FSHNEGTL    41           NA   125   132 1440.000
#>      Diff DU [Da] U(Diff DU) [Da] Valid At 0.98
#>             <num>           <num>        <lgcl>
#>   1:       0.0000          0.0000         FALSE
#>   2:       0.3189          0.0460          TRUE
#>   3:       0.3413          0.0969          TRUE
#>   4:       0.5490          0.0825          TRUE
#>   5:       0.6439          0.0549          TRUE
#>  ---                                           
#> 283:      -0.0731          0.0377          TRUE
#> 284:      -0.0177          0.0221          TRUE
#> 285:       0.0456          0.0247          TRUE
#> 286:       0.0818          0.0418          TRUE
#> 287:       0.0057          0.0477         FALSE
```
