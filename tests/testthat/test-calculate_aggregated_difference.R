time_t = 5
agg_dat <- calculate_aggregated_diff_uptake(create_diff_uptake_dataset(alpha_dat), time_t = time_t)

corr_colnames <- c("position", "aa", "diff_frac_deut_uptake", "err_diff_frac_deut_uptake", "diff_deut_uptake", "err_diff_deut_uptake", 
                   "diff_theo_frac_deut_uptake", "err_diff_theo_frac_deut_uptake", "diff_theo_deut_uptake",
                   "err_diff_theo_deut_uptake", "Exposure")

test_that("calculate_aggregated_diff_uptake returns correct object",
          expect_s3_class(agg_dat, "data.frame"))

test_that("calculate_aggregated_diff_uptake returns correct colnames",
          expect_true(all(corr_colnames %in% colnames(agg_dat))))

test_that("calculate_aggregated_diff_uptake has correct t",
          expect_equal(unique(agg_dat[["Exposure"]]), 5))


ref_dat <- data.frame(
  position = c(10, 20, 30, 40, 50, 60, 70, 80, 90),
  aa = c("G", "D", "S", "V", "H","S","G","P","G"),
  diff_frac_deut_uptake = c(6.937640, 5.917851, 3.835780, 1.612945, 3.973723, 1.681443, 1.211564, 1.342906, 4.705325),
  err_diff_frac_deut_uptake = c(0.5824853, 0.3543794, 0.3658725, 0.5635091, 0.4926546, 1.0319907, 0.4606580, 0.4530602, 0.8585749),
  diff_deut_uptake = c(0.25276836, 0.19830667, 0.17858181, 0.08956701, 0.22199729, 0.20031450, 0.12498912, 0.08838434, 0.37814917),
  err_diff_deut_uptake = c(0.01968800, 0.01100325, 0.01533281, 0.01049921, 0.02057196, 0.12206800, 0.04162491, 0.02366140, 0.03457592)
  )
  
test_that("calculate_aggregated_diff_uptake vs ref data",{
  lapply(ref_dat[["position"]], function(pos){
    
    lapply(corr_colnames[3:length(colnames(ref_dat))], function(col){
      
      expect_equal(round(agg_dat[agg_dat[["position"]] == pos, col], 3), round(ref_dat[ref_dat[["position"]] == pos, col], 3))
      
      })
  })
})
