# Calculate measured mass for each replicate of the experiment

Calculate the measured mass from partial results, per each replicate of
the experiment.

## Usage

``` r
calculate_exp_masses_per_replicate(dat)
```

## Arguments

- dat:

  data as imported by the
  [`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
  function

## Value

a [`data.frame`](https://rdrr.io/r/base/data.frame.html) object.

## Details

Each replicate of the experiment generates measurements of the mass for
obtained charge values for the peptide. This is an effect of the
properties of mass spectrometry, that measures the mass to charge ratio
(learn more about Mass Spectrometry in the documentation). The possible
charge values depend on the sequence of the peptide. The separate
measurement (for each replicate in given state in given time point) can
be distinguished by the \`File\` value.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`calculate_exp_masses`](https://hadexversum.github.io/HaDeX2/reference/calculate_exp_masses.md)
[`calculate_state_uptake`](https://hadexversum.github.io/HaDeX2/reference/calculate_state_uptake.md)

## Examples

``` r
head(calculate_exp_masses_per_replicate(alpha_dat))
#>      Protein       State    Sequence Start   End      MHP MaxUptake Exposure
#>       <char>      <char>      <char> <int> <int>    <num>     <int>    <num>
#> 1: db_eEF1Ba ALPHA_Gamma GFGDLKSPAGL     1    11 1061.563         9    0.000
#> 2: db_eEF1Ba ALPHA_Gamma GFGDLKSPAGL     1    11 1061.563         9    0.167
#> 3: db_eEF1Ba ALPHA_Gamma GFGDLKSPAGL     1    11 1061.563         9    0.167
#> 4: db_eEF1Ba ALPHA_Gamma GFGDLKSPAGL     1    11 1061.563         9    0.167
#> 5: db_eEF1Ba ALPHA_Gamma GFGDLKSPAGL     1    11 1061.563         9    1.000
#> 6: db_eEF1Ba ALPHA_Gamma GFGDLKSPAGL     1    11 1061.563         9    1.000
#>                                     File Modification avg_exp_mass
#>                                   <char>       <lgcl>        <num>
#> 1:     Tania_161112_eEF1Ba_KSCN_IMS_seq1           NA     1061.312
#> 2:      Tania_161109_1eEF1Bag_KSCN_10sec           NA     1062.983
#> 3:      Tania_161109_2eEF1Bag_KSCN_10sec           NA     1062.974
#> 4:      Tania_161109_3eEF1Bag_KSCN_10sec           NA     1062.973
#> 5: Tania_161108_1eEF1Bag_compl_KSCN_1min           NA     1064.191
#> 6: Tania_161108_2eEF1Bag_compl_KSCN_1min           NA     1064.085
```
