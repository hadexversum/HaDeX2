# Create differential uptake dataset with p-value

Creates differential deuterium uptake dataset with P-value from
t-Student test for selected two biological states.

## Usage

``` r
create_p_diff_uptake_dataset(
  dat,
  diff_uptake_dat = NULL,
  protein = unique(dat[["Protein"]])[1],
  state_1 = unique(dat[["State"]])[1],
  state_2 = unique(dat[["State"]])[2],
  p_adjustment_method = "none",
  confidence_level = 0.98,
  time_0 = min(dat[["Exposure"]]),
  time_100 = max(dat[["Exposure"]]),
  deut_part = 0.9
)
```

## Arguments

- dat:

  data imported by the
  [`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
  function.

- diff_uptake_dat:

  differential uptake data

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

- time_0:

  minimal exchange control time point of measurement \[min\].

- time_100:

  maximal exchange control time point of measurement \[min\].

- deut_part:

  deuterium percentage in solution used in experiment, value from range
  \[0, 1\].

## Value

a [`data.frame`](https://rdrr.io/r/base/data.frame.html) object with
calculated deuterium uptake difference in different forms with their
uncertainty, P-value and -log(P-value) for the peptides from the
provided data.

## Details

For peptides in all of the time points of measurement (except for
minimal and maximal exchange control) the deuterium uptake difference
between state_1 and state_2 is calculated, with its uncertainty
(combined and propagated as described in \`Data processing\` article).
For each peptide in time point the P-value is calculated using unpaired
t-test. The deuterium uptake difference is calculated as the difference
of measured masses in a given time point for two states. The tested
hypothesis is that the mean masses for states from the replicates of the
experiment are similar. The P-values indicates if the null hypothesis
can be rejected - rejection of the hypothesis means that the difference
between states is statistically significant at provided confidence
level. The P-values can be adjusted using the provided method.

## References

Hageman, T. S. & Weis, D. D. Reliable Identification of Significant
Differences in Differential Hydrogen Exchange-Mass Spectrometry
Measurements Using a Hybrid Significance Testing Approach. Anal Chem 91,
8008–8016 (2019).

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`calculate_exp_masses_per_replicate`](https://hadexversum.github.io/HaDeX2/reference/calculate_exp_masses_per_replicate.md)

## Examples

``` r
p_diff_uptake_dat <- create_p_diff_uptake_dataset(alpha_dat)
head(p_diff_uptake_dat)
#>     Protein    Sequence Start End Exposure Modification ID MaxUptake
#> 1 db_eEF1Ba GFGDLKSPAGL     1  11    0.167           NA  1         9
#> 2 db_eEF1Ba GFGDLKSPAGL     1  11    1.000           NA  1         9
#> 3 db_eEF1Ba GFGDLKSPAGL     1  11    5.000           NA  1         9
#> 4 db_eEF1Ba GFGDLKSPAGL     1  11   25.000           NA  1         9
#> 5 db_eEF1Ba GFGDLKSPAGL     1  11  150.000           NA  1         9
#> 6 db_eEF1Ba GFGDLKSPAGL     1  11 1440.000           NA  1         9
#>   Med_Sequence diff_frac_deut_uptake err_diff_frac_deut_uptake diff_deut_uptake
#> 1            6           1.234906456                0.49049787       0.07447260
#> 2            6           7.739208705                0.87308467       0.43164420
#> 3            6           6.990918595                1.23236102       0.39465576
#> 4            6           9.408523973                2.13823364       0.53044168
#> 5            6           0.780359881                2.00916736       0.06695263
#> 6            6           0.006628648                0.01456231       0.02510190
#>   err_diff_deut_uptake diff_theo_frac_deut_uptake
#> 1           0.02076239                  0.9127730
#> 2           0.03913032                  5.2904450
#> 3           0.05731850                  4.8370964
#> 4           0.10681109                  6.5013558
#> 5           0.09457525                  0.8206046
#> 6           0.05514572                  0.3076613
#>   err_diff_theo_frac_deut_uptake diff_theo_deut_uptake
#> 1                      0.2544742            0.07447260
#> 2                      0.4796005            0.43164420
#> 3                      0.7025239            0.39465576
#> 4                      1.3091295            0.53044168
#> 5                      1.1591611            0.06695263
#> 6                      0.6758932            0.02510190
#>   err_diff_theo_deut_uptake     P_value log_p_value
#> 1                0.02076239 0.065344248   2.7280859
#> 2                0.03913032 0.001789245   6.3259618
#> 3                0.05731850          NA          NA
#> 4                0.10681109 0.023503782   3.7505939
#> 5                0.09457525 0.530754368   0.6334559
#> 6                0.05514572 0.672642212   0.3965417
```
