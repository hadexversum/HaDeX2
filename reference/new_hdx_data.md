# Constructor of hdx_data class

Class hdx_data is the base of any calculation done in HaDeX. It
structuralizes the data from the data file read by the
[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
function. The obiect preserves the information of the data file origin -
for now, the function accepts datafiles from DynamX2.0, DynamX3.0 and
HDeXaminer. The data from the datafile is checked and put in one format
suitable for the package workflow, regardless of its origin.

The structure is as follows: - Protein, character. - Start, integer. -
End, integer. - Sequence, character. - MaxUptake, numeric. - MHP,
numeric. - State, character. - Exposure, numeric. - File, character. -
z, integer. - Inten, numeric. - Center, numeric.

The hdx_data class inherits from data.frame class, so the structure is
preserved. The hdx_data object has two additional attributes: - source,
character. Indicates the source of the datafile. - has_modification,
logical. Indicates if the datafile has data from modified peptides.

## Usage

``` r
new_hdx_data(dat, source, has_modification, n_rep)
```

## Arguments

- dat:

  [`data.frame`](https://rdrr.io/r/base/data.frame.html), read from the
  datafile.

- source:

  [`character`](https://rdrr.io/r/base/character.html), the source of
  the datafile.

- has_modification:

  [`logical`](https://rdrr.io/r/base/logical.html), indicator if there
  are modified peptides in the datafile.

## Value

[`hdx_data`](https://hadexversum.github.io/HaDeX2/reference/hdx_data.md)
object.
