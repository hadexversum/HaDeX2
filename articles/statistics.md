# Statistics

Here, we sum up the statistics in HaDeX2. Some of the elements are
discussed in other articles in appropriate places, but this article
gathers this information in one place.

## 1 Uncertainty propagation

The propagation of uncertainty (Puchała et al. 2020; Weis 2021) is
necessary when we are transforming the measured values. In HDX-MS, we
repeat the measurements in triplicate in order to calculate the
uncertainty of mass measurement. However, when transforming mass
measurements into deuterium uptake, we need to propagate mass
measurement uncertainty, using the Law of Propagation of Uncertainty
(Joint Committee for Guides in Metrology 2008):

\\u\_{c}(y) = \sqrt{\sum\_{k} \left\[ \frac{\partial y}{\partial x\_{k}}
u(x\_{k}) \right\]^2}\\

Where:

- \\u_c(y)\\ - combined uncertainty of value \\y\\, where \\y\\ is a
  function of \\x_k\\,
- \\x_k\\ - values for which the uncertainty is known.

This is a generic equation used for the propagation of uncertainty in
functions of multiple variables. It is instantiated for deuterium uptake
in its appropriate formulations, as the specific expressions differ
depending on the parameters of the calculation, and is described in
detail in the dedicated subsection @ref(#unc).

## 2 Hybrid testing

HaDeX offers the hybrid testing procedure (Hageman and Weis 2019)
because it addressed the trade-off between false positives and loss of
power in the analysis of HDX-MS data. The hybrid test applies a
two-stage decision rule to identify significantly different deuterium
uptakes. First, the observed difference in deuterium uptake must exceed
a globally estimated uncertainty threshold derived from pooled
experimental standard deviations, ensuring that the effect is larger
than expected measurement error. Only differences passing this
magnitude-based filter are then evaluated using a replicate-aware
hypothesis test, implemented as a Welch’s t-test, to assess whether the
observed difference is statistically supported given the individual
variances. A difference is considered significant only when both
criteria are satisfied simultaneously.

Although the hybrid test offers superior statistical power compared to
more classical statistical approaches, it is more data-intensive and
therefore can be performed only when the user provides the experiment
with at least three experimental replicates.

### 2.1 Houde interval

This test is done for the time points chosen for a given plot e.q. for
the volcano plot, where presenting multiple time points of measurement,
we take the values from all of the presented time points. However, for
Woods Plot we only take into account only one time point - presented on
the plot.

Houde interval (Houde, Berkowitz, and Engen 2011) is calculated based on
the uncertainty of the measurement - or, more precisely, the propagated
uncertainty of the deuterium uptake (in the same form as values
presented on the plot). As described in the equation:

\\interval = \frac{\sum_i^n u_c(du_n)}{i}\*tvalue(k) \\ where:

- \\n\\ - number of peptides,
- \\u_c(du_n)\\ - uncertainty of the deuterium uptake for \\i\\th
  peptide,
- \\tvalue\\ - value for test for \\k\\ replicates from the table,
- \\k\\ - number of the replicates of the experiment.

\\tvalue\\ is calculated as follows, using R-function `qt`:

\\tvalue = qt(c(alpha/2, 1-alpha/2), df = k-1)\\

where the degree of freedom is the number of replicates minus one, and
alpha is \\1-\textrm{confidence limit}\\ for the desired confidence
level (usually 0.98).

Basically, we take the mean uncertainty of deuterium uptake and widen
this range by the appropriate value to get an interval. Values under the
interval are too small and may be mistaken with the uncertainty. We are
not interested in them.

### 2.2 Student’s t-test

In order to use student t-test, we need at least three values from each
group - in the case of the differential analysis - at least three
replicate values at given time for each biological state.

This test shows us if the values are from two different distributions
(desired option) or from one - and are the same. We are not interested
in the latter case.

We use the unpaired Student’s t-test to calculate p-value. The null
hypothesis is that this two distributions are the same. If calculated
p-value exceeded limit set for chosen confidence limit, we reject the
null hypothesis and assume that the distributions are different.

To calculate p-value we use base R-function `t.test`

``` r
t.test(x = st_1, y = st_2, 
       paired = FALSE, 
       alternative = "two.sided", 
       conf.level = confidence_level)$p.value
```

where \\st_1\\ is a set of values from the first state, and \\st_2\\
from the second.

If this option is chosen, we adjust the p-value using appropriate
adjustment method (with three options: ‘none’, ‘BH’ and ‘bonferroni’):

``` r
p.adjust(p_dat[["P_value"]], method = p_adjustment_method)
```

p-value is usually presented in the form of \\-log(\textrm{p-value})\\,
e.g. on the volcano plot.

Hageman, Tyler S., and David D. Weis. 2019. “Reliable Identification of
Significant Differences in Differential Hydrogen Exchange-Mass
Spectrometry Measurements Using a Hybrid Significance Testing Approach.”
*Analytical Chemistry* 91 (13): 8008–16.
<https://doi.org/10.1021/acs.analchem.9b01325>.

Houde, Damian, Steven A. Berkowitz, and John R. Engen. 2011. “The
Utility of Hydrogen/Deuterium Exchange Mass Spectrometry in
Biopharmaceutical Comparability Studies.” *Journal of Pharmaceutical
Sciences* 100 (6): 2071–86. <https://doi.org/10.1002/jps.22432>.

Joint Committee for Guides in Metrology. 2008. “JCGM 100:2008 Evaluation
of Measurement Data — Guide to the Expression of Uncertainty in
Measurement.” Technical Report JCGM 100:2008. Joint Committee for Guides
in Metrology.

Puchała, Weronika, Michał Burdukiewicz, Michał Kistowski, Katarzyna A.
Dąbrowska, Aleksandra E. Badaczewska-Dawid, Dominik Cysewski, and Michał
Dadlez. 2020. “HaDeX: An R Package and Web-Server for Analysis of Data
from Hydrogen-Deuterium Exchange Mass Spectrometry Experiments.”
*Bioinformatics (Oxford, England)* 36 (16): 4516–18.
<https://doi.org/10.1093/bioinformatics/btaa587>.

Weis, David D. 2021. “Recommendations for the Propagation of Uncertainty
in Hydrogen Exchange-Mass Spectrometric Measurements.” *Journal of the
American Society for Mass Spectrometry* 32 (7): 1610–17.
<https://doi.org/10.1021/jasms.0c00475>.
