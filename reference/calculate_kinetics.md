# Calculate kinetics data

Calculate kinetics of the hydrogen-deuteration exchange for given
peptide in given state.

## Usage

``` r
calculate_kinetics(
  dat,
  protein = dat[["Protein"]][1],
  sequence = dat[["Sequence"]][1],
  state = dat[["State"]][1],
  start = dat[["Start"]][1],
  end = dat[["End"]][1],
  time_0 = min(dat[["Exposure"]]),
  time_100 = max(dat[["Exposure"]]),
  deut_part = 0.9
)
```

## Arguments

- dat:

  dat data imported by the
  [`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
  function.

- protein:

  protein chosen protein.

- sequence:

  sequence of chosen peptide.

- state:

  biological state of chosen peptide.

- start:

  start position of chosen peptide.

- end:

  end position of chosen peptide.

- time_0:

  minimal exchange control time point of measurement.

- time_100:

  maximal exchange control time point of measurement.

- deut_part:

  deuterium percentage in solution used in experiment, value from range
  \[0, 1\].

## Value

a [`data.frame`](https://rdrr.io/r/base/data.frame.html) object.

## Details

The function calculates deuteration data for all available data points
for given peptide in chosen biological state.. All four variants
(relative & theoretical combinations) of deuterium uptake computations
are supported. Manual correction of percentage of deuterium the protein
was exposed to during the exchange in theoretical calculations is
provided. To visualize obtained data we recommend using
[`plot_uptake_curve`](https://hadexversum.github.io/HaDeX2/reference/plot_uptake_curve.md)
function. The first version doesn't support filled Modification and
Fragment columns. IMPORTANT! The kinetic data is often described as
deuterium uptake curve data. We use this terms interchangeable.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`calculate_state_uptake`](https://hadexversum.github.io/HaDeX2/reference/calculate_state_uptake.md)
[`plot_uptake_curve`](https://hadexversum.github.io/HaDeX2/reference/plot_uptake_curve.md)

## Examples

``` r
# by default: for the first peptide
calculate_kinetics(alpha_dat)
#>     Protein    Sequence Start End       State time_chosen Exposure Modification
#> 1 db_eEF1Ba GFGDLKSPAGL     1  11 ALPHA_Gamma       0.167    0.167           NA
#> 2 db_eEF1Ba GFGDLKSPAGL     1  11 ALPHA_Gamma       1.000    1.000           NA
#> 3 db_eEF1Ba GFGDLKSPAGL     1  11 ALPHA_Gamma       5.000    5.000           NA
#> 4 db_eEF1Ba GFGDLKSPAGL     1  11 ALPHA_Gamma      25.000   25.000           NA
#> 5 db_eEF1Ba GFGDLKSPAGL     1  11 ALPHA_Gamma     150.000  150.000           NA
#>   frac_deut_uptake err_frac_deut_uptake deut_uptake err_deut_uptake
#> 1         30.64852            0.2215405    1.665053     0.003059254
#> 2         52.33080            0.7419739    2.842995     0.035068821
#> 3         66.17980            1.1520437    3.595375     0.057318502
#> 4         86.30034            1.4632251    4.688471     0.072421134
#> 5         98.61253            1.6349417    5.357359     0.080539467
#>   theo_frac_deut_uptake err_theo_frac_deut_uptake theo_deut_uptake
#> 1              17.33535                0.03749574         1.414381
#> 2              31.77278                0.42982083         2.592322
#> 3              40.99432                0.70252393         3.344702
#> 4              54.39185                0.88762927         4.437798
#> 5              62.59008                0.98713157         5.106687
#>   err_theo_deut_uptake Med_Sequence
#> 1          0.003059254            6
#> 2          0.035068821            6
#> 3          0.057318502            6
#> 4          0.072421134            6
#> 5          0.080539467            6
       
```
