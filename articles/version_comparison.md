# Comparison between versions

This article discuss differences between the first version of HaDeX, and
the current version of the package and web-server. As the second version
is significantly more complex than the previous one, we ultimately
decided against expanding the first version. Instead we created a new
entity. But how are they different?

## Methods of visualization

Let’s start by discussing methods of visualization available in the
packages and web-servers:

| plot_type              | HaDeX | HaDeX2 |
|:-----------------------|:------|:-------|
| comparison             | TRUE  | TRUE   |
| woods                  | TRUE  | TRUE   |
| uptake curve           | TRUE  | TRUE   |
| diff uptake curve      | FALSE | TRUE   |
| butterfly              | FALSE | TRUE   |
| diff butterfly         | FALSE | TRUE   |
| chiclet                | FALSE | TRUE   |
| diff chiclet           | FALSE | TRUE   |
| heatmap                | FALSE | TRUE   |
| diff heatmap           | FALSE | TRUE   |
| 3D structure           | FALSE | TRUE   |
| volcano                | FALSE | TRUE   |
| manhattan              | FALSE | TRUE   |
| uncertainty            | FALSE | TRUE   |
| coverage               | TRUE  | TRUE   |
| coverage heatmap       | FALSE | TRUE   |
| measurement variablity | FALSE | TRUE   |
| mass uptake curve      | FALSE | TRUE   |

## Web-server features

Let’s see how the features in web-servers differ.

| option                   | HaDeX | HaDeX2 |
|:-------------------------|:------|:-------|
| tooltips                 | TRUE  | TRUE   |
| helpers                  | TRUE  | TRUE   |
| tabular data             | TRUE  | TRUE   |
| times next to each other | FALSE | TRUE   |
| export to external tools | FALSE | TRUE   |

In the table there are shortened names. *Tabular data* means that the
tabular data is available for the plot. *Times next to each other* means
the option of showing all time point data in two forms: one plot or
smaller plots next to each other for time point separately. *Export to
external tools* means an option to dowload data for tools such as
HDXViewer or ChimeraX.

Moreover, in HaDeX2 more visualization options are available.

## Package functions

Finally, let’s take a look at package functions from HaDeX2 and see if
there is a similar function in HaDeX (even under different name)

| HaDeX2                                       | HaDeX                             |
|:---------------------------------------------|:----------------------------------|
| add_stat_dependency                          | add_stat_dependency               |
| calculate_aggregated_diff_uptake             | NA                                |
| calculate_aggregated_test_results            | NA                                |
| calculate_aggregated_uptake                  | NA                                |
| calculate_auc                                | NA                                |
| calculate_back_exchange                      | NA                                |
| calculate_confidence_limit_values            | calculate_confidence_limit_values |
| calculate_diff_uptake                        | NA                                |
| calculate_exp_masses                         | NA                                |
| calculate_exp_masses_per_replicate           | NA                                |
| calculate_kinetics                           | calculate_kinetics                |
| calculate_MHP                                | NA                                |
| calculate_p_value                            | NA                                |
| calculate_peptide_kinetics                   | NA                                |
| calculate_state_uptake                       | NA                                |
| create_aggregated_diff_uptake_dataset        | NA                                |
| create_aggregated_uptake_dataset             | NA                                |
| create_control_dataset                       | NA                                |
| create_diff_uptake_dataset                   | NA                                |
| create_kinetic_dataset                       | NA                                |
| create_overlap_distribution_dataset          | NA                                |
| create_p_diff_uptake_dataset                 | NA                                |
| create_p_diff_uptake_dataset_with_confidence | NA                                |
| quality_control_dataset                      | NA                                |
| create_replicate_dataset                     | NA                                |
| create_state_comparison_dataset              | NA                                |
| create_state_uptake_dataset                  | calculate_state_deuteration       |
| create_uptake_dataset                        | NA                                |
| get_n_replicates                             | NA                                |
| get_peptide_sequence                         | NA                                |
| get_protein_coverage                         | NA                                |
| get_protein_redundancy                       | NA                                |
| get_replicate_list_sd                        | NA                                |
| get_residue_positions                        | NA                                |
| get_structure_color                          | NA                                |
| HaDeX_GUI                                    | HaDeX_gui                         |
| HaDeXify                                     | NA                                |
| install_GUI                                  | NA                                |
| plot_aggregated_differential_uptake          | NA                                |
| plot_aggregated_uptake                       | NA                                |
| plot_aggregated_uptake_structure             | NA                                |
| plot_amino_distribution                      | NA                                |
| plot_butterfly                               | NA                                |
| plot_chiclet                                 | NA                                |
| plot_coverage                                | plot_coverage                     |
| plot_coverage_heatmap                        | NA                                |
| plot_differential                            | woods_plot                        |
| plot_differential_butterfly                  | NA                                |
| plot_differential_chiclet                    | NA                                |
| plot_differential_uptake_curve               | NA                                |
| plot_manhattan                               | NA                                |
| plot_overlap                                 | NA                                |
| plot_overlap_distribution                    | plot_position_frequency           |
| plot_peptide_charge_measurement              | NA                                |
| plot_peptide_mass_measurement                | NA                                |
| plot_position_frequency                      | NA                                |
| plot_quality_control                         | NA                                |
| plot_replicate_histogram                     | NA                                |
| plot_replicate_mass_uptake                   | NA                                |
| plot_state_comparison                        | comparison_plot                   |
| plot_uncertainty                             | NA                                |
| plot_uptake_curve                            | plot_kinetics                     |
| plot_volcano                                 | NA                                |
| prepare_hdxviewer_export                     | NA                                |
| read_hdx                                     | read_hdx                          |
| reconstruct_sequence                         | reconstruct_sequence              |
| show_aggregated_uptake_data                  | NA                                |
| show_coverage_heatmap_data                   | NA                                |
| show_diff_uptake_data                        | NA                                |
| show_diff_uptake_data_confidence             | NA                                |
| show_overlap_data                            | NA                                |
| show_p_diff_uptake_data                      | NA                                |
| show_peptide_charge_measurement              | NA                                |
| show_peptide_mass_measurement                | NA                                |
| show_quality_control_data                    | NA                                |
| show_replicate_histogram_data                | NA                                |
| show_summary_data                            | NA                                |
| show_uc_data                                 | NA                                |
| show_uptake_data                             | NA                                |
| update_hdexaminer_file                       | NA                                |

For pairs of functions, we can conduct the analysis of speed using our
exemplary data.

## Calculation speeds compared

Now we establish the common functionalities for both versions of the
package. Using our exemplary data set, we will check the calculation
times.

Here, I use outputs produced outside of this article, as I need to
compare two packages with the same name.

### Reading a file

This function is called only once, in the beginning of the analysis.
Here, we use an external file to call the read_hdx function.

#### HaDeX

Unit: milliseconds expr

dat \<- read_hdx(“C:\\Users\\User\\Desktop\\alpha dane\\alpha_cut.csv”)

      min       lq      mean   median        uq      max neval

28.0388 29.1341 32.51439 29.7644 31.62845 171.7444 100

#### HaDeX2

Unit: milliseconds expr

dat \<- read_hdx(“C:\\Users\\User\\Desktop\\alpha dane\\alpha_cut.csv”)

     min       lq     mean  median        uq      max neval

91.6636 93.69305 99.43469 95.7432 102.23875 247.0202 100

#### Results

Both packages have a same-called read_hdx function. However, the backend
of HaDeX2 is way more complex as there is a specific data class used,
and several additional check resulting in the speed of reading and
processing a file.

### Ploting a deuterium uptake curve for one state

#### HaDeX

Unit: milliseconds

expr

plt_uc \<- dat %\>% calculate_kinetics(sequence = “GFGDLKSPAGL”, state =
“Alpha_KSCN”, start = 1, end = 11, time_in = 0, time_out = 1440) %\>%
plot_kinetics()

    min       lq      mean   median        uq      max neval

136.4894 146.8239 150.48729 150.3550 154.47640 163.5035 100

#### HaDeX2

Unit: milliseconds

expr plt_uc \<- dat %\>% calculate_peptide_kinetics(sequence =
“GFGDLKSPAGL”, state = “Alpha_KSCN”, start = 1, end = 11, time_0 = 0,
time_100 = 1440) %\>% plot_uptake_curve()

     min       lq     mean  median        uq      max neval

58.4832 60.72755 66.37970 62.4120 69.29155 187.8984 100

#### Results

HaDeX2 plots uptake curve significantly faster.

### Plotting a comparison plot

HaDeX plots the comparison plot only for two states. \### HaDeX

Unit: milliseconds

expr

kin_dat \<- prepare_dataset(dat = dat, in_state_first = “Alpha_KSCN_0”,
chosen_state_first = “Alpha_KSCN_1”, out_state_first =
“Alpha_KSCN_1440”, in_state_second = “ALPHA_Gamma_0”,
chosen_state_second = “ALPHA_Gamma_1”, out_state_second =
“ALPHA_Gamma_1440”)

plt_comparison \<- comparison_plot(calc_dat = kin_dat, theoretical =
FALSE, relative = TRUE, state_first = “Alpha_KSCN”, state_second =
“ALPHA_Gamma”)

      min        lq      mean    median       uq      max neval

157.7022 165.72550 172.73356 170.71385 175.2435 318.6424 100 9.3999
10.19565 12.02505 10.55955 10.9895 38.9871 100

#### HaDeX2

Unit: milliseconds expr

kin_dat \<- create_state_comparison_dataset(dat = dat, states =
c(“Alpha_KSCN”, “ALPHA_Gamma”), time_0 = 0, time_100 = 1440)

plt_comparison \<- plot_state_comparison(kin_dat, theoretical = FALSE,
fractional = TRUE, time_t = 1) min lq mean median uq max neval 41.5048
42.95650 46.76892 43.78060 45.16160 182.4834 100 10.8284 11.47095
12.03373 11.78595 12.25255 21.2830 100

#### Results

The calculations are significantly faster in HaDeX2, but the difference
in plotting time is resulting by new options e.q. selecting the line
size, or interactive mode for GUI.

### Plotting a Woods’s plot

#### HaDeX

Unit: milliseconds

expr

kin_dat \<- prepare_dataset(dat = dat, in_state_first = “Alpha_KSCN_0”,
chosen_state_first = “Alpha_KSCN_1”, out_state_first =
“Alpha_KSCN_1440”, in_state_second = “ALPHA_Gamma_0”,
chosen_state_second = “ALPHA_Gamma_1”, out_state_second =
“ALPHA_Gamma_1440”) plt_woods \<- woods_plot(calc_dat = kin_dat,
theoretical = FALSE, relative = TRUE, confidence_limit = 0.98,
confidence_limit_2 = 0.98)

      min       lq      mean   median        uq      max neval

161.3896 167.9713 176.92851 172.3157 179.08035 326.0088 100 21.7723
23.4672 25.36956 23.9711 24.80085 53.3279 100

#### HaDeX2

Unit: milliseconds

expr

diff_uptake_dat \<- create_diff_uptake_dataset(alpha_dat, state_1 =
“Alpha_KSCN”, state_2 = “ALPHA_Gamma”, time_0 = 0, time_100 = 1440)

plt_woods \<- plot_differential(diff_uptake_dat = diff_uptake_dat,
time_t = 1, theoretical = FALSE, fractional = TRUE, show_houde_interval
= TRUE, confidence_level = 0.98) min lq mean median uq max neval
300.9806 311.9323 331.69155 316.9297 323.84895 1387.3480 100 20.9315
22.2258 23.62265 22.9664 23.85335 33.9916 100

#### Results

As above, the plotting takes more time as it coping with option to
include hybrid statistical testing, as proposed in *Hageman TS, Weis DD.
Reliable Identification of Significant Differences in Differential
Hydrogen Exchange-Mass Spectrometry Measurements Using a Hybrid
Significance Testing Approach. Anal Chem. 2019 Jul 2;91(13):8008-8016.
doi: 10.1021/acs.analchem.9b01325. Epub 2019 Jun 11. PMID: 31099554*. \#
Conclusions

The HaDeX2 package is significantly more powerful than the previous
version. Moreover, it was rewritten for the comfort of use - as can be
shown even by the glance of parameteres supplied to the function.
