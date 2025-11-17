# Experiment quality control

Checks how the uncertainty changes in a function of maximal exchange
control time of measurement.

## Usage

``` r
create_quality_control_dataset(
  dat,
  protein = dat[["Protein"]][1],
  state_1 = unique(dat[["State"]])[1],
  state_2 = unique(dat[["State"]])[2],
  time_t = unique(dat[["Exposure"]])[2],
  time_0 = min(dat[["Exposure"]]),
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

- state_1:

  first biological state.

- state_2:

  second biological state.

- time_t:

  time point of the measurement for which the calculations are done.

- time_0:

  minimal exchange control time point of measurement.

- deut_part:

  deuterium percentage in solution used in experiment, value from range
  \[0, 1\].

## Value

[`data.frame`](https://rdrr.io/r/base/data.frame.html) object with mean
uncertainty per different \`time_100\` value. The values are shown as
percentages.

## Details

The function calculates mean uncertainty of all peptides and its
uncertainty (standard error) based on given \`time_0\` and \`time_t\` as
a function of \`time_100\`. Both theoretical and experimental results
for each state and their difference are supplied for comparison but only
experimental calculations depends on \`time_100\` variable. The results
are either in form of fractional or absolute values depending on the
\`fractional\` parameter supplied by the user. This data can be useful
for general overview of the experiment and analyze of the chosen time
parameters.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`calculate_state_uptake`](https://hadexversum.github.io/HaDeX2/reference/calculate_state_uptake.md)
[`plot_quality_control`](https://hadexversum.github.io/HaDeX2/reference/plot_quality_control.md)
[`show_quality_control_data`](https://hadexversum.github.io/HaDeX2/reference/show_quality_control_data.md)

## Examples

``` r
create_quality_control_dataset(alpha_dat)    
#>   time_100 avg_err_state_1 sd_err_state_1 avg_err_state_2 sd_err_state_2
#> 1        1       3.4002155      8.8708525       34.521192     278.098101
#> 2        5       3.9326935     20.4036730        7.166776      34.925573
#> 3       25       1.6572207      3.0179749        4.932370      18.417678
#> 4      150       1.2427509      1.2804898        1.572092       1.822506
#> 5     1440       0.7168737      0.5591136        1.066821       1.099889
#>    avg_diff    sd_diff
#> 1 35.942627 278.078773
#> 2  9.801873  40.082153
#> 3  5.446570  18.593114
#> 4  2.117561   2.118622
#> 5  1.349636   1.162431
                           
```
