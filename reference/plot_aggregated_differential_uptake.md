# Plots aggregated uptake difference

Plots aggregated uptake difference

## Usage

``` r
plot_aggregated_differential_uptake(
  aggregated_diff_dat,
  fractional = TRUE,
  theoretical = FALSE,
  time_100 = max(unique(aggregated_diff_dat[["Exposure"]])),
  panels = FALSE,
  interactive = FALSE
)
```

## Arguments

- aggregated_diff_dat:

  aggregated differential uptake data as calculated by
  [`create_aggregated_diff_uptake_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_aggregated_diff_uptake_dataset.md)

- fractional:

  `logical`, determines if values are fractional

- theoretical:

  `logical`, determines if values are theoretical

- time_100:

  maximal exchange control time point of measurement \[min\]

- panels:

  `logical`, indicator if plot should be divided into panels or not

- interactive:

  `logical`, whether plot should have an interactive layer created with
  with ggiraph, which would add tooltips to the plot in an interactive
  display (HTML/Markdown documents or shiny app)

## Value

a [`ggplot`](https://ggplot2.tidyverse.org/reference/ggplot.html) object

## See also

[`create_diff_uptake_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_diff_uptake_dataset.md)
[`create_aggregated_diff_uptake_dataset`](https://hadexversum.github.io/HaDeX2/reference/create_aggregated_diff_uptake_dataset.md)

## Examples

``` r
# \donttest{
# disabled due to long execution time 

diff_uptake_dat <- create_diff_uptake_dataset(alpha_dat)
aggregated_diff_dat <- create_aggregated_diff_uptake_dataset(diff_uptake_dat)
plot_aggregated_differential_uptake(aggregated_diff_dat, panels = FALSE)

plot_aggregated_differential_uptake(aggregated_diff_dat, fractional = FALSE, 
                                    theoretical = TRUE, panels = FALSE)

plot_aggregated_differential_uptake(aggregated_diff_dat, theoretical = TRUE, 
                                    panels = TRUE)

#> TableGrob (5 x 1) "arrange": 5 grobs
#>   z     cells    name           grob
#> 1 1 (1-1,1-1) arrange gtable[layout]
#> 2 2 (2-2,1-1) arrange gtable[layout]
#> 3 3 (3-3,1-1) arrange gtable[layout]
#> 4 4 (4-4,1-1) arrange gtable[layout]
#> 5 5 (5-5,1-1) arrange gtable[layout]
# }
```
