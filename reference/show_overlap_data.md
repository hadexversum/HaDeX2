# Show data on peptide overlap

Presents peptide overlap on protein sequence data, based on the supplied
parameters.

## Usage

``` r
show_overlap_data(
  dat,
  protein = dat[["Protein"]][1],
  state = dat[["State"]][1],
  start = min(dat[["Start"]]),
  end = max(dat[["End"]])
)
```

## Arguments

- dat:

  data imported by the
  [`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
  function.

- protein:

  chosen protein.

- state:

  biological state for chosen protein.

- start:

  start position of chosen protein.

- end:

  end position of chosen protein.

## Value

a [`data.frame`](https://rdrr.io/r/base/data.frame.html) object.

## Details

The data frame presents all the peptides in given state, with its start
and end position on the protein sequence. This data is available in the
GUI.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`plot_overlap`](https://hadexversum.github.io/HaDeX2/reference/plot_overlap.md)

## Examples

``` r
show_overlap_data(alpha_dat)
#>        Protein    Sequence    ID Start   End
#>         <char>      <char> <int> <int> <int>
#>   1: db_eEF1Ba GFGDLKSPAGL     1     1    11
#>   2: db_eEF1Ba  FGDLKSPAGL     2     2    11
#>   3: db_eEF1Ba   GDLKSPAGL     3     3    11
#>   4: db_eEF1Ba      LKSPAG     4     5    10
#>   5: db_eEF1Ba     LKSPAGL     5     5    11
#>  ---                                        
#> 102: db_eEF1Ba    EDYVQSMD   102   210   217
#> 103: db_eEF1Ba   EDYVQSMDV   103   210   218
#> 104: db_eEF1Ba      DYVQSM   104   211   216
#> 105: db_eEF1Ba      YVQSMD   105   212   217
#> 106: db_eEF1Ba       DVAAF   106   217   221
```
