# Calculate kinetics dataset

Calculate kinetics of the hydrogen-deuteration exchange for given
peptide in multiple biological states.

## Usage

``` r
calculate_peptide_kinetics(
  dat,
  protein = dat[["Protein"]][1],
  sequence = dat[["Sequence"]][1],
  states = unique(dat[["State"]]),
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

  chosen protein.

- sequence:

  sequence of chosen peptide.

- states:

  vector of states (for chosen protein), for which the calculations are
  done.

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

Function `calculate_peptide_kinetics` calculates kinetic data for chosen
peptide in chosen biological states. It is a wrapper for
[`calculate_kinetics`](https://hadexversum.github.io/HaDeX2/reference/calculate_kinetics.md)
but for multiple states. The output of this function can be visualized
using
[`plot_uptake_curve`](https://hadexversum.github.io/HaDeX2/reference/plot_uptake_curve.md).
IMPORTANT! The kinetic data is often described as deuterium uptake curve
data. We use this terms interchangeable.

## See also

[`calculate_kinetics`](https://hadexversum.github.io/HaDeX2/reference/calculate_kinetics.md)
[`calculate_state_uptake`](https://hadexversum.github.io/HaDeX2/reference/calculate_state_uptake.md)
[`plot_uptake_curve`](https://hadexversum.github.io/HaDeX2/reference/plot_uptake_curve.md)

## Examples

``` r
# by default calculated for the first peptide from the peptide pool
calculate_peptide_kinetics(alpha_dat)
#>      Protein    Sequence Start End            State time_chosen Exposure
#> 1  db_eEF1Ba GFGDLKSPAGL     1  11      ALPHA_Gamma       0.167    0.167
#> 2  db_eEF1Ba GFGDLKSPAGL     1  11      ALPHA_Gamma       1.000    1.000
#> 3  db_eEF1Ba GFGDLKSPAGL     1  11      ALPHA_Gamma       5.000    5.000
#> 4  db_eEF1Ba GFGDLKSPAGL     1  11      ALPHA_Gamma      25.000   25.000
#> 5  db_eEF1Ba GFGDLKSPAGL     1  11      ALPHA_Gamma     150.000  150.000
#> 6  db_eEF1Ba GFGDLKSPAGL     1  11 ALPHA_beta_gamma       0.167    0.167
#> 7  db_eEF1Ba GFGDLKSPAGL     1  11 ALPHA_beta_gamma       1.000    1.000
#> 8  db_eEF1Ba GFGDLKSPAGL     1  11 ALPHA_beta_gamma       5.000    5.000
#> 9  db_eEF1Ba GFGDLKSPAGL     1  11 ALPHA_beta_gamma      25.000   25.000
#> 10 db_eEF1Ba GFGDLKSPAGL     1  11 ALPHA_beta_gamma     150.000  150.000
#> 11 db_eEF1Ba GFGDLKSPAGL     1  11       Alpha_KSCN       0.167    0.167
#> 12 db_eEF1Ba GFGDLKSPAGL     1  11       Alpha_KSCN       1.000    1.000
#> 13 db_eEF1Ba GFGDLKSPAGL     1  11       Alpha_KSCN       5.000    5.000
#> 14 db_eEF1Ba GFGDLKSPAGL     1  11       Alpha_KSCN      25.000   25.000
#> 15 db_eEF1Ba GFGDLKSPAGL     1  11       Alpha_KSCN     150.000  150.000
#>    Modification frac_deut_uptake err_frac_deut_uptake deut_uptake
#> 1            NA         30.64852            0.2215405    1.665053
#> 2            NA         52.33080            0.7419739    2.842995
#> 3            NA         66.17980            1.1520437    3.595375
#> 4            NA         86.30034            1.4632251    4.688471
#> 5            NA         98.61253            1.6349417    5.357359
#> 6            NA         29.41361            0.4376162    1.590581
#> 7            NA         44.59159            0.4601648    2.411351
#> 8            NA         59.18888            0.4376175    3.200719
#> 9            NA         76.89181            1.5591714    4.158029
#> 10           NA         97.83217            1.1677838    5.290407
#> 11           NA         32.40425            1.1841232    1.760438
#> 12           NA         51.02357            1.1197261    2.771976
#> 13           NA         62.88876            0.9298826    3.416581
#> 14           NA         84.59564            0.7741527    4.595859
#> 15           NA         96.98272            0.7264052    5.268816
#>    err_deut_uptake theo_frac_deut_uptake err_theo_frac_deut_uptake
#> 1      0.003059254              17.33535                0.03749574
#> 2      0.035068821              31.77278                0.42982083
#> 3      0.057318502              40.99432                0.70252393
#> 4      0.072421134              54.39185                0.88762927
#> 5      0.080539467              62.59008                0.98713157
#> 6      0.020535773              16.42258                0.25169660
#> 7      0.017359706              26.48234                0.21276916
#> 8      0.000000000              36.15723                0.00000000
#> 9      0.078509790              47.89049                0.96225485
#> 10     0.049576933              61.76948                0.60763943
#> 11     0.063142057              18.50443                0.77390031
#> 12     0.057662478              30.90235                0.70673987
#> 13     0.044514766              38.80294                0.54559501
#> 14     0.027139060              53.25675                0.33262975
#> 15     0.014163676              61.50485                0.17359702
#>    theo_deut_uptake err_theo_deut_uptake Med_Sequence
#> 1          1.414381          0.003059254            6
#> 2          2.592322          0.035068821            6
#> 3          3.344702          0.057318502            6
#> 4          4.437798          0.072421134            6
#> 5          5.106687          0.080539467            6
#> 6          1.339908          0.020535773            6
#> 7          2.160678          0.017359706            6
#> 8          2.950046          0.000000000            6
#> 9          3.907356          0.078509790            6
#> 10         5.039734          0.049576933            6
#> 11         1.509765          0.063142057            6
#> 12         2.521304          0.057662478            6
#> 13         3.165908          0.044514766            6
#> 14         4.345186          0.027139060            6
#> 15         5.018144          0.014163676            6
```
