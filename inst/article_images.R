library(HaDeX2)
library(ggplot2)
library(dplyr)
library(patchwork)
library(grid)
library(gridExtra)
library(latex2exp)

article_theme <- theme_bw(base_size = 9) +
  theme(legend.position = "bottom",
        legend.direction = "horizontal",
        legend.key.height = unit(0.05, "in"))

theme_set(article_theme)

folder_path <- "C:/Users/User/Desktop/hadex2/"

## image A

plt_1 <- alpha_dat %>%
  filter(Sequence == "FGDLKSPAGL", Exposure == 1, State == "ALPHA_Gamma") %>%
  mutate(File = case_when(
    File == "Tania_161108_1eEF1Bag_compl_KSCN_1min" ~ "rep_1",
    File == "Tania_161108_2eEF1Bag_compl_KSCN_1min" ~ "rep_2",
    File == "Tania_161108_3eEF1Bag_compl_KSCN_1min" ~ "rep_3",
  )) %>%
  HaDeX2::plot_peptide_mass_measurement(
    show_charge_values = TRUE,
    sequence           = "FGDLKSPAGL",
    state = "ALPHA_Gamma",
    time_t             = 1) +
  labs(title = TeX("Peptide FGDLKSPAGL at 1 min (eEF1B$\\alpha\\gamma$)"), 
       size = "Relative intensity",
       y = "Replicate ID") +
  theme(legend.direction = "horizontal")



# ggsave(filename = paste0(folder_path, "plt_1.png"), plt_1,
#        width = 20, height = 12, units = "cm")

## image B

plt_2 <- HaDeX2::create_replicate_dataset(
  alpha_dat,
  state = "ALPHA_Gamma") %>%
  HaDeX2::plot_replicate_histogram() +
  labs(title =  TeX("Number of replicates (eEF1B$\\alpha\\gamma$)"))

# ggsave(filename = paste0(folder_path, "plt_2.png"), plt_2,
#        width = 20, height = 12, units = "cm")

## image C

plt_3 <- create_uptake_dataset(alpha_dat,
                               states = "ALPHA_Gamma") %>%
  calculate_auc() %>%
  plot_coverage_heatmap(value = "auc") +
  labs(title = TeX("AUC peptide coverage (eEF1B$\\alpha\\gamma$)"),
       y = "") +
  guides(fill = guide_legend(keywidth = 1))

# ggsave(filename = paste0(folder_path, "plt_3.png"), plt_3,
#        width = 20, height = 12, units = "cm")

## image D

plt_4 <- create_p_diff_uptake_dataset(alpha_dat,
                                      state_1 = "Alpha_KSCN",
                                      state_2 = "ALPHA_Gamma") %>%
  plot_manhattan(show_peptide_position = TRUE, 
                 separate_times = TRUE) +
  ggtitle(TeX("Differential deuterium uptake eEF1$\\alpha$ and eEF1B$\\alpha\\gamma$"))

# ggsave(filename = paste0(folder_path, "plt_4.png"), plt_4,
#        width = 20, height = 12, units = "cm")

## image E

plt_5 <- create_uptake_dataset(alpha_dat, states = "ALPHA_Gamma") %>%
  create_aggregated_uptake_dataset(.) %>%
  plot_aggregated_uptake(., panels = FALSE) +
  labs(title = TeX("HR fractional deuterium uptake (eEF1B$\\alpha\\gamma$)")) +
  guides(fill = guide_colorbar(keywidth = 6))

# ggsave(filename = paste0(folder_path, "plt_5.png"), plt_5,
#        width = 20, height = 12, units = "cm")



plot_design <- c("
  12
  34
")

final_plot <- (plt_1 + plt_2 + plt_3 + plt_4) +
  plot_layout(design = plot_design, tag_level = "new") +
  plot_annotation(tag_levels = "A")

final_plot_design <- rbind(c(1,1,1,1),
                           c(2,3,4,5))

pdf("HaDeX_plot.pdf", width = 8.27, height = 11, pointsize = 12)
grid.arrange(patchworkGrob(final_plot),
             textGrob("E", y = unit(1, "npc"), gp = gpar(cex = 1)),
             ggplotGrob(plt_5),
             textGrob(" F", y = unit(1, "npc"), gp = gpar(cex = 1)),
             rasterGrob(png::readPNG("./inst/db_eEF1Ba.png", native = TRUE), vjust = 0.25),
             layout_matrix = final_plot_design, widths = c(1, 9, 0.1, 9), heights = c(5, 2))
dev.off()

if(Sys.info()[["nodename"]] != "Michals-MacBook-Pro.local")
  ggsave(paste0(folder_path, "HaDeX_plot.pdf"), width = 8.27, height = 11)
