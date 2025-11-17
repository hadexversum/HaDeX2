# Create p-value dataset

Create p-value dataset

## Usage

``` r
calculate_p_value(
  dat,
  protein = unique(dat[["Protein"]])[1],
  state_1 = unique(dat[["State"]])[1],
  state_2 = unique(dat[["State"]])[2],
  p_adjustment_method = "none",
  confidence_level = 0.98
)
```

## Arguments

- dat:

  data imported by the
  [`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
  function.

- protein:

  chosen protein.

- state_1:

  biological state for chosen protein. From this state values the second
  state values are subtracted to get the deuterium uptake difference.

- state_2:

  biological state for chosen protein. This state values are subtracted
  from the first state values to get the deuterium uptake difference.

- p_adjustment_method:

  method of adjustment P-values for multiple comparisons. Possible
  methods: "BH" (Benjamini & Hochberg correction), "bonferroni"
  (Bonferroni correction) and "none" (default).

- confidence_level:

  confidence level for the t-test.

## Value

a [`data.frame`](https://rdrr.io/r/base/data.frame.html) object.

## Details

This function calculates P-value based on the supplied data. Unpaired
t-Student test (with supplied parameters) is used to establish if the
null hypothesis (there is no difference between measured mass values
between two selected biological states) can be rejected, based on the
experimental mass values from replicates of the experiment - for peptide
in given time point of measurement. For the peptides that have only one
replicate of the measurement (in any state) the P-value cannot be
calculated and is assigned with NA value.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`calculate_exp_masses_per_replicate`](https://hadexversum.github.io/HaDeX2/reference/calculate_exp_masses_per_replicate.md)
[`plot_volcano`](https://hadexversum.github.io/HaDeX2/reference/plot_volcano.md)
[`create_diff_uptake_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_diff_uptake_dataset.md)
[`create_p_diff_uptake_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_p_diff_uptake_dataset.md)

## Examples

``` r
p_dat <- calculate_p_value(alpha_dat)
head(p_dat)
#>      Protein    Sequence Exposure Modification Start   End     P_value
#>       <char>      <char>    <num>       <lgcl> <int> <int>       <num>
#> 1: db_eEF1Ba GFGDLKSPAGL    0.000           NA     1    11          NA
#> 2: db_eEF1Ba GFGDLKSPAGL    0.167           NA     1    11 0.065344248
#> 3: db_eEF1Ba GFGDLKSPAGL    1.000           NA     1    11 0.001789245
#> 4: db_eEF1Ba GFGDLKSPAGL    5.000           NA     1    11          NA
#> 5: db_eEF1Ba GFGDLKSPAGL   25.000           NA     1    11 0.023503782
#> 6: db_eEF1Ba GFGDLKSPAGL  150.000           NA     1    11 0.530754368
#>    log_p_value
#>          <num>
#> 1:          NA
#> 2:   2.7280859
#> 3:   6.3259618
#> 4:          NA
#> 5:   3.7505939
#> 6:   0.6334559
```
