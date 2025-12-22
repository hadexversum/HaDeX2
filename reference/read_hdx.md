# Read HDX-MS data file

Import HDX-MS datafile and validate its content

## Usage

``` r
read_hdx(filename, separator = ",")
```

## Arguments

- filename:

  a file supplied by the user. Formats allowed: .csv, .xlsx and .xls.

- separator:

  a value separating the columns.

## Value

a [`data.frame`](https://rdrr.io/r/base/data.frame.html) object

## Details

The function `read_hdx` generates a dataset read from the supplied
datafile. The files produced by DynamX 3.0 or 2.0 in \`cluster data\`
format and \`tables\` file from HDeXaminer are handled. Moreover, the
data should include at least two replicates of the experiment to
calculate the uncertainty of the measurement. For the files of
HDeXaminer origin, the rows with no complete information (e.q. missing
\`Exp Cent\` value) are removed. The \`Confidence\` column is preserved
as the user should have impact on accepting rows based on their
Confidence flag. Moreover, those files need action from the user - to
confirm data processing (e.q. FD time point), choose accepted confidence
values and make some change of the labels using
[`update_hdexaminer_file`](https://hadexversum.github.io/HaDeX2/reference/update_hdexaminer_file.md)
function. For further information check the documentation. IMPORTANT!
The files of HDeXaminer origin MUST be processed by hand or by
[`update_hdexaminer_file`](https://hadexversum.github.io/HaDeX2/reference/update_hdexaminer_file.md)
function to fit the input of processing functions e.q.
[`calculate_state_uptake`](https://hadexversum.github.io/HaDeX2/reference/calculate_state_uptake.md)
or
[`calculate_diff_uptake`](https://hadexversum.github.io/HaDeX2/reference/calculate_diff_uptake.md).

## See also

[`update_hdexaminer_file`](https://hadexversum.github.io/HaDeX2/reference/update_hdexaminer_file.md)
[`create_control_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_control_dataset.md)
[`calculate_state_uptake`](https://hadexversum.github.io/HaDeX2/reference/calculate_state_uptake.md)

## Examples

``` r
dat <- read_hdx(system.file(package = "HaDeX2", 
                     "HaDeX/data/alpha.csv"))
head(dat)
#>      Protein Start   End    Sequence Modification MaxUptake      MHP
#>       <char> <int> <int>      <char>       <lgcl>     <int>    <num>
#> 1: db_eEF1Ba     1    11 GFGDLKSPAGL           NA         9 1061.563
#> 2: db_eEF1Ba     1    11 GFGDLKSPAGL           NA         9 1061.563
#> 3: db_eEF1Ba     1    11 GFGDLKSPAGL           NA         9 1061.563
#> 4: db_eEF1Ba     1    11 GFGDLKSPAGL           NA         9 1061.563
#> 5: db_eEF1Ba     1    11 GFGDLKSPAGL           NA         9 1061.563
#> 6: db_eEF1Ba     1    11 GFGDLKSPAGL           NA         9 1061.563
#>          State Exposure                              File     z  Inten
#>         <char>    <num>                            <char> <int>  <int>
#> 1: ALPHA_Gamma    0.000 Tania_161112_eEF1Ba_KSCN_IMS_seq1     1 138844
#> 2: ALPHA_Gamma    0.000 Tania_161112_eEF1Ba_KSCN_IMS_seq1     2 728218
#> 3: ALPHA_Gamma    0.167  Tania_161109_1eEF1Bag_KSCN_10sec     1  41100
#> 4: ALPHA_Gamma    0.167  Tania_161109_1eEF1Bag_KSCN_10sec     2 393115
#> 5: ALPHA_Gamma    0.167  Tania_161109_2eEF1Bag_KSCN_10sec     1  46642
#> 6: ALPHA_Gamma    0.167  Tania_161109_2eEF1Bag_KSCN_10sec     2 466233
#>       Center
#>        <num>
#> 1: 1062.1913
#> 2:  531.6754
#> 3: 1064.0150
#> 4:  532.4975
#> 5: 1063.9682
#> 6:  532.4951
```
