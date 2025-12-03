# HaDeX customized ggplot theme

This function HaDeXifies plot. It adds HaDeX logo and ggplot theme.

## Usage

``` r
HaDeXify(plt)
```

## Arguments

- plt:

  ggplot object. Plot to HaDeXify.

## Value

a `ggplot2` object.

## Details

Function adds the logo of HaDeX package in the left down corner of the
plot and the HaDeX theme.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)
[`plot_differential`](https://hadexversum.github.io/HaDeX2/reference/plot_differential.md)
[`plot_butterfly`](https://hadexversum.github.io/HaDeX2/reference/plot_butterfly.md)

## Examples

``` r
diff_uptake_dat <- create_diff_uptake_dataset(alpha_dat)
HaDeXify(plot_differential(diff_uptake_dat))
#> Warning: Using `size` aesthetic for lines was deprecated in ggplot2 3.4.0.
#> ℹ Please use `linewidth` instead.
#> ℹ The deprecated feature was likely used in the HaDeX2 package.
#>   Please report the issue to the authors.

```
