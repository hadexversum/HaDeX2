[![published in: Bioinformatics](https://img.shields.io/badge/published%20in-Bioinformatics-green.svg)](http://dx.doi.org/10.1093/bioinformatics/btaa587)
[![R build status](https://github.com/hadexversum/HaDeX/workflows/R-CMD-check/badge.svg)](https://github.com/hadexversum/HaDeX/actions)
[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/HaDeX)](https://cran.r-project.org/package=HaDeX)
[![license](https://img.shields.io/badge/license-GPL--3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)
[![metacran downloads](https://cranlogs.r-pkg.org/badges/grand-total/HaDeX)](https://cran.r-project.org/package=HaDeX)
[![DOI](https://zenodo.org/badge/170578005.svg)](https://zenodo.org/badge/latestdoi/170578005)


<p>
  <img src="https://raw.githubusercontent.com/hadexversum/HaDeX/master/inst/HaDeX/HaDeX.png" width="100">
</p>

## HaDeX: Analysis and Visualisation of Hydrogen/Deuterium Exchange Mass Spectrometry Data 

Hydrogen/Deuterium eXchange Mass Spectrometry (HDX-MS) is a staple technology in structural proteomics. HaDeX provides a analytic workflow for HDX-MS data available both as web server (https://hadex2.mslab-ibb.pl/) or **R** package.


### Local instance of HaDeX package

You can install the latest development version of the package:

```R
devtools::install_github("hadexversum/HaDeX2")
```

After installation GUI can be accessed locally:

```R
library(HaDeX)
HaDeX_GUI()
```

To run the GUI, the dedicated package HaDeXGUI is needed. If is not installed, the called function will check and install it after the confirmation from the user.

### Online manual

The HaDeX documentation is available [online](https://hadexversum.github.io/HaDeX2/).

### Citation

Puchala W, Burdukiewicz M, Kistowski M, Dabrowska KA, Badaczewska-Dawid AE, Cysewski D and Dadlez M (2020). HaDeX: Analysis and Visualisation of Hydrogen/Deuterium Exchange Mass Spectrometry Data. Bioinformatics, 10.1093/bioinformatics/btaa587.

### Funding  

This work is supported by Foundation of Polish Science (TEAM TECH CORE FACILITY/2016-2/2 *Mass Spectrometry of Biopharmaceuticals - improved methodologies for qualitative, quantitative and structural characterization of drugs, proteinaceous drug targets and diagnostic molecules)* and Narodowe Centrum Nauki (Preludium Bis 1 2019/35/O/NZ2/03745 *Wysokorozdzielcza analiza danych z eksperymentów wymiany proton-deuter monitorowanych spektrometrią mas)*.
