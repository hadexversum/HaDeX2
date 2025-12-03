
<p>
  <img src="https://raw.githubusercontent.com/hadexversum/HaDeX/master/inst/HaDeX/HaDeX.png" width="100">
</p>

## HaDeX: Analysis and Visualisation of Hydrogen/Deuterium Exchange Mass Spectrometry Data 

Hydrogen/Deuterium eXchange Mass Spectrometry (HDX-MS) is a staple technology in structural proteomics. HaDeX provides a analytic workflow for HDX-MS data available both as [web server](https://hadex2.mslab-ibb.pl/) or **R** package, accompanied by dedicated application [HaDeXGUI](https://github.com/hadexversum/HaDeXGUI). This is a second version on previously published [HaDeX](https://academic.oup.com/bioinformatics/article/36/16/4516/5862011).


### Local instance of HaDeX package

You can install the latest development version of the package:

```R
devtools::install_github("hadexversum/HaDeX2")
```

After installation GUI can be accessed locally:

```R
library(HaDeX2)
HaDeX_GUI()
```

To run the GUI, the dedicated package HaDeXGUI is needed. If is not installed, the called function will check and install it after the confirmation from the user.

### Online manual

The HaDeX documentation is available [online](https://hadexversum.github.io/HaDeX2/).


### Funding  

This work is supported by Foundation of Polish Science (TEAM TECH CORE FACILITY/2016-2/2 *Mass Spectrometry of Biopharmaceuticals - improved methodologies for qualitative, quantitative and structural characterization of drugs, proteinaceous drug targets and diagnostic molecules)*, Narodowe Centrum Nauki (Preludium Bis 1 2019/35/O/NZ2/03745 *Wysokorozdzielcza analiza danych z eksperymentów wymiany proton-deuter monitorowanych spektrometrią mas*) as well as (Sonata 19 2023/51/D/NZ7/02847 *Ujarzmić agregację z AmyloGraphem 2.0: baza danych i model predykcyjny modulatorów samoorganizacji amyloidowej*), and Narodowa Agencja Wymiany Akademickiej (PPN/STA/2021/1/00025).
