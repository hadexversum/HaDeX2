test_that("class is right",
          expect_is(reconstruct_sequence(t_dat), 
                    "character"))

dat_sequence <- "INITSSASQEGTRLNLICTVWHKKEEAEGFVVFLCKDRSGDCSPETSLKQLRLKRDPGIDGVGEISSQLMFTISQVTPLHSGTYQCCARSQKSGIRLQGHFFSILFxxxxxxxxxxxxxxxxxxFSHNEGTL"

test_that("example sequence1 is right length",
          expect_equal(str_length(reconstruct_sequence(t_dat)), 
                       132))

test_that("sequence1 is correct",
          expect_equal(reconstruct_sequence(t_dat),
                       dat_sequence))

