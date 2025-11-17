# Calculate the value of confidence limit

Calculates confidence limit values for prepared provided, based on
chosen parameters.

## Usage

``` r
calculate_confidence_limit_values(
  diff_uptake_dat,
  confidence_level = 0.98,
  theoretical = FALSE,
  fractional = TRUE,
  n_rep = NULL
)
```

## Arguments

- diff_uptake_dat:

  processed data from DynamX file - using prepare_dataset

- confidence_level:

  confidence level for the test, from range \[0, 1\]

- theoretical:

  `logical`, determines if values are theoretical

- fractional:

  `logical`, determines if values are fractional

- n_rep:

  number of replicates

## Value

range of confidence limit interval

## Details

Function `calculate_confidence_limit_values` calculates confidence limit
using Houde test. The confidence limits are calculated on whole provided
dataset. If the user wishes to calculate confidence limit for one, two
or more time points, the provided data should be adjusted accordingly.

## References

Houde, D., Berkowitz, S.A., and Engen, J.R. (2011). The Utility of
Hydrogen/Deuterium Exchange Mass Spectrometry in Biopharmaceutical
Comparability Studies. J Pharm Sci 100, 2071–2086.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`calculate_diff_uptake`](https://hadexversum.github.io/HaDeX2/reference/calculate_diff_uptake.md)
[`create_diff_uptake_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_diff_uptake_dataset.md)

## Examples

``` r
diff_uptake_dat <- calculate_diff_uptake(alpha_dat)
calculate_confidence_limit_values(diff_uptake_dat)
#> [1] -0.9335823  0.9335823
                              
```
