# Show peptide charge measurement

Show the charge measurements from replicates for peptide in specific
time point.

## Usage

``` r
show_peptide_charge_measurement(
  dat,
  protein = dat[["Protein"]][1],
  state = dat[["State"]][1],
  sequence = dat[["Sequence"]][1],
  time_t = unique(dat[["Exposure"]])[3]
)
```

## Arguments

- dat:

  data as imported by the
  [`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
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

This function shows the measurements of charge from different replicates
for specific peptide in specific state in specific time point of
measurement.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`plot_peptide_charge_measurement`](https://hadexversum.github.io/HaDeX2/reference/plot_peptide_charge_measurement.md)

## Examples

``` r
show_peptide_charge_measurement(alpha_dat)
#>      Protein    Sequence Start   End       State Exposure
#>       <char>      <char> <int> <int>      <char>    <num>
#> 1: db_eEF1Ba GFGDLKSPAGL     1    11 ALPHA_Gamma        1
#> 2: db_eEF1Ba GFGDLKSPAGL     1    11 ALPHA_Gamma        1
#> 3: db_eEF1Ba GFGDLKSPAGL     1    11 ALPHA_Gamma        1
#> 4: db_eEF1Ba GFGDLKSPAGL     1    11 ALPHA_Gamma        1
#> 5: db_eEF1Ba GFGDLKSPAGL     1    11 ALPHA_Gamma        1
#> 6: db_eEF1Ba GFGDLKSPAGL     1    11 ALPHA_Gamma        1
#>                                     File     z
#>                                   <char> <int>
#> 1: Tania_161108_1eEF1Bag_compl_KSCN_1min     1
#> 2: Tania_161108_2eEF1Bag_compl_KSCN_1min     1
#> 3: Tania_161108_3eEF1Bag_compl_KSCN_1min     1
#> 4: Tania_161108_1eEF1Bag_compl_KSCN_1min     2
#> 5: Tania_161108_2eEF1Bag_compl_KSCN_1min     2
#> 6: Tania_161108_3eEF1Bag_compl_KSCN_1min     2
```
