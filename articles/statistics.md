# statistics

``` r
library(HaDeX2)
```

Here, we sum up the statistics in HaDeX2. However, some of the elements
are discussed in other articles, in appropriate places, but it was
suggested to create a one document to discuss them all.

## Uncertainty propagation

The propagation of uncertainty is necessary when we are transforming the
measured values. Here, in HDX-MS, we repeat the measurements in
triplicate in order to calculate the uncertainty of mass measurement.
However, when transforming mass measurements into deuterium uptake, we
need to propagate mass measurement, as follows:

$$aggMass = \frac{1}{N}\sum\limits_{k = 1}^{N}Inten_{k} \cdot pepMass_{k}$$.

Where:

- $aggMass$ - mass of the peptide \[Da\], average from replicates,
- $Inten_{k}$ - intensity of the measurement,
- $pepMass$ - mass of the peptide.

The precise equations for deuterium uptake and differential deuterium
uptake for multiple calculation options are available in article
`Calculations`.

Weis, D. D. Recommendations for the Propagation of Uncertainty in
Hydrogen Exchange-Mass Spectrometric Measurements. J. Am. Soc. Mass
Spectrom. 32, 1610–1617 (2021).

Puchała, W. et al. HaDeX: an R package and web-server for analysis of
data from hydrogen–deuterium exchange mass spectrometry experiments.
Bioinformatics 36, 4516–4518 (2020).

## Hybrid testing

Hybrid testing is a combination of two statistical approaches to ensure
that the difference between two biological states is statistically
significant. The difference is significant if two tests simultanously
claims the significance.

However, it can be only achieved when we have the experiment done at
least in triplicate.

Hageman, T. S. & Weis, D. D. Reliable Identification of Significant
Differences in Differential Hydrogen Exchange-Mass Spectrometry
Measurements Using a Hybrid Significance Testing Approach. Anal. Chem.
91, 8008–8016 (2019).

### Houde interval

This test is done for the time points chosen for a given plot e.q. for
the volcano plot, where presenting multiple time points of measurement,
we take the values from all of the presented time points. However, for
Woods Plot we only take into account only one time point - presented on
the plot.

Houde interval is calculated based on the uncertainty of the
measurement - or, more precisely, the propagated uncertainty of the
deuterium uptake (in the same form as values presented on the plot). As
described in the equation:

$$interval = \frac{\sum\limits_{i}^{n}u_{c}\left( du_{n} \right)}{i}*testvalue(k)$$
where:

- $n$ - number of peptides,
- $u_{c}\left( du_{n} \right)$ - uncertainty of the deuterium uptake for
  $i$th peptide,
- $testvalue$ - value for test for $k$ replicates from the table,
- $k$ - number of the replicates of the experiment.

### Student t-test

In order to use student t-test, we need at least three values from each
group - in the case of the differential analysis - at least three
replicate values at given time for each biological state.

## global threshold estimation

## per-timepoint testing

## cross-timepoint/FDR control
