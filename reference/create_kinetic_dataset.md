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
dat <- read_hdx(system.file(package = "HaDeX", "HaDeX/data/KD_180110_CD160_HVEM.csv"))
#> [1] ""
peptide_list <- data.frame(Sequence = c("INITSSASQEGTRLN", "INITSSASQEGTRLN"), 
                           state = c("CD160", "CD160_HVEM"), 
                           start = c(1, 1), end = c(15, 15))
create_kinetic_dataset(dat, peptide_list)
#>     Protein        Sequence Start End      State time_chosen Exposure
#> 1  db_CD160 INITSSASQEGTRLN     1  15      CD160       0.001    0.001
#> 2  db_CD160 INITSSASQEGTRLN     1  15      CD160       0.167    0.167
#> 3  db_CD160 INITSSASQEGTRLN     1  15      CD160       1.000    1.000
#> 4  db_CD160 INITSSASQEGTRLN     1  15      CD160       5.000    5.000
#> 5  db_CD160 INITSSASQEGTRLN     1  15      CD160      25.000   25.000
#> 6  db_CD160 INITSSASQEGTRLN     1  15      CD160     120.000  120.000
#> 7  db_CD160 INITSSASQEGTRLN     1  15 CD160_HVEM       0.001    0.001
#> 8  db_CD160 INITSSASQEGTRLN     1  15 CD160_HVEM       0.167    0.167
#> 9  db_CD160 INITSSASQEGTRLN     1  15 CD160_HVEM       1.000    1.000
#> 10 db_CD160 INITSSASQEGTRLN     1  15 CD160_HVEM       5.000    5.000
#> 11 db_CD160 INITSSASQEGTRLN     1  15 CD160_HVEM      25.000   25.000
#> 12 db_CD160 INITSSASQEGTRLN     1  15 CD160_HVEM     120.000  120.000
#>    Modification frac_deut_uptake err_frac_deut_uptake deut_uptake
#> 1            NA        0.3693522           0.00129470  0.03860574
#> 2            NA       76.9416288           0.38198929  8.04215607
#> 3            NA       84.2545964           0.60898022  8.80652807
#> 4            NA       87.5793488           0.59219322  9.15404057
#> 5            NA       93.2210067           0.57651483  9.74372257
#> 6            NA       95.5203706           0.83024122  9.98405857
#> 7            NA        0.3721661           0.00283752  0.03860574
#> 8            NA       74.4538227           0.66707227  7.72328457
#> 9            NA       81.6064285           0.98612947  8.46524257
#> 10           NA       82.9536479           0.87902224  8.60499307
#> 11           NA       87.7240119           0.70630534  9.09983507
#> 12           NA       95.2046776           0.78903153  9.87582357
#>    err_deut_uptake theo_frac_deut_uptake err_theo_frac_deut_uptake
#> 1       0.00000000            -0.4493436                 0.0000000
#> 2       0.02827429            62.6120329                 0.2227781
#> 3       0.05566577            68.6346539                 0.4386003
#> 4       0.05293102            71.3727658                 0.4170528
#> 5       0.04964457            76.0189737                 0.3911582
#> 6       0.07940910            77.9126232                 0.6256782
#> 7       0.00000000            -0.4493436                 0.0000000
#> 8       0.03634286            60.0995884                 0.2863518
#> 9       0.07936215            65.9456056                 0.6253083
#> 10      0.06332496            67.0467243                 0.4989484
#> 11      0.02354604            70.9456712                 0.1855234
#> 12      0.03208667            77.0598207                 0.2528165
#>    theo_deut_uptake err_theo_deut_uptake Med_Sequence
#> 1       -0.05702927           0.00000000            8
#> 2        7.94652106           0.02827429            8
#> 3        8.71089306           0.05566577            8
#> 4        9.05840556           0.05293102            8
#> 5        9.64808756           0.04964457            8
#> 6        9.88842356           0.07940910            8
#> 7       -0.05702927           0.00000000            8
#> 8        7.62764956           0.03634286            8
#> 9        8.36960756           0.07936215            8
#> 10       8.50935806           0.06332496            8
#> 11       9.00420006           0.02354604            8
#> 12       9.78018856           0.03208667            8

peptide_list2 <- data.frame(Sequence = c("INITSSASQEGTRLN", "LICTVW"), 
                            state = c("CD160", "CD160"), 
                            start = c(1, 16), end = c(15, 21))
create_kinetic_dataset(dat, peptide_list2)
#>     Protein        Sequence Start End State time_chosen Exposure Modification
#> 1  db_CD160 INITSSASQEGTRLN     1  15 CD160       0.001    0.001           NA
#> 2  db_CD160 INITSSASQEGTRLN     1  15 CD160       0.167    0.167           NA
#> 3  db_CD160 INITSSASQEGTRLN     1  15 CD160       1.000    1.000           NA
#> 4  db_CD160 INITSSASQEGTRLN     1  15 CD160       5.000    5.000           NA
#> 5  db_CD160 INITSSASQEGTRLN     1  15 CD160      25.000   25.000           NA
#> 6  db_CD160 INITSSASQEGTRLN     1  15 CD160     120.000  120.000           NA
#> 7  db_CD160          LICTVW    16  21 CD160       0.001    0.001           NA
#> 8  db_CD160          LICTVW    16  21 CD160       0.167    0.167           NA
#> 9  db_CD160          LICTVW    16  21 CD160       1.000    1.000           NA
#> 10 db_CD160          LICTVW    16  21 CD160       5.000    5.000           NA
#> 11 db_CD160          LICTVW    16  21 CD160      25.000   25.000           NA
#> 12 db_CD160          LICTVW    16  21 CD160     120.000  120.000           NA
#>    frac_deut_uptake err_frac_deut_uptake deut_uptake err_deut_uptake
#> 1        0.36935223          0.001294700 0.038605737      0.00000000
#> 2       76.94162879          0.381989286 8.042156070      0.02827429
#> 3       84.25459637          0.608980217 8.806528070      0.05566577
#> 4       87.57934878          0.592193216 9.154040570      0.05293102
#> 5       93.22100671          0.576514834 9.743722570      0.04964457
#> 6       95.52037061          0.830241218 9.984058570      0.07940910
#> 7        0.03033506          0.000148162 0.000888387      0.00000000
#> 8       25.77526288          1.270721219 0.754849637      0.03703103
#> 9       32.01227510          1.521507750 0.937505637      0.04432270
#> 10      41.67132775          0.581339743 1.220378887      0.01594750
#> 11      49.66438624          1.012471575 1.454462137      0.02878750
#> 12      65.03177370          0.941903476 1.904508637      0.02596870
#>    theo_frac_deut_uptake err_theo_frac_deut_uptake theo_deut_uptake
#> 1             -0.4493436                 0.0000000      -0.05702927
#> 2             62.6120329                 0.2227781       7.94652106
#> 3             68.6346539                 0.4386003       8.71089306
#> 4             71.3727658                 0.4170528       9.05840556
#> 5             76.0189737                 0.3911582       9.64808756
#> 6             77.9126232                 0.6256782       9.88842356
#> 7            -10.9156277                 0.0000000      -0.49477747
#> 8              5.7180325                 0.8169672       0.25918378
#> 9              9.7477327                 0.9778337       0.44183978
#> 10            15.9883949                 0.3518288       0.72471303
#> 11            21.1526673                 0.6351010       0.95879628
#> 12            31.0814541                 0.5729134       1.40884278
#>    err_theo_deut_uptake Med_Sequence
#> 1            0.00000000          8.0
#> 2            0.02827429          8.0
#> 3            0.05566577          8.0
#> 4            0.05293102          8.0
#> 5            0.04964457          8.0
#> 6            0.07940910          8.0
#> 7            0.00000000         18.5
#> 8            0.03703103         18.5
#> 9            0.04432270         18.5
#> 10           0.01594750         18.5
#> 11           0.02878750         18.5
#> 12           0.02596870         18.5
```
