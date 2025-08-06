kin_dat <- create_uptake_dataset(alpha_dat, states = "Alpha_KSCN" )
aggregated_dat <- create_aggregated_uptake_dataset(kin_dat)

res_1 <- prepare_hdxviewer_export(aggregated_dat, differential = F)

test_that("prepare_hdxviewer_export returns correct object",
          expect_s3_class(res_1, "data.frame"))

times <- unique(kin_dat[["Exposure"]])*60
correct_colnames <- c("Residues", paste0(times, "s"))

test_that("prepare_hdxviewer_export returns correct columns",
          expect_true(all(correct_colnames %in% colnames(res_1))))

test_that("wrong prepare_hdxviewer_export call",
          expect_error(prepare_hdxviewer_export(aggregated_dat, differential = T)
                         ))