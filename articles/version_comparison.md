# Comparison between versions

This article discuss differences between the first version of HaDeX, and
the current version of the package and web-server. As the second version
is significantly more complex than the previous one, we ultimately
decided against expanding the first version. Instead we created a new
entity. But how are they different?

## Functionalities

Let us start by discussing methods of visualization:

    ##                 plot_type HaDeX HaDeX2
    ## 1              comparison  TRUE   TRUE
    ## 2                   woods  TRUE   TRUE
    ## 3            uptake curve  TRUE   TRUE
    ## 4       diff uptake curve FALSE   TRUE
    ## 5               butterfly FALSE   TRUE
    ## 6          diff butterfly FALSE   TRUE
    ## 7                 chiclet FALSE   TRUE
    ## 8            diff chiclet FALSE   TRUE
    ## 9                 heatmap FALSE   TRUE
    ## 10           diff heatmap FALSE   TRUE
    ## 11           3D structure FALSE   TRUE
    ## 12                volcano FALSE   TRUE
    ## 13              manhattan FALSE   TRUE
    ## 14            uncertainty FALSE   TRUE
    ## 15               coverage  TRUE   TRUE
    ## 16       coverage heatmap FALSE   TRUE
    ## 17 measurement variablity FALSE   TRUE
    ## 18      mass uptake curve FALSE   TRUE

## Package functions

Finally, let’s take a look at package functions from HaDeX2 and see if
there is a similar function in HaDeX (even under different name)

    ##                                          HaDeX2
    ## 1                           add_stat_dependency
    ## 2              calculate_aggregated_diff_uptake
    ## 3             calculate_aggregated_test_results
    ## 4                   calculate_aggregated_uptake
    ## 5                                 calculate_auc
    ## 6                       calculate_back_exchange
    ## 7             calculate_confidence_limit_values
    ## 8                         calculate_diff_uptake
    ## 9                          calculate_exp_masses
    ## 10           calculate_exp_masses_per_replicate
    ## 11                           calculate_kinetics
    ## 12                                calculate_MHP
    ## 13                            calculate_p_value
    ## 14                   calculate_peptide_kinetics
    ## 15                       calculate_state_uptake
    ## 16        create_aggregated_diff_uptake_dataset
    ## 17             create_aggregated_uptake_dataset
    ## 18                       create_control_dataset
    ## 19                   create_diff_uptake_dataset
    ## 20                       create_kinetic_dataset
    ## 21          create_overlap_distribution_dataset
    ## 22                 create_p_diff_uptake_dataset
    ## 23 create_p_diff_uptake_dataset_with_confidence
    ## 24                      quality_control_dataset
    ## 25                     create_replicate_dataset
    ## 26              create_state_comparison_dataset
    ## 27                  create_state_uptake_dataset
    ## 28                        create_uptake_dataset
    ## 29                             get_n_replicates
    ## 30                         get_peptide_sequence
    ## 31                         get_protein_coverage
    ## 32                       get_protein_redundancy
    ## 33                        get_replicate_list_sd
    ## 34                        get_residue_positions
    ## 35                          get_structure_color
    ## 36                                    HaDeX_GUI
    ## 37                                     HaDeXify
    ## 38                                  install_GUI
    ## 39          plot_aggregated_differential_uptake
    ## 40                       plot_aggregated_uptake
    ## 41             plot_aggregated_uptake_structure
    ## 42                      plot_amino_distribution
    ## 43                               plot_butterfly
    ## 44                                 plot_chiclet
    ## 45                                plot_coverage
    ## 46                        plot_coverage_heatmap
    ## 47                            plot_differential
    ## 48                  plot_differential_butterfly
    ## 49                    plot_differential_chiclet
    ## 50               plot_differential_uptake_curve
    ## 51                               plot_manhattan
    ## 52                                 plot_overlap
    ## 53                    plot_overlap_distribution
    ## 54              plot_peptide_charge_measurement
    ## 55                plot_peptide_mass_measurement
    ## 56                      plot_position_frequency
    ## 57                         plot_quality_control
    ## 58                     plot_replicate_histogram
    ## 59                   plot_replicate_mass_uptake
    ## 60                        plot_state_comparison
    ## 61                             plot_uncertainty
    ## 62                            plot_uptake_curve
    ## 63                                 plot_volcano
    ## 64                     prepare_hdxviewer_export
    ## 65                                     read_hdx
    ## 66                         reconstruct_sequence
    ## 67                  show_aggregated_uptake_data
    ## 68                   show_coverage_heatmap_data
    ## 69                        show_diff_uptake_data
    ## 70             show_diff_uptake_data_confidence
    ## 71                            show_overlap_data
    ## 72                      show_p_diff_uptake_data
    ## 73              show_peptide_charge_measurement
    ## 74                show_peptide_mass_measurement
    ## 75                    show_quality_control_data
    ## 76                show_replicate_histogram_data
    ## 77                            show_summary_data
    ## 78                                 show_uc_data
    ## 79                             show_uptake_data
    ## 80                       update_hdexaminer_file
    ##                                HaDeX
    ## 1                add_stat_dependency
    ## 2                               <NA>
    ## 3                               <NA>
    ## 4                               <NA>
    ## 5                               <NA>
    ## 6                               <NA>
    ## 7  calculate_confidence_limit_values
    ## 8                               <NA>
    ## 9                               <NA>
    ## 10                              <NA>
    ## 11                calculate_kinetics
    ## 12                              <NA>
    ## 13                              <NA>
    ## 14                              <NA>
    ## 15                              <NA>
    ## 16                              <NA>
    ## 17                              <NA>
    ## 18                              <NA>
    ## 19                              <NA>
    ## 20                              <NA>
    ## 21                              <NA>
    ## 22                              <NA>
    ## 23                              <NA>
    ## 24                              <NA>
    ## 25                              <NA>
    ## 26                              <NA>
    ## 27       calculate_state_deuteration
    ## 28                              <NA>
    ## 29                              <NA>
    ## 30                              <NA>
    ## 31                              <NA>
    ## 32                              <NA>
    ## 33                              <NA>
    ## 34                              <NA>
    ## 35                              <NA>
    ## 36                         HaDeX_gui
    ## 37                              <NA>
    ## 38                              <NA>
    ## 39                              <NA>
    ## 40                              <NA>
    ## 41                              <NA>
    ## 42                              <NA>
    ## 43                              <NA>
    ## 44                              <NA>
    ## 45                     plot_coverage
    ## 46                              <NA>
    ## 47                        woods_plot
    ## 48                              <NA>
    ## 49                              <NA>
    ## 50                              <NA>
    ## 51                              <NA>
    ## 52                              <NA>
    ## 53           plot_position_frequency
    ## 54                              <NA>
    ## 55                              <NA>
    ## 56                              <NA>
    ## 57                              <NA>
    ## 58                              <NA>
    ## 59                              <NA>
    ## 60                   comparison_plot
    ## 61                              <NA>
    ## 62                     plot_kinetics
    ## 63                              <NA>
    ## 64                              <NA>
    ## 65                          read_hdx
    ## 66              reconstruct_sequence
    ## 67                              <NA>
    ## 68                              <NA>
    ## 69                              <NA>
    ## 70                              <NA>
    ## 71                              <NA>
    ## 72                              <NA>
    ## 73                              <NA>
    ## 74                              <NA>
    ## 75                              <NA>
    ## 76                              <NA>
    ## 77                              <NA>
    ## 78                              <NA>
    ## 79                              <NA>
    ## 80                              <NA>

For pairs of functions, we can conduct the analysis of speed using our
exemplary data.

## Calculation speeds compared

Now we establish the common functionalities for both versions of the
package. Using our exemplary data set, we will check the calculation
times.
