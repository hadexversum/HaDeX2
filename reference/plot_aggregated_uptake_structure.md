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

{"x":{"id":"blank_structure","configs":{"backgroundColor":"#FFFFFF","nomouse":false,"backgroundColor.1":"white","cartoonQuality":10,"lowerZoomLimit":50,"upperZoomLimit":350,"antialias":true,"orthographic":false,"disableFog":false},"api":[{"method":"addModel","data":[""],"format":"pdb","keepH":false,"options":{"keepH":false}},{"method":"setStyle","style":{"cartoon":{"color":"white","style":"rectangle","ribbon":false,"arrows":true,"tubes":false,"thickness":0.4,"opacity":1}},"sel":{}},{"method":"zoomTo"},{"method":"setStyle","style":{"cartoon":{"style":"rectangle","ribbon":false,"arrows":true,"tubes":false,"thickness":0.4,"opacity":1,"colorfunc":"\n        function(atom) {\n          const color = [\"#FFBFAA\",\"#FFB7A0\",\"#FFB39B\",\"#FFB39B\",\"#FFB199\",\"#FFB199\",\"#FFB199\",\"#FFB199\",\"#FFB097\",\"#FFB097\",\"#FFB59D\",\"#FFC6B3\",\"#FFC6B3\",\"#FFC6B3\",\"#FFCBBA\",\"#FFCBBA\",\"#FFD4C5\",\"#FFCAB8\",\"#FFCDBC\",\"#FFCDBC\",\"#FFD6C8\",\"#FFE2D8\",\"#FFE8DF\",\"#FFDDD0\",\"#FFDDD0\",\"#FFDDD0\",\"#FFD5C7\",\"#FFD5C7\",\"#FFD5C7\",\"#FFE3D9\",\"#FFE3D9\",\"#FFE3D9\",\"#FFE3D9\",\"#FFE0D5\",\"#FFE0D5\",\"#FFE0D5\",\"#FFE3D8\",\"#FFE1D7\",\"#FFE6DD\",\"#FFE9E1\",\"#FFE9E1\",\"#FFE9E1\",\"#FFE9E1\",\"#FFE9E1\",\"#FFE9E1\",\"#FFE9E1\",\"#FFE9E1\",\"#FFE9E2\",\"#FFDACC\",\"#FFDACC\",\"#FFC9B7\",\"#FFA98E\",\"#FFA98E\",\"#FFA98E\",\"#FFA98E\",\"#FFA98E\",\"#FFA98E\",\"#FFFDFC\",\"#FFFDFC\",\"#FFFDFC\",\"#FFFDFC\",\"#FFFDFC\",\"#FFFDFC\",\"#FFFCFB\",\"#FFFCFB\",\"#FFFFFF\",\"#FFFFFF\",\"#FFFFFF\",\"#FFFFFF\",\"#FFFFFF\",\"#FFFFFF\",\"#FFFFFF\",\"#FFFFFF\",\"#FFFDFC\",\"#FFFDFC\",\"#FFFDFC\",\"#FFFDFC\",\"#FFFDFC\",\"#FDFBFF\",\"#FDFBFF\",\"#FDFBFF\",\"#FDFBFF\",\"#FFF0EB\",\"#FFF0EB\",\"#FFCEBD\",\"#FFCCBA\",\"#FFCCBA\",\"#FFCCBA\",\"#FFCCBA\",\"#FFCCBA\",\"#FFCCBA\",\"#FFCCBA\",\"#FFCCBA\",\"#FFCCBA\",\"#FFCCBA\",\"#FFCCBA\",\"#FFAB91\",\"#FFAB91\",\"#FFAB91\",\"#FFAB91\",\"#FFAB91\",\"#FFC0AC\",\"#FFE9E1\",\"#FFE9E1\",\"#FFE9E1\",\"#FFE9E1\",\"#FFEBE4\",\"#FFFDFD\",\"#FFFDFD\",\"#FFFDFD\",\"#FFFDFD\",\"#FFFDFD\",\"#FFFDFD\",\"#FFFDFD\",\"#FFFDFD\",\"#FFFDFD\",\"#FFFDFD\",\"#FFFDFD\",\"#FFFDFD\",\"#FEFEFF\",\"#FDFCFF\",\"#FDFCFF\",\"#FFFEFD\",\"#FFFEFD\",\"#FFE1D6\",\"#FFE1D6\",\"#FFE1D6\",\"#FFE1D6\",\"#FFE1D6\",\"#FFE1D6\",\"#FFE1D6\",\"#FFE1D6\",\"#FFE1D6\",\"#FFE1D6\",\"#FFE1D6\",\"#FF9678\",\"#FF9274\",\"#FF9274\",\"#FF9274\",\"#FF9274\",\"#FF9274\",\"#FF9274\",\"#FFA78C\",\"#FFA488\",\"#FFA488\",\"#FFA488\",\"#FFA488\",\"#FFA488\",\"#FFA488\",\"#FFA488\",\"#FFA185\",\"#FFA185\",\"#FFA185\",\"#FFC5B1\",\"#FFCFBE\",\"#FFCFBE\",\"#FFCFBE\",\"#FFCFBE\",\"#FFCFBE\",\"#FFE1D7\",\"#FFE1D6\",\"#FFE1D6\",\"#FFE4DA\",\"#FFE4DA\",\"#FFE4DA\",\"#FFE3D9\",\"#FFDFD4\",\"#FFDFD4\",\"#FFDFD4\",\"#FFDCCF\",\"#FFDCCF\",\"#FFDCCF\",\"#FFDCCF\",\"#FFDCCF\",\"#FFD9CC\",\"#FFD9CC\",\"#FFD8CA\",\"#FFD8CA\",\"#FFD8CA\",\"#FFD8CA\",\"#FFD8CA\",\"#FFD9CC\",\"#FFD7C9\",\"#FFD7C9\",\"#FFDFD4\",\"#FFE2D7\",\"#FFE2D7\",\"#FFE2D7\",\"#FFE2D7\",\"#FFD9CB\",\"#FFC5B2\",\"#FFC5B2\",\"#FFC5B2\",\"#FFC2AD\",\"#FFC4B0\",\"#FFC4B0\",\"#FFC7B4\",\"#FFC7B4\",\"#FFC7B4\",\"#FFC7B4\",\"#FFC7B4\",\"#FFD1C1\",\"#FFDDD1\",\"#FFE5DC\",\"#FFE1D6\",\"#FFE1D6\",\"#FFE1D6\",\"#FFE4DA\",\"#FFE1D6\",\"#FFCCBB\",\"#FFCFBF\",\"#FFC7B4\",\"#FFC7B4\",\"#FFC7B4\",\"#FFC7B4\",\"#FFC7B4\",\"#FFB8A1\",\"#FFB8A2\",\"#FFB7A0\",\"#FFB7A0\",\"#FFB7A0\"];\n          return color[atom.resi];\n        }"}},"sel":{}}]},"evals":[],"jsHooks":[]}                                  
kin_dat <- create_uptake_dataset(alpha_dat, states = "Alpha_KSCN" )
aggregated_dat <- create_aggregated_uptake_dataset(kin_dat)
plot_aggregated_uptake_structure(aggregated_dat, 
                                 differential = FALSE,
                                 time_t = 1,
                                 pdb_file_path = pdb_file_path)

{"x":{"id":"blank_structure","configs":{"backgroundColor":"#FFFFFF","nomouse":false,"backgroundColor.1":"white","cartoonQuality":10,"lowerZoomLimit":50,"upperZoomLimit":350,"antialias":true,"orthographic":false,"disableFog":false},"api":[{"method":"addModel","data":[""],"format":"pdb","keepH":false,"options":{"keepH":false}},{"method":"setStyle","style":{"cartoon":{"color":"white","style":"rectangle","ribbon":false,"arrows":true,"tubes":false,"thickness":0.4,"opacity":1}},"sel":{}},{"method":"zoomTo"},{"method":"setStyle","style":{"cartoon":{"style":"rectangle","ribbon":false,"arrows":true,"tubes":false,"thickness":0.4,"opacity":1,"colorfunc":"\n        function(atom) {\n          const color = [\"#FF9E81\",\"#FF6C4A\",\"#FF5838\",\"#FF5838\",\"#FF4628\",\"#FF4628\",\"#FF4628\",\"#FF4628\",\"#FF5031\",\"#FF5031\",\"#FF5938\",\"#FF8868\",\"#FF8868\",\"#FF8868\",\"#FF9475\",\"#FF9475\",\"#FF7D5D\",\"#FF7958\",\"#FF7553\",\"#FF7553\",\"#FF6241\",\"#FF4729\",\"#FF3E22\",\"#FF341A\",\"#FF341A\",\"#FF341A\",\"#FF3A1F\",\"#FF3A1F\",\"#FF3A1F\",\"#FF3C20\",\"#FF3C20\",\"#FF3C20\",\"#FF3E22\",\"#FFA387\",\"#FFA387\",\"#FFA387\",\"#FF7251\",\"#FF6A49\",\"#FF5635\",\"#FF5333\",\"#FF5333\",\"#FF5333\",\"#FF5333\",\"#FF5333\",\"#FF5333\",\"#FF5333\",\"#FF5333\",\"#FF5535\",\"#FF5636\",\"#FF5636\",\"#FF7B5A\",\"#FF9C7F\",\"#FF9C7F\",\"#FF9C7F\",\"#FF9C7F\",\"#FF9C7F\",\"#FF9C7F\",\"#FF230F\",\"#FF230F\",\"#FF230F\",\"#FF230F\",\"#FF230F\",\"#FF230F\",\"#FF1C0A\",\"#FF1C0A\",\"#FF1B0A\",\"#FF1B0A\",\"#FF1B0A\",\"#FF1B0A\",\"#FF1B0A\",\"#FF1B0A\",\"#FF1B0A\",\"#FF1B0A\",\"#FF1A09\",\"#FF1A09\",\"#FF1A09\",\"#FF1A09\",\"#FF1A09\",\"#FF1909\",\"#FF1909\",\"#FF1909\",\"#FF1909\",\"#FF1F0C\",\"#FF1F0C\",\"#FF2E16\",\"#FF2D16\",\"#FF2D16\",\"#FF2D16\",\"#FF2D16\",\"#FF2D16\",\"#FF2D16\",\"#FF2D16\",\"#FF2D16\",\"#FF2D16\",\"#FF2D16\",\"#FF2D16\",\"#FF2510\",\"#FF2510\",\"#FF2510\",\"#FF2510\",\"#FF2510\",\"#FF1F0C\",\"#FF2510\",\"#FF2510\",\"#FF2510\",\"#FF2510\",\"#FF2410\",\"#FF220E\",\"#FF220E\",\"#FF220E\",\"#FF220E\",\"#FF220E\",\"#FF220E\",\"#FF220E\",\"#FF220E\",\"#FF220E\",\"#FF220E\",\"#FF220E\",\"#FF220E\",\"#FF210E\",\"#FF210D\",\"#FF210D\",\"#FF210E\",\"#FF210E\",\"#FF1F0D\",\"#FF1F0D\",\"#FF1F0D\",\"#FF1F0D\",\"#FF1F0D\",\"#FF1F0D\",\"#FF1F0D\",\"#FF1F0D\",\"#FF1F0D\",\"#FF1F0D\",\"#FF1F0D\",\"#FFAA90\",\"#FFA58A\",\"#FFA58A\",\"#FFA58A\",\"#FFA58A\",\"#FFA58A\",\"#FFA58A\",\"#FFB7A0\",\"#FFAD94\",\"#FFAD94\",\"#FFAD94\",\"#FFAD94\",\"#FFAD94\",\"#FFAD94\",\"#FFAD94\",\"#FF9A7D\",\"#FF9A7D\",\"#FF9A7D\",\"#FFCAB8\",\"#FFF0EB\",\"#FFF0EB\",\"#FFF0EB\",\"#FFF0EB\",\"#FFF0EB\",\"#FF9F82\",\"#FF997C\",\"#FF997C\",\"#FF8E6F\",\"#FF8E6F\",\"#FF8E6F\",\"#FF8E6F\",\"#FF8767\",\"#FF8767\",\"#FF8666\",\"#FF8A6B\",\"#FF8A6B\",\"#FF8A6B\",\"#FF8A6B\",\"#FF8A6B\",\"#FF8A6B\",\"#FF8A6B\",\"#FF9F82\",\"#FF9F82\",\"#FF9F82\",\"#FF9F82\",\"#FF9F82\",\"#FFA589\",\"#FFA98E\",\"#FFA98E\",\"#FFC8B6\",\"#FFD0C0\",\"#FFD0C0\",\"#FFD0C0\",\"#FFD0C0\",\"#FFC2AD\",\"#FF9C7F\",\"#FF9C7F\",\"#FF9C7F\",\"#FF9172\",\"#FF8868\",\"#FF8868\",\"#FF8464\",\"#FF8464\",\"#FF8464\",\"#FF8464\",\"#FF8464\",\"#FFB59D\",\"#FFE9E1\",\"#FFF0EA\",\"#FFF0EB\",\"#FFF0EB\",\"#FFF0EB\",\"#FFF1EC\",\"#FFEBE4\",\"#FFCFBF\",\"#FFC9B7\",\"#FFC8B5\",\"#FFC8B5\",\"#FFC8B5\",\"#FFC8B5\",\"#FFC8B5\",\"#FFB098\",\"#FF9B7E\",\"#FF8A6A\",\"#FF8A6A\",\"#FF8A6A\"];\n          return color[atom.resi];\n        }"}},"sel":{}}]},"evals":[],"jsHooks":[]}                                 
```
