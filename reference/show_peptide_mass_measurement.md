# Show peptide mass measurement

Show the mass measurements from replicates for peptide in specific time
point.

## Usage

``` r
show_peptide_mass_measurement(
  rep_mass_dat,
  protein = rep_mass_dat[["Protein"]][1],
  state = rep_mass_dat[["State"]][1],
  sequence = rep_mass_dat[["Sequence"]][1],
  time_t = unique(rep_mass_dat[["Exposure"]])[3]
)
```

## Arguments

- rep_mass_dat:

  data produced by
  [`calculate_exp_masses_per_replicate`](https://hadexversum.github.io/HaDeX2/reference/calculate_exp_masses_per_replicate.md)
  function.

- protein:

  chosen protein.

- state:

  biological state for chosen protein.

- sequence:

  sequence of chosen peptide.

- time_t:

  time point of the measurement.

## Value

a [`data.frame`](https://rdrr.io/r/base/data.frame.html) object.

## Details

This function shows the measurements of mass from different replicates
for specific peptide in specific state in specific time point of
measurement.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`calculate_exp_masses_per_replicate`](https://hadexversum.github.io/HaDeX2/reference/calculate_exp_masses_per_replicate.md)
[`calculate_exp_masses`](https://hadexversum.github.io/HaDeX2/reference/calculate_exp_masses.md)
[`calculate_state_uptake`](https://hadexversum.github.io/HaDeX2/reference/calculate_state_uptake.md)
[`calculate_diff_uptake`](https://hadexversum.github.io/HaDeX2/reference/calculate_diff_uptake.md)

## Examples

``` r
rep_mass_dat <- calculate_exp_masses_per_replicate(alpha_dat)
show_peptide_mass_measurement(rep_mass_dat)
#>     Protein    Sequence Start End Exposure       State
#> 1 db_eEF1Ba GFGDLKSPAGL     1  11        1 ALPHA_Gamma
#> 2 db_eEF1Ba GFGDLKSPAGL     1  11        1 ALPHA_Gamma
#> 3 db_eEF1Ba GFGDLKSPAGL     1  11        1 ALPHA_Gamma
#>                                    File     Mass
#> 1 Tania_161108_1eEF1Bag_compl_KSCN_1min 1064.191
#> 2 Tania_161108_2eEF1Bag_compl_KSCN_1min 1064.085
#> 3 Tania_161108_3eEF1Bag_compl_KSCN_1min 1064.188
```
