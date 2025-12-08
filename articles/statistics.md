# Statistics

Here, we sum up the statistics in HaDeX2. Some of the elements are
discussed in other articles in appropriate places, but this article
gathers this information in one place.

## Uncertainty propagation

The propagation of uncertainty is necessary when we are transforming the
measured values. In HDX-MS, we repeat the measurements in triplicate in
order to calculate the uncertainty of mass measurement. However, when
transforming mass measurements into deuterium uptake, we need to
propagate mass measurement uncertainty, using the Law of Propagation of
Uncertainty:

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

*Joint Committee for Guides in Metrology. (2008) JCGM 100: evaluation of
measurement data – guide to the expression of uncertainty in
measurement. Technical report, JCGM*

*Weis, D. D. Recommendations for the Propagation of Uncertainty in
Hydrogen Exchange-Mass Spectrometric Measurements. J. Am. Soc. Mass
Spectrom. 32, 1610–1617 (2021).*

*Puchała, W. et al. HaDeX: an R package and web-server for analysis of
data from hydrogen–deuterium exchange mass spectrometry experiments.
Bioinformatics 36, 4516–4518 (2020).*

## Hybrid testing

Hybrid testing is a combination of two statistical approaches to ensure
that the difference between two biological states is statistically
significant. The difference is significant if two tests simultaneously
claims the significance.

However, it can be only achieved when we have the experiment done at
least in triplicate, as it is the condition to perform Student t-test.

*Hageman, T. S. & Weis, D. D. Reliable Identification of Significant
Differences in Differential Hydrogen Exchange-Mass Spectrometry
Measurements Using a Hybrid Significance Testing Approach. Anal. Chem.
91, 8008–8016 (2019).*

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

$$interval = \frac{\sum\limits_{i}^{n}u_{c}\left( du_{n} \right)}{i}*tvalue(k)$$
where:

- $n$ - number of peptides,
- $u_{c}\left( du_{n} \right)$ - uncertainty of the deuterium uptake for
  $i$th peptide,
- $tvalue$ - value for test for $k$ replicates from the table,
- $k$ - number of the replicates of the experiment.

$tvalue$ is calculates as follows, using R-function `qt`:

$$tvalue = qt\left( c(alpha/2,1 - alpha/2),df = k - 1 \right)$$

where the degree of freedom is the number of replicates minus one, and
alpha is $1 - confidencelimit$ for the desired confidence level (usually
0.98).

Basically, we take the mean uncertainty of deuterium uptake and widen
this range by the appropriate value to get an interval. Values under the
interval are too small and may be mistaken with the uncertainty. We are
not interested in them.

*Houde,D. et al. (2011) The utility of hydrogen/deuterium exchange mass
spectrometry in biopharmaceutical comparability studies. J. Pharm. Sci.,
100, 2071–2086.*

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
adjustment method (with three options: none, BH and bonferonni):

``` r
p.adjust(p_dat[["P_value"]], method = p_adjustment_method)
```

P-value is usually presented in the form of $- log(Pvalue)$, e.q. on the
volcano plot.
