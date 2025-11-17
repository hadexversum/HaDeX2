# Create dataset with control

This function adds selected experimental maximal exchange control as a
measurement for all biological states.

## Usage

``` r
create_control_dataset(
  dat,
  control_protein = dat[["Protein"]][1],
  control_state = dat[["State"]][1],
  control_exposure = max(dat[["Exposure"]])
)
```

## Arguments

- dat:

  data imported by the
  [`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
  function.

- control_protein:

  maximal exchange control protein, from dat.

- control_state:

  maximal exchange control state, from dat.

- control_exposure:

  maximal exchange control exposure (time point of measurement), from
  dat.

## Value

a [`data.frame`](https://rdrr.io/r/base/data.frame.html) object.

## Details

Function `create_control_dataset` creates a dataset (similar to the
output of
[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
function), with maximal exchange control for all the states, based on
provided parameters. The other functions are operating within a state,
so the control is prepared for each state. The chosen maximal exchange
control is distinguishable by the value \`99999\` in \`Exposure\`
control.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`calculate_state_uptake`](https://hadexversum.github.io/HaDeX2/reference/calculate_state_uptake.md)

## Examples

``` r
head(create_control_dataset(alpha_dat))
#>     Protein Start End    Sequence Modification MaxUptake      MHP       State
#> 1 db_eEF1Ba     1  11 GFGDLKSPAGL           NA         9 1061.563 ALPHA_Gamma
#> 2 db_eEF1Ba     1  11 GFGDLKSPAGL           NA         9 1061.563 ALPHA_Gamma
#> 3 db_eEF1Ba     1  11 GFGDLKSPAGL           NA         9 1061.563 ALPHA_Gamma
#> 4 db_eEF1Ba     1  11 GFGDLKSPAGL           NA         9 1061.563 ALPHA_Gamma
#> 5 db_eEF1Ba     1  11 GFGDLKSPAGL           NA         9 1061.563 ALPHA_Gamma
#> 6 db_eEF1Ba     1  11 GFGDLKSPAGL           NA         9 1061.563 ALPHA_Gamma
#>   Exposure                              File z  Inten    Center
#> 1    0.000 Tania_161112_eEF1Ba_KSCN_IMS_seq1 1 138844 1062.1913
#> 2    0.000 Tania_161112_eEF1Ba_KSCN_IMS_seq1 2 728218  531.6754
#> 3    0.167  Tania_161109_1eEF1Bag_KSCN_10sec 1  41100 1064.0150
#> 4    0.167  Tania_161109_1eEF1Bag_KSCN_10sec 2 393115  532.4975
#> 5    0.167  Tania_161109_2eEF1Bag_KSCN_10sec 1  46642 1063.9682
#> 6    0.167  Tania_161109_2eEF1Bag_KSCN_10sec 2 466233  532.4951
```
