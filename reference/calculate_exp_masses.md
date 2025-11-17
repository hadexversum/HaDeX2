# Calculate measured mass, aggregated from the replicates of the experiment

Calculate the measured mass (with the uncertainty of the measurement) as
aggregated data from the replicates of the experiment.

## Usage

``` r
calculate_exp_masses(dat)
```

## Arguments

- dat:

  data as imported by the
  [`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
  function

## Value

a [`data.frame`](https://rdrr.io/r/base/data.frame.html) object.

## Details

Each measurement is repeated at least three times to obtain reliable
result and to calculate uncertainty of the measurement. For more
information on how the data is aggregated or how the uncertainty is
calculated, see the documentation.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`calculate_exp_masses_per_replicate`](https://hadexversum.github.io/HaDeX2/reference/calculate_exp_masses_per_replicate.md)
[`calculate_state_uptake`](https://hadexversum.github.io/HaDeX2/reference/calculate_state_uptake.md)

## Examples

``` r
calculate_exp_masses(alpha_dat)
#>         Protein       State    Sequence Start   End       MHP Exposure
#>          <char>      <char>      <char> <int> <int>     <num>    <num>
#>    1: db_eEF1Ba ALPHA_Gamma GFGDLKSPAGL     1    11 1061.5626    0.000
#>    2: db_eEF1Ba ALPHA_Gamma GFGDLKSPAGL     1    11 1061.5626    0.167
#>    3: db_eEF1Ba ALPHA_Gamma GFGDLKSPAGL     1    11 1061.5626    1.000
#>    4: db_eEF1Ba ALPHA_Gamma GFGDLKSPAGL     1    11 1061.5626    5.000
#>    5: db_eEF1Ba ALPHA_Gamma GFGDLKSPAGL     1    11 1061.5626   25.000
#>   ---                                                                 
#> 2222: db_eEF1Ba  Alpha_KSCN       DVAAF   217   221  522.2558    1.000
#> 2223: db_eEF1Ba  Alpha_KSCN       DVAAF   217   221  522.2558    5.000
#> 2224: db_eEF1Ba  Alpha_KSCN       DVAAF   217   221  522.2558   25.000
#> 2225: db_eEF1Ba  Alpha_KSCN       DVAAF   217   221  522.2558  150.000
#> 2226: db_eEF1Ba  Alpha_KSCN       DVAAF   217   221  522.2558 1440.000
#>       Modification  avg_mass err_avg_mass
#>             <lgcl>     <num>        <num>
#>    1:           NA 1061.3119           NA
#>    2:           NA 1062.9770  0.003059254
#>    3:           NA 1064.1549  0.035068821
#>    4:           NA 1064.9073  0.057318502
#>    5:           NA 1066.0004  0.072421134
#>   ---                                    
#> 2222:           NA  522.9861  0.025910678
#> 2223:           NA  523.2366  0.018953607
#> 2224:           NA  523.6132  0.025444056
#> 2225:           NA  523.7690  0.012327498
#> 2226:           NA  523.7615  0.005284952
```
