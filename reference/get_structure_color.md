# Get color palette for 3D structure

This function provides a set of color codes associated with aggregated
values to be presented on 3D structure.

## Usage

``` r
get_structure_color(
  aggregated_dat,
  differential = FALSE,
  fractional = TRUE,
  theoretical = FALSE,
  time_t
)
```

## Arguments

- aggregated_dat:

  aggregated data, either for single uptake or differential

- differential:

  indicator if the aggregated_dat contains differential results

- fractional:

  indicator if fractional values are used

- theoretical:

  indicator if theoretical values are used

- time_t:

  time point from aggregated_dat to be shown on the structure

## Value

a list

## Examples

``` r
# \donttest{
# disabled due to long execution time 

diff_uptake_dat <- create_diff_uptake_dataset(alpha_dat)
diff_aggregated_dat <- create_aggregated_diff_uptake_dataset(diff_uptake_dat)
get_structure_color(diff_aggregated_dat, 
                    differential = TRUE,
                    time_t = 1)
#>   [1] "#FFBFAA" "#FFB7A0" "#FFB39B" "#FFB39B" "#FFB199" "#FFB199" "#FFB199"
#>   [8] "#FFB199" "#FFB097" "#FFB097" "#FFB59D" "#FFC6B3" "#FFC6B3" "#FFC6B3"
#>  [15] "#FFCBBA" "#FFCBBA" "#FFD4C5" "#FFCAB8" "#FFCDBC" "#FFCDBC" "#FFD6C8"
#>  [22] "#FFE2D8" "#FFE8DF" "#FFDDD0" "#FFDDD0" "#FFDDD0" "#FFD5C7" "#FFD5C7"
#>  [29] "#FFD5C7" "#FFE3D9" "#FFE3D9" "#FFE3D9" "#FFE3D9" "#FFE0D5" "#FFE0D5"
#>  [36] "#FFE0D5" "#FFE3D8" "#FFE1D7" "#FFE6DD" "#FFE9E1" "#FFE9E1" "#FFE9E1"
#>  [43] "#FFE9E1" "#FFE9E1" "#FFE9E1" "#FFE9E1" "#FFE9E1" "#FFE9E2" "#FFDACC"
#>  [50] "#FFDACC" "#FFC9B7" "#FFA98E" "#FFA98E" "#FFA98E" "#FFA98E" "#FFA98E"
#>  [57] "#FFA98E" "#FFFDFC" "#FFFDFC" "#FFFDFC" "#FFFDFC" "#FFFDFC" "#FFFDFC"
#>  [64] "#FFFCFB" "#FFFCFB" "#FFFFFF" "#FFFFFF" "#FFFFFF" "#FFFFFF" "#FFFFFF"
#>  [71] "#FFFFFF" "#FFFFFF" "#FFFFFF" "#FFFDFC" "#FFFDFC" "#FFFDFC" "#FFFDFC"
#>  [78] "#FFFDFC" "#FDFBFF" "#FDFBFF" "#FDFBFF" "#FDFBFF" "#FFF0EB" "#FFF0EB"
#>  [85] "#FFCEBD" "#FFCCBA" "#FFCCBA" "#FFCCBA" "#FFCCBA" "#FFCCBA" "#FFCCBA"
#>  [92] "#FFCCBA" "#FFCCBA" "#FFCCBA" "#FFCCBA" "#FFCCBA" "#FFAB91" "#FFAB91"
#>  [99] "#FFAB91" "#FFAB91" "#FFAB91" "#FFC0AC" "#FFE9E1" "#FFE9E1" "#FFE9E1"
#> [106] "#FFE9E1" "#FFEBE4" "#FFFDFD" "#FFFDFD" "#FFFDFD" "#FFFDFD" "#FFFDFD"
#> [113] "#FFFDFD" "#FFFDFD" "#FFFDFD" "#FFFDFD" "#FFFDFD" "#FFFDFD" "#FFFDFD"
#> [120] "#FEFEFF" "#FDFCFF" "#FDFCFF" "#FFFEFD" "#FFFEFD" "#FFE1D6" "#FFE1D6"
#> [127] "#FFE1D6" "#FFE1D6" "#FFE1D6" "#FFE1D6" "#FFE1D6" "#FFE1D6" "#FFE1D6"
#> [134] "#FFE1D6" "#FFE1D6" "#FF9678" "#FF9274" "#FF9274" "#FF9274" "#FF9274"
#> [141] "#FF9274" "#FF9274" "#FFA78C" "#FFA488" "#FFA488" "#FFA488" "#FFA488"
#> [148] "#FFA488" "#FFA488" "#FFA488" "#FFA185" "#FFA185" "#FFA185" "#FFC5B1"
#> [155] "#FFCFBE" "#FFCFBE" "#FFCFBE" "#FFCFBE" "#FFCFBE" "#FFE1D7" "#FFE1D6"
#> [162] "#FFE1D6" "#FFE4DA" "#FFE4DA" "#FFE4DA" "#FFE3D9" "#FFDFD4" "#FFDFD4"
#> [169] "#FFDFD4" "#FFDCCF" "#FFDCCF" "#FFDCCF" "#FFDCCF" "#FFDCCF" "#FFD9CC"
#> [176] "#FFD9CC" "#FFD8CA" "#FFD8CA" "#FFD8CA" "#FFD8CA" "#FFD8CA" "#FFD9CC"
#> [183] "#FFD7C9" "#FFD7C9" "#FFDFD4" "#FFE2D7" "#FFE2D7" "#FFE2D7" "#FFE2D7"
#> [190] "#FFD9CB" "#FFC5B2" "#FFC5B2" "#FFC5B2" "#FFC2AD" "#FFC4B0" "#FFC4B0"
#> [197] "#FFC7B4" "#FFC7B4" "#FFC7B4" "#FFC7B4" "#FFC7B4" "#FFD1C1" "#FFDDD1"
#> [204] "#FFE5DC" "#FFE1D6" "#FFE1D6" "#FFE1D6" "#FFE4DA" "#FFE1D6" "#FFCCBB"
#> [211] "#FFCFBF" "#FFC7B4" "#FFC7B4" "#FFC7B4" "#FFC7B4" "#FFC7B4" "#FFB8A1"
#> [218] "#FFB8A2" "#FFB7A0" "#FFB7A0" "#FFB7A0"
# }
```
