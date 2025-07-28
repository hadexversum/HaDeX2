library(HaDeX)
library(ggplot2)
library(dplyr)

folder_path <- "C:\\Users\\pucha\\OneDrive\\Desktop\\hadex2_article\\"

## image A

plt_1 <- alpha_dat %>%
  filter(Sequence == "FGDLKSPAGL", Exposure == 1, State == "Alpha_KSCN") %>%
  mutate(File = case_when(
    File == "Tania_161108_1eEF1Ba_KSCN_1min" ~ "rep_1",
    File == "Tania_161108_2eEF1Ba_KSCN_1min" ~ "rep_2",
    File == "Tania_161108_3eEF1Ba_KSCN_1min" ~ "rep_3",
  )) %>%
  HaDeX::plot_peptide_mass_measurement(
    show_charge_values = TRUE,
    sequence           = "FGDLKSPAGL",
    state = "Alpha_KSCN",
    time_t             = 1) +
  theme(text=element_text(size=17)) +
  labs(title = "FGDLKSPAGL in 1 min in Alpha_KSCN state")

ggsave(filename = paste0(folder_path, "plt_1.png"), plt_1,
       width = 20, height = 12, units = "cm")

## image B

plt_2 <- HaDeX::create_replicate_dataset(
  alpha_dat,
  state   = "Alpha_KSCN") %>%
  HaDeX::plot_replicate_histogram() +
  theme(text=element_text(size=17)) +
  labs(title = "Number of replicates in Alpha_KSCN state")

ggsave(filename = paste0(folder_path, "plt_2.png"), plt_2,
       width = 20, height = 12, units = "cm")

## image C

plt_3 <- create_uptake_dataset(alpha_dat,
                               states = "Alpha_KSCN") %>%
  calculate_auc() %>%
  plot_coverage_heatmap(value = "auc") +
  labs(title = "Peptide coverage AUC heatmap",
       y = "") +
  theme(text = element_text(size = 17))

ggsave(filename = paste0(folder_path, "plt_3.png"), plt_3,
       width = 20, height = 12, units = "cm")

## image D

plt_4 <- create_p_diff_uptake_dataset(alpha_dat,
                                      state_1 = "Alpha_KSCN",
                                      state_2 = "ALPHA_Gamma") %>%
  plot_manhattan(., 
                 show_peptide_position = TRUE, 
                 separate_times = TRUE) +
  theme(text = element_text(size = 17))

ggsave(filename = paste0(folder_path, "plt_4.png"), plt_4,
       width = 20, height = 12, units = "cm")

## image E

plt_5 <- create_uptake_dataset(alpha_dat, states = "Alpha_KSCN") %>%
  create_aggregated_uptake_dataset(.) %>%
  plot_aggregated_uptake(., panels = FALSE) +
  labs(title = "Fractional deuterium uptake in Alpha_KSCN state") +
  theme(text = element_text(size = 17))

ggsave(filename = paste0(folder_path, "plt_5.png"), plt_5,
       width = 20, height = 12, units = "cm")

