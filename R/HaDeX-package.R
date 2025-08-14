#' HaDeX
#'
#' @description The \code{HaDeX} package is a toolbox for the analysis of HDX-MS data.
#' 
#' @author Weronika Puchala, Michal Burdukiewicz.
#' @docType package
#' @name HaDeX-package
#' @aliases HaDeX
"_PACKAGE"

if(getRversion() >= "2.15.1")  
  utils::globalVariables(c('.', 'Center', 'End', 'Exposure', 'File', 'Inten', 'MHP', 'MaxUptake', 
                           'Med_Sequence', 'Protein', 'Sequence', 'Start', 'State', 'State_Exposure', 
                           'avg_exp_mass', 'avg_theo_in_time_1', 'avg_theo_in_time_2', 
                           'chosen_time_mean_1', 'chosen_time_mean_2', 'diff_frac_exch', 'diff_theo_frac_exch', 
                           'err_avg_theo_in_time_1', 'err_avg_theo_in_time_2', 'err_chosen_time_mean_1', 
                           'err_chosen_time_mean_2', 'err_diff_theo_frac_exch', 'err_frac_exch', 
                           'err_frac_exch_state_1', 'err_frac_exch_state_2', 'err_in_time_mean_1', 
                           'err_in_time_mean_2', 'err_out_time_mean_1', 'err_out_time_mean_2', 
                           'exp_mass', 'frac_exch_state_1', 'frac_exch_state_2', 
                           'in_time_mean_1', 'in_time_mean_2', 'out_time_mean_1', 'out_time_mean_2', 'z',
                           'abs_avg_theo_in_time_1', 'abs_avg_theo_in_time_2', 'abs_diff_frac_exch', 'abs_diff_theo_frac_exch', 
                           'abs_frac_exch_state_1', 'abs_frac_exch_state_2', 'colour', 'err_abs_avg_theo_in_time_1', 
                           'err_abs_avg_theo_in_time_2', 'err_abs_diff_frac_exch', 'err_abs_diff_theo_frac_exch', 
                           'err_abs_frac_exch_state_1', 'err_abs_frac_exch_state_2',
                           'Fragment', 'ID', 'Modification', 'abs_avg_theo_in_time', 'abs_frac_exch_state', 
                           'avg_theo_in_time', 'err_abs_avg_theo_in_time', 'err_abs_frac_exch_state', 
                           'err_avg_theo_in_time', 'err_frac_exch_state', 'err_time_chosen_mean', 
                           'err_time_in_mean', 'err_time_out_mean', 'frac_exch_state', 'time_chosen_mean', 
                           'time_in_mean', 'time_out_mean', 'value', 'x', 'coverage', 'time_chosen',
                           'prop', 'n_rep',
                           'P_value', 'RT', 'aa', 'affinity', 'amino', 'auc', 'avg_diff', 'avg_err_state_1', 
                           'avg_err_state_2', 'back_exchange', 'charge', 'cnt', 'count_invalid', 'count_valid', 
                           'deut_uptake', 'deut_uptake_1', 'deut_uptake_2', 'deut_uptake_sig', 
                           'deuterium_uptake_norm', 'diff_deut_uptake', 'diff_frac_deut_uptake', 
                           'diff_theo_deut_uptake', 'diff_theo_frac_deut_uptake', 'err_avg_mass', 
                           'err_back_exchange', 'err_deut_uptake', 'err_deut_uptake_1', 'err_deut_uptake_2', 
                           'err_diff_deut_uptake', 'err_diff_frac_deut_uptake', 'err_diff_theo_deut_uptake', 
                           'err_diff_theo_frac_deut_uptake', 'err_frac_deut_uptake', 'err_frac_deut_uptake_1', 
                           'err_frac_deut_uptake_2', 'err_theo_deut_uptake', 'err_theo_deut_uptake_1', 
                           'err_theo_deut_uptake_2', 'err_theo_frac_deut_uptake', 'err_theo_frac_deut_uptake_1', 
                           'err_theo_frac_deut_uptake_2', 'err_time_0_mean', 'err_time_100_mean', 
                           'err_time_t_mean', 'err_val', 'exposure_norm', 'frac_deut_uptake', 'frac_deut_uptake_1', 
                           'frac_deut_uptake_2', 'freq', 'ids', 'is_hydrophobic', 'log_p_value', 'mass_uptake', 
                           'menu', 'p.adjust', 'peptide_length', 'pos', 'position', 'result', 'sd', 'setNames', 
                           't.test', 'theo_deut_uptake', 'theo_deut_uptake_1', 'theo_deut_uptake_2', 
                           'theo_frac_deut_uptake', 'theo_frac_deut_uptake_1', 'theo_frac_deut_uptake_2', 
                           'time_0_mean', 'time_100', 'time_100_mean', 'time_t', 'time_t_mean', 'tmp', 
                           'tmp_err_deut_uptake', 'tmp_err_diff_deut_uptake', 'tmp_err_diff_frac_deut_uptake', 
                           'tmp_err_diff_theo_deut_uptake', 'tmp_err_diff_theo_frac_deut_uptake', 
                           'tmp_err_frac_deut_uptake', 'tmp_err_theo_deut_uptake', 'tmp_err_theo_frac_deut_uptake', 
                           'type', 'val', 'valid', 'variable', 'weight', 'weighted.mean', 'weighted_Inten',
                           '.SD', ".N", 'col_names', '.GRP', "Len", "..count..", '.data', "Exp Cent", "Confidence",
                           '..col_names'))



