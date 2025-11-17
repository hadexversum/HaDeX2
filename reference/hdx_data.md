# Creation of validated hdx_data class

The wrapper function for the constructor of the `hdx_data` and its
validator. Used in
[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
function.

## Usage

``` r
hdx_data(dat, source, has_modification, n_rep, msg = "")
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

`hdx_data` object.
