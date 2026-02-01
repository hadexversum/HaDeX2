# Calculations

This article explains how HaDeX2 processes raw HDX-MS data files into
aggregated datasets used for downstream analysis and visualization. It
describes the processing of the data, the calculation workflow, and the
results. For the visualization methods of described values, see
[`vignette("visualization")`](https://hadexversum.github.io/HaDeX2/articles/visualization.md).

## 1 Initial processing of the data

Let’s start with a glimpse of the datafile - in this case, in `cluster`
format from DynamX. For more information about accepted datafiles see
[`vignette("data_input")`](https://hadexversum.github.io/HaDeX2/articles/data_input.md)

``` r
library(HaDeX2)
head(alpha_dat, 6)
```

    ##      Protein Start   End    Sequence Modification MaxUptake      MHP
    ##       <char> <int> <int>      <char>       <lgcl>     <int>    <num>
    ## 1: db_eEF1Ba     1    11 GFGDLKSPAGL           NA         9 1061.563
    ## 2: db_eEF1Ba     1    11 GFGDLKSPAGL           NA         9 1061.563
    ## 3: db_eEF1Ba     1    11 GFGDLKSPAGL           NA         9 1061.563
    ## 4: db_eEF1Ba     1    11 GFGDLKSPAGL           NA         9 1061.563
    ## 5: db_eEF1Ba     1    11 GFGDLKSPAGL           NA         9 1061.563
    ## 6: db_eEF1Ba     1    11 GFGDLKSPAGL           NA         9 1061.563
    ##          State Exposure                              File     z  Inten
    ##         <char>    <num>                            <char> <int>  <int>
    ## 1: ALPHA_Gamma    0.000 Tania_161112_eEF1Ba_KSCN_IMS_seq1     1 138844
    ## 2: ALPHA_Gamma    0.000 Tania_161112_eEF1Ba_KSCN_IMS_seq1     2 728218
    ## 3: ALPHA_Gamma    0.167  Tania_161109_1eEF1Bag_KSCN_10sec     1  41100
    ## 4: ALPHA_Gamma    0.167  Tania_161109_1eEF1Bag_KSCN_10sec     2 393115
    ## 5: ALPHA_Gamma    0.167  Tania_161109_2eEF1Bag_KSCN_10sec     1  46642
    ## 6: ALPHA_Gamma    0.167  Tania_161109_2eEF1Bag_KSCN_10sec     2 466233
    ##       Center
    ##        <num>
    ## 1: 1062.1913
    ## 2:  531.6754
    ## 3: 1064.0150
    ## 4:  532.4975
    ## 5: 1063.9682
    ## 6:  532.4951

As we see, the data file has a very specific structure and is not
informative yet. In the file, we have \\m/z\\ values for each \\z\\
value (charge) for each time point (\\Exposure\\) for each state of each
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
the \\File\\ value), the \\m/z\\ values are provided for each possible
\\z\\ value. The \\m/z\\ values are in the \\Center\\ column, as it is a
geometrical centroid calculated from the isotopic envelope. Firstly, we
have to calculate the mass value, measured experimentally:

\\expMass = z \times (Center-protonMass)\tag{1}\\ To aggregate data from
different \\z\\ values, we have to calculate the mean mass weighted by
intensity. Additional information about this step and how the weighted
mean impacts the results can be found in
[`vignette("mass_comparison")`](https://hadexversum.github.io/HaDeX2/articles/mass_comparison.md)
article.

\\aggMass = \frac{1}{N}\sum\_{k =
1}^{N}Inten_k{\cdot}pepMass_k\tag{2}\\.

Where:

- \\aggMass\\ - mass of the peptide \[Da\], average from replicates,
- \\Inten_k\\ - intensity of the measurement,
- \\pepMass\\ - mass of the peptide, calculated using Equation 1.

As we use the aggregated result from the replicates, we need to
calculate an uncertainty associated with the measurement. We use the
mean value as the final result, so we need to calculate error as a
standard deviation of the mean, according to the Equation 3:

\\u(\vec{x}) = \sqrt{\frac{ \sum\_{i=1}^n \left( x\_{i} - \overline{x}
\right)^2}{n(n-1)}}\tag{3}\\.

Where:

- \\x\_{i}\\ - measured value from a replicate,
- \\\overline{x}\\ - mean value from all of the replicates,
- \\n\\ - number of replicates.

Now we have the format we want for further calculations.

## 2 Calculation of the deuterium uptake

HaDeX package provides the calculated values in different forms. All of
them are provided with associated uncertainty of the measurement. All of
the uncertainties are derived from the formula - the Law of propagation
of uncertainty:

\\u\_{c}(y) = \sqrt{\sum\_{k} \left\[ \frac{\partial y}{\partial x\_{k}}
u(x\_{k}) \right\]^2}\\

### 2.1 Deuterium uptake

Deuterium uptake is the increase of the mass of the peptide in time
\\t\\. The minimal exchange control \\m\_{t_0}\\ is mass measured
directly after adding the buffer (before the start of the exchange), and
\\m_t\\ is the mass measured in chosen time point \\t\\. The value is in
Daltons \[Da\].

\\D = m\_{t} - m\_{t_0}\\ The uncertainty associated with deuterium
uptake \[Da\] (based on equation 3):

\\u_c(D) = \sqrt{u(m_t)^2 + u(m\_{t_0})^2}\\

### 2.2 Fractional deuterium uptake

Fractional deuterium uptake is the ratio of the increase of the mass in
time \\t\\ to the maximal exchange control. The maximal exchange control
\\m\_{t\_{100}}\\ is measured after a long time (chosen by the
experimenter, usually 1440 min = 24 h). It is assumed that after this
long time, the exchange is finished. The minimal exchange control
\\m\_{t_0}\\ is mass measured directly after adding the buffer (before
the start of the exchange), and \\m_t\\ is the mass measured in chosen
time point \\t\\. This value is a percentage value \[%\].

\\D\_{frac} = \frac{m\_{t} - m\_{t_0}}{m\_{t\_{100}} - m\_{t_0}}\\

The uncertainty associated with fractional deuterium uptake \[%\] (based
on equation 3):

\\u\_{c}(D\_{frac}) = \sqrt{ \left\[ \frac{1}{m\_{t\_{100}}-m\_{t_0}}
u(m\_{t}) \right\]^2 + \left\[ \frac{m\_{t} -
m\_{t\_{100}}}{(m\_{t\_{100}}-m\_{t_0})^2} u(m\_{t_0}) \right\]^2 +
\left\[ \frac{m\_{t_0} - m\_{t}}{(m\_{t\_{100}}-m\_{t_0})^2} u
(m\_{t\_{100}}) \right\]^2}\\

### 2.3 Theoretical deuterium uptake

Theoretical deuterium uptake is the increase of mass in time \\t\\
compared with the theoretical value of the peptide mass without any
exchange (\\MHP\\ - a mass of the singly charged monoisotopic molecular
ion), and \\m_t\\ is the mass measured in chosen time point \\t\\. This
value is in daltons \[Da\]:

\\D\_{theo} = m\_{t} - MHP\\

The uncertainty associated with theoretical deuterium uptake \[Da\] (the
\\MHP\\ value is a constant without measurement uncertainty - based on
the equation 3):

\\u(D\_{theo}) = u(m_t)\\

### 2.4 Theoretical fractional deuterium uptake

Theoretical fractional deuterium uptake is the ratio of the increase of
mass in time \\t\\ compared with a theoretical value of the mass of the
peptide without any exchange to the possible theoretical increase of the
mass, based on the maximal potential uptake of the peptide (based on the
peptide sequence). This value is a percentage value \[%\].

\\D\_{theo, frac} = \frac{m\_{t}-MHP}{MaxUptake \times protonMass}\\

The uncertainty associated with theoretical fractional deuterium uptake
\[%\] (based on the equation 3):

\\u(D\_{theo, frac}) = \left\|\frac{1}{MaxUptake \times protonMass}
u(D\_{t}) \right\|\\

## 3 Differential values

Differential value is the way to see how the deuterium uptake differs
between two biological states. It allows seeing if the possible
difference is statistically important (more information below). This
value is calculated as the difference between the previously described
(in a chosen form) deuterium uptake of the first and second states.

\\diff = D\_{1} - D\_{2}\\ The uncertainty associated with the
difference of deuterium uptake (based on the equation 3):

\\u\_{c}(diff) = \sqrt{u(D\_{1})^2 + u(D\_{2})^2}\\

The convenient way to present results calculated as described is the
comparison plot and differential plot (Woods’ plot).

## 4 Deuterium uptake averaging

Averaging of the deuterium uptake values is inspired by an already
published solution (Keppel and Weis 2015). This process can be conducted
of any deuterium uptake variation - fractional or absolute, with
theoretical or experimental control, single-state or differential.

For each residue \\i\\ there is a subset of peptides (\\n\\) covering
said residue. Then, the final \\D\_{i, agg}\\ is calculated from the
subset of \\D_k\\ (where \\0\<k\<n\\), with weights \\w_k\\ inverse
proportional to the max uptake of peptide (\\MaxUptake_k\\) - the
shortest the peptide the highest the possibility that the uptake took
place in said residue:

\\ w_k = \frac{\frac{1}{MaxUptake_k}}{\sum_n \frac{1}{MaxUptake_k}} \\
The weights are normalized:

\\ \sum_n w_k = 1 \\ Then, the \\D\_{i, agg}\\ is a weighted average of
set of \\D_n\\.

\\ D\_{i, agg} = \frac{\sum_n w_k \cdot D_k}{\sum_n w_k} \\ This process
is done for each residue \\i\\ to cover whole protein data.

As for previous values, also for \\D\_{i, agg}\\ the uncertainty is
calculated:

\\ u(D\_{i, agg}) = \sqrt{ \sum\_{n} \left\[ \frac{ w_k \cdot U(D_k)}{
\sum_n w_k } \right\] ^2} \\

## 5 Back-exchange

Back-exchange is a reverse exchange - from already exchange deuterium
back to hydrogen.

Back-exchange (\\bex\\) is calculated for each peptide and is defined as
the difference between fractional theoretical deuterium uptake of the
experimental maximal deuterium control and 100% of exchange.

\\ bex = 100 - D\_{theo, frac}(t\_{100}) \\

## 6 AUC

The Area Under the Curve (AUC) represents the integral of the deuterium
uptake curve. In this context, higher AUC values characterize rapidly
exchanging peptides, while lower values signify minimal exchange. To
constrain the results to a \\\[0, 1\]\\ range, the AUC is normalized
against the maximum theoretical uptake at the last measured time point.
Consequently, an AUC exceeding 1 serves as a diagnostic indicator of
back-exchange.

\\ \textrm{AUC} = \sum_i^{n-1} (D\_{frac, i+1} + D\_{frac, i}) \cdot
(t\_{\textrm{norm}, i+1} - t\_{\textrm{norm}, i}) \cdot \frac{1}{2} \\

Keppel, Theodore R., and David D. Weis. 2015. “Mapping Residual
Structure in Intrinsically Disordered Proteins at Residue Resolution
Using Millisecond Hydrogen/Deuterium Exchange and Residue Averaging.”
*Journal of the American Society for Mass Spectrometry* 26 (4): 547–54.
<https://doi.org/10.1007/s13361-014-1033-6>.
