# Show overlap distribution data

Generates the data of frequency of overlap of each amino in the protein
sequence.

## Usage

``` r
create_overlap_distribution_dataset(
  dat,
  protein = dat[["Protein"]][1],
  state = dat[["State"]][1],
  start = min(dat[["Start"]]),
  end = max(dat[["End"]]),
  protein_sequence = reconstruct_sequence(dat)
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

- protein_sequence:

  data produced by
  [`reconstruct_sequence`](https://hadexversum.github.io/HaDeX2/reference/reconstruct_sequence.md)
  function.

## Value

a [`data.frame`](https://rdrr.io/r/base/data.frame.html) object.

## Details

This data frame presents how many times (by how many peptides) a amino
position in protein sequence is covered. This data is available in the
GUI.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`reconstruct_sequence`](https://hadexversum.github.io/HaDeX2/reference/reconstruct_sequence.md)

## Examples

``` r
create_overlap_distribution_dataset(alpha_dat)
#> Key: <pos>
#>        pos  amino coverage
#>      <int> <char>    <int>
#>   1:     1      G        1
#>   2:     2      F        2
#>   3:     3      G        3
#>   4:     4      D        3
#>   5:     5      L        5
#>  ---                      
#> 217:   217      D        4
#> 218:   218      V        2
#> 219:   219      A        1
#> 220:   220      A        1
#> 221:   221      F        1
```
