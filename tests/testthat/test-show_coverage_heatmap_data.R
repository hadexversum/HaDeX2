## AUC

auc_dat <- calculate_auc(create_uptake_dataset(alpha_dat))

correct_columns <- c("Protein", "Sequence", "Start", "End", "State", "Modification", "AUC")

test_that("show_coverage_heatmap_data has auc correct columns", 
          expect_true(all(correct_columns %in% colnames(show_coverage_heatmap_data(auc_dat, value = "auc")))))


## Back-exchange

bex_dat <- calculate_back_exchange(alpha_dat)

correct_columns <- c("Protein", "Sequence", "Start", "End", "State", "Modification", "Back Exchange", "U(Back Exchange)")

test_that("show_coverage_heatmap_data has bx correct columns", 
          expect_true(all(correct_columns %in% colnames(show_coverage_heatmap_data(bex_dat, value = "back_exchange")))))


