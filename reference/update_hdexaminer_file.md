# Update HDeXaminer datafile

Update data from HDeXaminer file

## Usage

``` r
update_hdexaminer_file(
  dat,
  fd_time,
  old_protein_name = NULL,
  new_protein_name = NULL,
  old_state_name = NULL,
  new_state_name = NULL,
  confidence = c("High", "Medium")
)
```

## Arguments

- dat:

  data imported by the
  [`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
  function

- fd_time:

  time point \[min\] for fully deuterated sample

- old_protein_name:

  protein name to be changed

- new_protein_name:

  new name for old_protein_name

- old_state_name:

  state names to be changed

- new_state_name:

  new names for old_state_name

- confidence:

  vector of accepted confidence values (internal flag from HDeXaminer).
  By default only accepted values are \`Medium\` and \`High\`, with
  \`Low\` excluded

## Value

a [`data.frame`](https://rdrr.io/r/base/data.frame.html) object

## Details

The function `update_hdexaminer_file` changes the data read from
HDeXaminer file. Data from HDeXaminer is condensed and automated data
retrieving may be corrected by the user. The original file has a mark
"FD" for fully deuterated data instead of numerical value for time point
(provided in minutes) that is not consistent for workflow and not enough
for precise data description. Moreover, the data about both protein and
state is included in one column and for detailed information function
`update_hdexaminer_file` allows to change them.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`calculate_kinetics`](https://hadexversum.github.io/HaDeX2/reference/calculate_kinetics.md)
[`plot_coverage`](https://hadexversum.github.io/HaDeX2/reference/plot_coverage.md)
[`plot_position_frequency`](https://hadexversum.github.io/HaDeX2/reference/plot_position_frequency.md)
[`reconstruct_sequence`](https://hadexversum.github.io/HaDeX2/reference/reconstruct_sequence.md)
