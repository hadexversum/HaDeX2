# Statistics

Here, we sum up the statistics in HaDeX2. Some of the elements are
discussed in other articles in appropriate places, but this article
gathers this information in one place.

## Uncertainty propagation

The propagation of uncertainty (Puchała et al. 2020; Weis 2021) is
necessary when we are transforming the measured values. In HDX-MS, we
repeat the measurements in triplicate in order to calculate the
uncertainty of mass measurement. However, when transforming mass
measurements into deuterium uptake, we need to propagate mass
measurement uncertainty, using the Law of Propagation of Uncertainty
(Joint Committee for Guides in Metrology 2008):

$$u_{c}(y) = \sqrt{\sum\limits_{k}\left\lbrack \frac{\partial y}{\partial x_{k}}u\left( x_{k} \right) \right\rbrack^{2}}$$

Where:

- $u_{c}(y)$ - combined uncertainty of value $y$, where $y$ is a
  function of $x_{k}$,
- $x_{k}$ - values for which the uncertainty is known.

This is a generic equation used the derivatives of functions. It is
created for deuterium uptake in the appropriate forms (as the equations
differ based on the parameters of calculations) and described in detail
in the article
[`vignette("datafiles")`](https://hadexversum.github.io/HaDeX2/articles/datafiles.md).

## Hybrid testing

Hybrid testing (Hageman and Weis 2019) is a combination of two
statistical approaches to ensure that the difference between two
biological states is statistically significant. The difference is
significant if two tests simultaneously claim the significance.

However, it can be only achieved when we have the experiment done at
least in triplicate, as it is the condition to perform Student t-test.

### Houde interval

This test is done for the time points chosen for a given plot e.q. for
the volcano plot, where presenting multiple time points of measurement,
we take the values from all of the presented time points. However, for
Woods Plot we only take into account only one time point - presented on
the plot.

Houde interval (Houde, Berkowitz, and Engen 2011) is calculated based on
the uncertainty of the measurement - or, more precisely, the propagated
uncertainty of the deuterium uptake (in the same form as values
presented on the plot). As described in the equation:

$$interval = \frac{\sum\limits_{i}^{n}u_{c}\left( du_{n} \right)}{i}*tvalue(k)$$
where:

- $n$ - number of peptides,
- $u_{c}\left( du_{n} \right)$ - uncertainty of the deuterium uptake for
  $i$th peptide,
- $tvalue$ - value for test for $k$ replicates from the table,
- $k$ - number of the replicates of the experiment.

$tvalue$ is calculated as follows, using R-function `qt`:

$$tvalue = qt\left( c(alpha/2,1 - alpha/2),df = k - 1 \right)$$

where the degree of freedom is the number of replicates minus one, and
alpha is $1 - \text{confidence limit}$ for the desired confidence level
(usually 0.98).

Basically, we take the mean uncertainty of deuterium uptake and widen
this range by the appropriate value to get an interval. Values under the
interval are too small and may be mistaken with the uncertainty. We are
not interested in them.

### Student’s t-test

In order to use student t-test, we need at least three values from each
group - in the case of the differential analysis - at least three
replicate values at given time for each biological state.

This test shows us if the values are from two different distributions
(desired option) or from one - and are the same. We are not interested
in the latter case.

We use the unpaired Student’s t-test to calculate P-value. The null
hypothesis is that this two distributions are the same. If calculated
P-value exceeded limit set for chosen confidence limit, we reject the
null hypothesis and assume that the distributions are different.

To calculate P-value we use base R-function `t.test`

``` r
t.test(x = st_1, y = st_2, 
       paired = FALSE, 
       alternative = "two.sided", 
       conf.level = confidence_level)$p.value
```

where $st_{1}$ is a set of values from the first state, and $st_{2}$
from the second.

If this option is chosen, we adjust the P-value using appropriate
adjustment method (with three options: ‘none’, ‘BH’ and ‘bonferroni’):

``` r
p.adjust(p_dat[["P_value"]], method = p_adjustment_method)
```

p-value is usually presented in the form of
$- log\left( \text{p-value} \right)$, e.q. on the volcano plot.

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
