# Calculations

In this article we discuss the transformation of the data, with
description of every calculated step. For the visualization methods of
described values, see
[`vignette("visualization")`](https://hadexversum.github.io/HaDeX2/articles/visualization.md).

## Initial processing of the data

Let’s start with a glimpse of the datafile - in this case, in `cluster`
format from DynamX. For more information about accepted datafiles see
[`vignette("data_input")`](https://hadexversum.github.io/HaDeX2/articles/data_input.md)

``` r
library(HaDeX2)
dat <- read_hdx(system.file(package = "HaDeX", "HaDeX/data/KD_180110_CD160_HVEM.csv"))
head(dat, 6)
```

    ##     Protein Start   End        Sequence Modification MaxUptake      MHP  State
    ##      <char> <int> <int>          <char>       <lgcl>     <num>    <num> <char>
    ## 1: db_CD160     1    15 INITSSASQEGTRLN           NA        14 1590.808  CD160
    ## 2: db_CD160     1    15 INITSSASQEGTRLN           NA        14 1590.808  CD160
    ## 3: db_CD160     1    15 INITSSASQEGTRLN           NA        14 1590.808  CD160
    ## 4: db_CD160     1    15 INITSSASQEGTRLN           NA        14 1590.808  CD160
    ## 5: db_CD160     1    15 INITSSASQEGTRLN           NA        14 1590.808  CD160
    ## 6: db_CD160     1    15 INITSSASQEGTRLN           NA        14 1590.808  CD160
    ##    Exposure                    File     z  Inten    Center
    ##       <num>                  <char> <int>  <num>     <num>
    ## 1:    0.000 KD_160527_CD160_sekw_05     1   6592 1591.2584
    ## 2:    0.000 KD_160527_CD160_sekw_05     2 394066  796.3552
    ## 3:    0.000 KD_160527_CD160_sekw_05     3 173526  531.2633
    ## 4:    0.001   KD_160527_CD160_IN_01     2 232221  796.3634
    ## 5:    0.001   KD_160527_CD160_IN_01     3 110675  531.2849
    ## 6:    0.167  KD_160530_CD160_10s_01     2  99894  800.3610

As we see, the data file has a very specific structure and is not
informative yet. In the file, we have $m/z$ values for each $z$ value
(charge) for each time point ($Exposure$) for each state of each
peptide, repeated as many times as measurement was repeated (each
measurement should be repeated at least three times).

Our aim is to have one result with an uncertainty of the measurement per
each peptide in each biological state in each measured time point - data
in this format allows further calculations, e.q. calculating deuterium
uptake values.

For a better understanding of the process of aggregating the data, see
the
[`vignette("transformation")`](https://hadexversum.github.io/HaDeX2/articles/transformation.md)
article.

Within each replicate of the measurement (we recognize each replicate by
the $File$ value), the $m/z$ values are provided for each possible $z$
value. The $m/z$ values are in the $Center$ column, as it is a
geometrical centroid calculated from the isotopic envelope. Firstly, we
have to calculate the mass value, measured experimentally:

$$expMass = z \times (Center - protonMass)$$ To aggregate data from
different $z$ values, we have to calculate the mean mass weighted by
intensity. Additional information about this step and how the weighted
mean impacts the results can be found in
[`vignette("mass_comparison")`](https://hadexversum.github.io/HaDeX2/articles/mass_comparison.md)
article.

$$aggMass = \frac{1}{N}\sum\limits_{k = 1}^{N}Inten_{k} \cdot pepMass_{k}$$.

Where:

- $aggMass$ - mass of the peptide \[Da\], average from replicates,
- $Inten_{k}$ - intensity of the measurement,
- $pepMass$ - mass of the peptide, calculated using Equation 1.

As we use the aggregated result from the replicates, we need to
calculate an uncertainty associated with the measurement. We use the
mean value as the final result, so we need to calculate error as a
standard deviation of the mean, according to the Equation 3:

$$u\left( \overset{\rightarrow}{x} \right) = \sqrt{\frac{\sum\limits_{i = 1}^{n}\left( x_{i} - \overline{x} \right)^{2}}{n(n - 1)}}$$.

Where:

- $x_{i}$ - measured value from a replicate,
- $\overline{x}$ - mean value from all of the replicates,
- $n$ - number of replicates.

Now we have the format we want for further calculations.

## Calculation of the deuterium uptake

HaDeX package provides the calculated values in different forms. All of
them are provided with associated uncertainty of the measurement. All of
the uncertainties are derived from the formula - the Law of propagation
of uncertainty:

$$u_{c}(y) = \sqrt{\sum\limits_{k}\left\lbrack \frac{\partial y}{\partial x_{k}}u\left( x_{k} \right) \right\rbrack^{2}}$$

### Deuterium uptake

Deuterium uptake is the increase of the mass of the peptide in time $t$.
The minimal exchange control $m_{t_{0}}$ is mass measured directly after
adding the buffer (before the start of the exchange), and $m_{t}$ is the
mass measured in chosen time point $t$. The value is in Daltons \[Da\].

$$D = m_{t} - m_{t_{0}}$$ The uncertainty associated with deuterium
uptake \[Da\] (based on equation 3):

$$u_{c}(D) = \sqrt{u\left( m_{t} \right)^{2} + u\left( m_{t_{0}} \right)^{2}}$$

### Fractional deuterium uptake

Fractional deuterium uptake is the ratio of the increase of the mass in
time $t$ to the maximal exchange control. The maximal exchange control
$m_{t_{100}}$ is measured after a long time (chosen by the experimenter,
usually 1440 min = 24 h). It is assumed that after this long time, the
exchange is finished. The minimal exchange control $m_{t_{0}}$ is mass
measured directly after adding the buffer (before the start of the
exchange), and $m_{t}$ is the mass measured in chosen time point $t$.
This value is a percentage value \[%\].

$$D_{frac} = \frac{m_{t} - m_{t_{0}}}{m_{t_{100}} - m_{t_{0}}}$$

The uncertainty associated with fractional deuterium uptake \[%\] (based
on equation 3):

$$u_{c}\left( D_{frac} \right) = \sqrt{\left\lbrack \frac{1}{m_{t_{100}} - m_{t_{0}}}u\left( m_{t} \right) \right\rbrack^{2} + \left\lbrack \frac{m_{t} - m_{t_{100}}}{\left( m_{t_{100}} - m_{t_{0}} \right)^{2}}u\left( m_{t_{0}} \right) \right\rbrack^{2} + \left\lbrack \frac{m_{t_{0}} - m_{t}}{\left( m_{t_{100}} - m_{t_{0}} \right)^{2}}u\left( m_{t_{100}} \right) \right\rbrack^{2}}$$

### Theoretical deuterium uptake

Theoretical deuterium uptake is the increase of mass in time $t$
compared with the theoretical value of the peptide mass without any
exchange ($MHP$ - a mass of the singly charged monoisotopic molecular
ion), and $m_{t}$ is the mass measured in chosen time point $t$. This
value is in daltons \[Da\]:

$$D_{theo} = m_{t} - MHP$$

The uncertainty associated with theoretical deuterium uptake \[Da\] (the
$MHP$ value is a constant without measurement uncertainty - based on the
equation 3):

$$u\left( D_{theo} \right) = u\left( m_{t} \right)$$

### Theoretical fractional deuterium uptake

Theoretical fractional deuterium uptake is the ratio of the increase of
mass in time $t$ compared with a theoretical value of the mass of the
peptide without any exchange to the possible theoretical increase of the
mass, based on the maximal potential uptake of the peptide (based on the
peptide sequence). This value is a percentage value \[%\].

$$D_{theo,frac} = \frac{m_{t} - MHP}{MaxUptake \times protonMass}$$

The uncertainty associated with theoretical fractional deuterium uptake
\[%\] (based on the equation 3):

$$u\left( D_{theo,frac} \right) = \left| \frac{1}{MaxUptake \times protonMass}u\left( D_{t} \right) \right|$$

## Differential values

Differential value is the way to see how the deuterium uptake differs
between two biological states. It allows seeing if the possible
difference is statistically important (more information below). This
value is calculated as the difference between the previously described
(in a chosen form) deuterium uptake of the first and second states.

$$diff = D_{1} - D_{2}$$ The uncertainty associated with the difference
of deuterium uptake (based on the equation 3):

$$u_{c}(diff) = \sqrt{u\left( D_{1} \right)^{2} + u\left( D_{2} \right)^{2}}$$

The convenient way to present results calculated as described is the
comparison plot and differential plot (Woods’ plot).

## Deuterium uptake aggregation

Aggregation of values is inspired by the article by Keppler and Weis
(doi: 10.1007/s13361-014-1033-6). This process can be conducted of any
deuterium uptake variation - fractional or absolute, with theoretical or
experimental control, single-state or differential.

For each residue $i$ there is a subset of peptides ($n$) covering said
residue. Then, the final $D_{i,agg}$ is calculated from the subset of
$D_{k}$ (where \$ 0\<k\<n\$), with weights $w_{k}$ inverse proportional
to the max uptake of peptide ($MaxUptake_{k}$) - the shortest the
peptide the highest the possibility that the uptake took place in said
residue:

$$w_{k} = \frac{\frac{1}{MaxUptake_{k}}}{\sum\limits_{n}\frac{1}{MaxUptake_{k}}}$$
The weights are normalized:

$$\sum\limits_{n}w_{k} = 1$$ Then, the $D_{i,agg}$ is a weighted average
of set of $D_{n}$.

$$D_{i,agg} = \frac{\sum\limits_{n}w_{k} \cdot D_{k}}{\sum\limits_{n}w_{k}}$$
This process is done for each residue $i$ to cover whole protein data.

As for previous values, also for $D_{i,agg}$ the uncertainty is
calculated:

$$u\left( D_{i,agg} \right) = \sqrt{\sum\limits_{n}\left\lbrack \frac{w_{k} \cdot U\left( D_{k} \right)}{\sum\limits_{n}w_{k}} \right\rbrack^{2}}$$

## Back-exchange

Back-exchange is a reverse exchange - from already exchange deuterium
back to hydrogen.

Back-exchange ($bex$) is calculated for each peptide and is defined as
the difference between fractional theoretical deuterium uptake of the
experimental maximal deuterium control and 100% of exchange.

$$bex = 100 - D_{theo,frac}\left( t_{100} \right)$$

## AUC

Area under the curve describes the whole plot. It is calculated with
respect to the last time point, used as normalizing value to obtain the
result from range \[0, 1\]. The normalization is done also for the time
axis.

If the AUC value exceeds the value 1, it is an indicator of
back-exchange.

$$auc = \sum\limits_{i}\left( du_{frac,i + 1} + du_{frac,i} \right) \cdot \left( t_{norm,i + 1} - t_{norm,i} \right) \cdot \frac{1}{2}$$
