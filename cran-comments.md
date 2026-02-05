## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.

Using local win-builder there was no error, no warning and one note:

```
installed size is  8.5Mb
     sub-directories of 1Mb or more:
       HaDeX   3.8Mb
       doc     3.4Mb
```

The size is mostly caused by our extensive documentation and necessary external data files used in Examples. 

The function examples exceeding 5s run time are put in donttest clause (regarding functions: calculate_aggregated_uptake, create_aggregated_difference_dataset, create_aggregated_uptake_dataset, get_residue_positions, plot_aggregated_difference, plot_aggregated_uptake, plot_differential, prepare_hdxviewer_export, plot_aggregated_uptake_structure, show_aggregated_uptake_data). Clause dontrun is not used.

Added missing arguments and values. Functions HaDeX_GUI and install_GUI do not take any arguments so there is no arguments tag.

Words suggested as misspelled - "HDX", "Spectrometry", "eXchange" - are parts of software/technique proper names.

Other issues fixed without comments. 

## Tested environments

* local Windows install (x86_64-w64-mingw32, R 4.3.3)
* win devel with win-builder.r-project.org
* rhub Github Actions: linux, windows

## Why it is HaDeX2, not HaDeX 2.0?

HaDeX2 is a complete rewrite and redesign of the original HaDeX package, a companion tool to our article 10.1093/bioinformatics/btaa587. The scope of changes is so substantial that HaDeX2 constitutes a fundamentally new package rather than a continuation of HaDeX. At the same time, HaDeX remains a published package that requires ongoing maintenance. For these reasons, we requested that the CRAN team release HaDeX2 as a separate package, a request that was accepted on 26 November 2025.
