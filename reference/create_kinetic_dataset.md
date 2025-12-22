# Create kinetics dataset for a list of peptides and their states

Generates the data set of deuterium uptake between selected time points
based on supplied peptide list.

## Usage

``` r
create_kinetic_dataset(
  dat,
  peptide_list,
  protein = dat[["Protein"]][1],
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

- peptide_list:

  list of peptides for the calculation.

- protein:

  chosen protein.

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

This is a wrapper for
[`calculate_kinetics`](https://hadexversum.github.io/HaDeX2/reference/calculate_kinetics.md),
but for the peptide list instead of one peptide.

## See also

[`calculate_kinetics`](https://hadexversum.github.io/HaDeX2/reference/calculate_kinetics.md)
[`calculate_state_uptake`](https://hadexversum.github.io/HaDeX2/reference/calculate_state_uptake.md)
[`plot_uptake_curve`](https://hadexversum.github.io/HaDeX2/reference/plot_uptake_curve.md)

## Examples

``` r
peptide_list <- data.frame(Sequence = c("GFGDLKSPAGL", "FGDLKSPAGL"), 
                           state = c("ALPHA_Gamma", "ALPHA_Gamma"), 
                           start = c(1, 2), end = c(11, 11))
create_kinetic_dataset(alpha_dat, peptide_list)
#>      Protein    Sequence Start End       State time_chosen Exposure
#> 1  db_eEF1Ba GFGDLKSPAGL     1  11 ALPHA_Gamma       0.167    0.167
#> 2  db_eEF1Ba GFGDLKSPAGL     1  11 ALPHA_Gamma       1.000    1.000
#> 3  db_eEF1Ba GFGDLKSPAGL     1  11 ALPHA_Gamma       5.000    5.000
#> 4  db_eEF1Ba GFGDLKSPAGL     1  11 ALPHA_Gamma      25.000   25.000
#> 5  db_eEF1Ba GFGDLKSPAGL     1  11 ALPHA_Gamma     150.000  150.000
#> 6  db_eEF1Ba  FGDLKSPAGL     2  11 ALPHA_Gamma       0.167    0.167
#> 7  db_eEF1Ba  FGDLKSPAGL     2  11 ALPHA_Gamma       1.000    1.000
#> 8  db_eEF1Ba  FGDLKSPAGL     2  11 ALPHA_Gamma       5.000    5.000
#> 9  db_eEF1Ba  FGDLKSPAGL     2  11 ALPHA_Gamma      25.000   25.000
#> 10 db_eEF1Ba  FGDLKSPAGL     2  11 ALPHA_Gamma     150.000  150.000
#>    Modification frac_deut_uptake err_frac_deut_uptake deut_uptake
#> 1            NA         30.64852            0.2215405    1.665053
#> 2            NA         52.33080            0.7419739    2.842995
#> 3            NA         66.17980            1.1520437    3.595375
#> 4            NA         86.30034            1.4632251    4.688471
#> 5            NA         98.61253            1.6349417    5.357359
#> 6            NA         45.85727            0.4640503    1.985136
#> 7            NA         75.72315            1.0628074    3.278013
#> 8            NA         96.20056            1.3997159    4.164469
#> 9            NA        101.19132            0.6729931    4.380516
#> 10           NA         98.28129            1.1013566    4.254543
#>    err_deut_uptake theo_frac_deut_uptake err_theo_frac_deut_uptake
#> 1      0.003059254              17.33535                0.03749574
#> 2      0.035068821              31.77278                0.42982083
#> 3      0.057318502              40.99432                0.70252393
#> 4      0.072421134              54.39185                0.88762927
#> 5      0.080539467              62.59008                0.98713157
#> 6      0.015897816              26.69008                0.21920794
#> 7      0.041298425              44.51699                0.56944568
#> 8      0.054843616              56.73993                0.75621432
#> 9      0.010697310              59.71891                0.14750046
#> 10     0.039754336              57.98192                0.54815492
#>    theo_deut_uptake err_theo_deut_uptake Med_Sequence
#> 1          1.414381          0.003059254          6.0
#> 2          2.592322          0.035068821          6.0
#> 3          3.344702          0.057318502          6.0
#> 4          4.437798          0.072421134          6.0
#> 5          5.106687          0.080539467          6.0
#> 6          1.935669          0.015897816          6.5
#> 7          3.228546          0.041298425          6.5
#> 8          4.115002          0.054843616          6.5
#> 9          4.331049          0.010697310          6.5
#> 10         4.205075          0.039754336          6.5
```
