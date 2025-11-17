# Calculates confidence limits

Returns relation with confidence limits for each peptide.

## Usage

``` r
add_stat_dependency(
  calc_dat,
  confidence_level = 0.98,
  theoretical = FALSE,
  fractional = TRUE
)
```

## Arguments

- calc_dat:

  data produced by
  [`calculate_diff_uptake`](https://hadexversum.github.io/HaDeX2/reference/calculate_diff_uptake.md)
  function.

- confidence_level:

  confidence limit - from range \[0, 1\].

- theoretical:

  `logical`, determines if values are theoretical.

- fractional:

  `logical`, determines if values are fractional.

## Value

calc_dat extended by column specifying if given peptide is relevant in
given confidence limit. The value of the confidence limit is added as an
attribute - as well as parameters used to calculate
(theoretical/fractional).

## Details

This function checks if the values are statistically significant based
on provided criteria using Houde test.

## Examples

``` r
calc_dat <- calculate_diff_uptake(alpha_dat)
result <- add_stat_dependency(calc_dat)
head(result)                            
#>     Protein Start End MaxUptake Med_Sequence    Sequence Exposure Modification
#> 1 db_eEF1Ba     1  11         9          6.0 GFGDLKSPAGL        1           NA
#> 2 db_eEF1Ba     2  11         8          6.5  FGDLKSPAGL        1           NA
#> 3 db_eEF1Ba     3  11         7          7.0   GDLKSPAGL        1           NA
#> 4 db_eEF1Ba     5  10         4          7.5      LKSPAG        1           NA
#> 5 db_eEF1Ba     5  11         5          8.0     LKSPAGL        1           NA
#> 6 db_eEF1Ba     9  14         5         11.5      AGLQVL        1           NA
#>   diff_frac_deut_uptake err_diff_frac_deut_uptake diff_deut_uptake
#> 1              7.739209                 0.8730847        0.4316442
#> 2              9.485526                 1.2148237        0.4106231
#> 3              9.954930                 1.4161479        0.4464222
#> 4             11.304104                 1.6267043        0.3126567
#> 5              7.422823                 2.0256317        0.2317277
#> 6             10.155951                 1.4919668        0.3559280
#>   err_diff_deut_uptake diff_theo_frac_deut_uptake
#> 1           0.03913032                   5.290445
#> 2           0.04516371                   5.661900
#> 3           0.05757340                   7.034877
#> 4           0.04479526                   8.622168
#> 5           0.06318272                   5.112304
#> 6           0.05074159                   7.852374
#>   err_diff_theo_frac_deut_uptake diff_theo_deut_uptake
#> 1                      0.4796005             0.4316442
#> 2                      0.6227424             0.4106231
#> 3                      0.9072618             0.4464222
#> 4                      1.2353239             0.3126567
#> 5                      1.3939177             0.2317277
#> 6                      1.1194452             0.3559280
#>   err_diff_theo_deut_uptake ID valid_at_0.98
#> 1                0.03913032  1          TRUE
#> 2                0.04516371  2          TRUE
#> 3                0.05757340  3          TRUE
#> 4                0.04479526  4          TRUE
#> 5                0.06318272  5          TRUE
#> 6                0.05074159  6          TRUE
```
