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
dat <- read_hdx(system.file(package = "HaDeX", 
                     "HaDeX/data/KD_180110_CD160_HVEM.csv"))
head(dat)
#>     Protein Start   End        Sequence Modification MaxUptake      MHP  State
#>      <char> <int> <int>          <char>       <lgcl>     <num>    <num> <char>
#> 1: db_CD160     1    15 INITSSASQEGTRLN           NA        14 1590.808  CD160
#> 2: db_CD160     1    15 INITSSASQEGTRLN           NA        14 1590.808  CD160
#> 3: db_CD160     1    15 INITSSASQEGTRLN           NA        14 1590.808  CD160
#> 4: db_CD160     1    15 INITSSASQEGTRLN           NA        14 1590.808  CD160
#> 5: db_CD160     1    15 INITSSASQEGTRLN           NA        14 1590.808  CD160
#> 6: db_CD160     1    15 INITSSASQEGTRLN           NA        14 1590.808  CD160
#>    Exposure                    File     z  Inten    Center
#>       <num>                  <char> <int>  <num>     <num>
#> 1:    0.000 KD_160527_CD160_sekw_05     1   6592 1591.2584
#> 2:    0.000 KD_160527_CD160_sekw_05     2 394066  796.3552
#> 3:    0.000 KD_160527_CD160_sekw_05     3 173526  531.2633
#> 4:    0.001   KD_160527_CD160_IN_01     2 232221  796.3634
#> 5:    0.001   KD_160527_CD160_IN_01     3 110675  531.2849
#> 6:    0.167  KD_160530_CD160_10s_01     2  99894  800.3610
```
