library(HRaDeX)
library(HaDeX)

agg_dat <- create_aggregated_uptake_dataset(create_uptake_dataset(dat = alpha_dat, states = unique(alpha_dat[["State"]])[3], 
                                 time_0 = 0, time_100 = 1440))

ref_dat <- data.frame(
  position = c(150, 150, 150, 150, 150, 150), 
  Exposure = c(0.167, 1, 5, 25, 150, 1440),
  frac_deut_uptake = c(30.612998, 43.086626, 50.570774, 64.780313, 93.926741, 2.884934),
  err_frac_deut_uptake = c(1.112058, 1.616196, 1.320640, 2.108167, 1.558175, 0.234842),
  deut_uptake = c(1.234244, 1.735799, 2.045771, 2.558785, 3.652272, 3.874534),
  err_deut_uptake  = c(0.008199548, 0.019368656, 0.010817372, 0.031576398, 0.009421745, 0.017846883)
)

test_that("create_aggregated_uptake_dataset returns multiple times",
          expect_true(length(unique(agg_dat[["Exposure"]])) > 1)) 

test_that("create_aggregated_uptake_dataset returns correct values", {
  lapply(1:nrow(ref_dat), function(i){
    lapply(colnames(ref_dat)[3:length(colnames(ref_dat))], function(value){
      expect_equal(round(agg_dat[agg_dat[["position"]] == ref_dat[i, "position"] & agg_dat[["Exposure"]] == ref_dat[i, "Exposure"], value], 4),
                   round(ref_dat[i, value]), 4)
    })
  })
})

