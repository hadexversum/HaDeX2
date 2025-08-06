library(HaDeX)
library(ggplot2)
library(dplyr)
library(patchwork)

article_theme <- theme_bw(base_size = 10) +
  theme(legend.position = "bottom",
        legend.direction = "horizontal",
        legend.key.height = unit(0.05, "in"))

theme_set(article_theme)

folder_path <- "C:/Users/User/Desktop/hadex2/"

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
  labs(title = "FGDLKSPAGL in 1 min in alpha state") +
  theme(legend.direction = "horizontal")

# ggsave(filename = paste0(folder_path, "plt_1.png"), plt_1,
#        width = 20, height = 12, units = "cm")

## image B

plt_2 <- HaDeX::create_replicate_dataset(
  alpha_dat,
  state   = "Alpha_KSCN") %>%
  HaDeX::plot_replicate_histogram() +
  labs(title = "Number of replicates in alpha state")

# ggsave(filename = paste0(folder_path, "plt_2.png"), plt_2,
#        width = 20, height = 12, units = "cm")

## image C

plt_3 <- create_uptake_dataset(alpha_dat,
                               states = "Alpha_KSCN") %>%
  calculate_auc() %>%
  plot_coverage_heatmap(value = "auc") +
  labs(title = "Peptide coverage (AUC heatmap) \nin alpha state",
       y = "") +
  guides(fill = guide_legend(keywidth = 1))

# ggsave(filename = paste0(folder_path, "plt_3.png"), plt_3,
#        width = 20, height = 12, units = "cm")

## image D

plt_4 <- create_p_diff_uptake_dataset(alpha_dat,
                                      state_1 = "Alpha_KSCN",
                                      state_2 = "ALPHA_Gamma") %>%
  plot_manhattan(., 
                 show_peptide_position = TRUE, 
                 separate_times = TRUE) +
  ggtitle("Differences between alpha state \nand alpha_gamma state")

# ggsave(filename = paste0(folder_path, "plt_4.png"), plt_4,
#        width = 20, height = 12, units = "cm")

## image E

plt_5 <- create_uptake_dataset(alpha_dat, states = "Alpha_KSCN") %>%
  create_aggregated_uptake_dataset(.) %>%
  plot_aggregated_uptake(., panels = FALSE) +
  labs(title = "Fractional deuterium uptake in alpha state") +
  guides(fill = guide_colorbar(keywidth = 6))

# ggsave(filename = paste0(folder_path, "plt_5.png"), plt_5,
#        width = 20, height = 12, units = "cm")

plt_6 <- png::readPNG("./inst/structure3d.png", native = TRUE)


plt_E <- plt_5 + plt_6 + plot_layout(tag_level = "keep")

plot_design <- c("
  12
  34
  55
")
  
final_plot <- (plt_1 + plt_2 + plt_3 + plt_4 + plt_E) +
  plot_layout(design = plot_design, tag_level = "new") + 
  plot_annotation(tag_levels = c("A", "I")) 


ggsave("HaDeX_plot.pdf", width = 8.27, height = 11)

ggsave(paste0(folder_path, "HaDeX_plot.pdf"), width = 8.27, height = 11)
