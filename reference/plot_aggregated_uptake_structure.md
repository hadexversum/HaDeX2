# Plot aggregated uptake on the 3D structure

Function plots the aggregated data (either one state deuterium uptake or
differential deuterium uptake) on the 3d structure.

## Usage

``` r
plot_aggregated_uptake_structure(
  aggregated_dat,
  differential = FALSE,
  fractional = TRUE,
  theoretical = FALSE,
  time_t,
  pdb_file_path
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

- pdb_file_path:

  file path to the pdb file

## Value

a r3dmol object.

## Examples

``` r
diff_uptake_dat <- create_diff_uptake_dataset(alpha_dat)
diff_aggregated_dat <- create_aggregated_diff_uptake_dataset(diff_uptake_dat)
pdb_file_path <- system.file(package = "HaDeX", "HaDeX/data/Model_eEF1Balpha.pdb")

plot_aggregated_uptake_structure(diff_aggregated_dat, 
                                 differential = TRUE,
                                 time_t = 1,
                                 pdb_file_path = pdb_file_path)
#> Please considering installing at least the 0.2 version of the r3dmol package.
#>             
#> Available at: https://github.com/swsoyee/r3dmol.
#> Error in loadNamespace(x): there is no package called ‘shiny’
                                  
kin_dat <- create_uptake_dataset(alpha_dat, states = "Alpha_KSCN" )
aggregated_dat <- create_aggregated_uptake_dataset(kin_dat)
plot_aggregated_uptake_structure(aggregated_dat, 
                                 differential = FALSE,
                                 time_t = 1,
                                 pdb_file_path = pdb_file_path)
#> Error in loadNamespace(x): there is no package called ‘shiny’
                                 
```
