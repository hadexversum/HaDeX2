# Create uptake dataset for multiple states

Calculates deuterium uptake values for selected biological states in
multiple time points of measurements.

## Usage

``` r
create_uptake_dataset(
  dat,
  protein = unique(dat[["Protein"]])[1],
  states = unique(dat[["State"]]),
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

- protein:

  chosen protein.

- states:

  list of biological states for chosen protein.

- time_0:

  minimal exchange control time point of measurement \[min\].

- time_100:

  maximal exchange control time point of measurement \[min\].

- deut_part:

  deuterium percentage in solution used in experiment, value from range
  \[0, 1\].

## Value

a [`data.frame`](https://rdrr.io/r/base/data.frame.html) object.

## Details

Function `create_uptake_dataset` generates a dataset with deuterium
uptake values in different forms. For each peptide in chosen protein in
chosen states for time points of measurement between minimal and maximal
control time points of measurement deuterium uptake, fractional
deuterium uptake with respect to controls or theoretical tabular values
are calculated, with combined and propagated uncertainty. Each peptide
has an ID, based on its start position. This function is a wrapper for
[`create_state_uptake_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_state_uptake_dataset.md)
but for multiple states. The output of this function can be presented in
a form of comparison plot.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`calculate_state_uptake`](https://hadexversum.github.io/HaDeX2/reference/calculate_state_uptake.md)
[`create_state_uptake_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_state_uptake_dataset.md)

## Examples

``` r
dat <- read_hdx(system.file(package = "HaDeX", "HaDeX/data/KD_180110_CD160_HVEM.csv"))
#> [1] ""
uptake_dat <- create_uptake_dataset(dat, states = c("CD160", "CD160_HVEM"))
head(uptake_dat)
#>    Protein        Sequence Exposure Start End State MaxUptake Modification
#> 1 db_CD160 INITSSASQEGTRLN    0.001     1  15 CD160        14           NA
#> 2 db_CD160          LICTVW    0.001    16  21 CD160         5           NA
#> 3 db_CD160  LICTVWHKKEEAEG    0.001    16  29 CD160        13           NA
#> 4 db_CD160   ICTVWHKKEEAEG    0.001    17  29 CD160        12           NA
#> 5 db_CD160           FVVFL    0.001    30  34 CD160         4           NA
#> 6 db_CD160 LCKDRSGDCSPETSL    0.001    34  48 CD160        13           NA
#>   frac_deut_uptake err_frac_deut_uptake  deut_uptake err_deut_uptake
#> 1       0.36935223         0.0012947000  0.038605737               0
#> 2       0.03033506         0.0001481620  0.000888387               0
#> 3       0.34405201         0.0033762717  0.026403750               0
#> 4      -0.85967318         0.0058949102 -0.063096279               0
#> 5       1.31196247         0.0076786534  0.030796000               0
#> 6       0.23854825         0.0003776673  0.017958220               0
#>   theo_frac_deut_uptake err_theo_frac_deut_uptake theo_deut_uptake
#> 1            -0.4493436                         0      -0.05702927
#> 2           -10.9156277                         0      -0.49477747
#> 3             0.5814308                         0       0.06852240
#> 4            -0.7130478                         0      -0.07756952
#> 5           -16.5250744                         0      -0.59923147
#> 6             0.3030472                         0       0.03571452
#>   err_theo_deut_uptake Med_Sequence
#> 1                    0          8.0
#> 2                    0         18.5
#> 3                    0         22.5
#> 4                    0         23.0
#> 5                    0         32.0
#> 6                    0         41.0
```
