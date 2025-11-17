# Back exchange estimation

Calculates back-exchange for a state

## Usage

``` r
calculate_back_exchange(
  dat,
  protein = dat[["Protein"]][1],
  states = unique(dat[["State"]]),
  time_100 = max(dat[["Exposure"]])
)
```

## Arguments

- dat:

  data imported by the
  [`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
  function

- protein:

  selected protein

- states:

  selected biological states for given protein

- time_100:

  time point of measurement for fully deuterated sample

## Value

a [`data.frame`](https://rdrr.io/r/base/data.frame.html) object

## Details

Back-exchange is a reverse exchange phenomenon, important to acknowledge
when working with HDX data. This function calculates back-exchange
values for one biological state of the selected protein. For
visualization of back-exchange data use
[`plot_coverage_heatmap`](https://hadexversum.github.io/HaDeX2/reference/plot_coverage_heatmap.md)
with displayed value specified as \`back-exchange\`. For the definition
of back-exchange see the \`vignette("datafiles")\`.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`plot_coverage_heatmap`](https://hadexversum.github.io/HaDeX2/reference/plot_coverage_heatmap.md)

## Examples

``` r
head(calculate_back_exchange(alpha_dat))
#>     Protein Start End       State    Sequence Modification back_exchange
#> 1 db_eEF1Ba     1  11 ALPHA_Gamma GFGDLKSPAGL           NA      36.48605
#> 2 db_eEF1Ba     2  11 ALPHA_Gamma  FGDLKSPAGL           NA      40.99218
#> 3 db_eEF1Ba     3  11 ALPHA_Gamma   GDLKSPAGL           NA      34.82752
#> 4 db_eEF1Ba     5  10 ALPHA_Gamma      LKSPAG           NA      41.21163
#> 5 db_eEF1Ba     5  11 ALPHA_Gamma     LKSPAGL           NA      40.89189
#> 6 db_eEF1Ba     9  14 ALPHA_Gamma      AGLQVL           NA      37.06240
#>   err_back_exchange
#> 1        0.46550621
#> 2        0.36925011
#> 3        0.42056545
#> 4        0.12960786
#> 5        0.06323022
#> 6        0.91755764
```
