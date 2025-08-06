test_that("get_uptake_name correct value", {
          expect_equal(get_uptake_name(differential = TRUE, fractional = TRUE, theoretical = TRUE),
                       "diff_theo_frac_deut_uptake")
          expect_equal(get_uptake_name(differential = TRUE, fractional = TRUE, theoretical = FALSE),
                       "diff_frac_deut_uptake")
          expect_equal(get_uptake_name(differential = TRUE, fractional = FALSE, theoretical = TRUE),
                       "diff_theo_deut_uptake")
          expect_equal(get_uptake_name(differential = TRUE, fractional = FALSE, theoretical = FALSE),
                       "diff_deut_uptake")
          expect_equal(get_uptake_name(differential = FALSE, fractional = TRUE, theoretical = TRUE),
                       "theo_frac_deut_uptake")
          expect_equal(get_uptake_name(differential = FALSE, fractional = TRUE, theoretical = FALSE),
                       "frac_deut_uptake")
          expect_equal(get_uptake_name(differential = FALSE, fractional = FALSE, theoretical = TRUE),
                       "theo_deut_uptake")
          expect_equal(get_uptake_name(differential = FALSE, fractional = FALSE, theoretical = FALSE),
                       "deut_uptake")
  })


test_that("get_uptake_error_name correct value", {
  expect_equal(get_uptake_error_name(differential = TRUE, fractional = TRUE, theoretical = TRUE),
               "err_diff_theo_frac_deut_uptake")
  expect_equal(get_uptake_error_name(differential = TRUE, fractional = TRUE, theoretical = FALSE),
               "err_diff_frac_deut_uptake")
  expect_equal(get_uptake_error_name(differential = TRUE, fractional = FALSE, theoretical = TRUE),
               "err_diff_theo_deut_uptake")
  expect_equal(get_uptake_error_name(differential = TRUE, fractional = FALSE, theoretical = FALSE),
               "err_diff_deut_uptake")
  expect_equal(get_uptake_error_name(differential = FALSE, fractional = TRUE, theoretical = TRUE),
               "err_theo_frac_deut_uptake")
  expect_equal(get_uptake_error_name(differential = FALSE, fractional = TRUE, theoretical = FALSE),
               "err_frac_deut_uptake")
  expect_equal(get_uptake_error_name(differential = FALSE, fractional = FALSE, theoretical = TRUE),
               "err_theo_deut_uptake")
  expect_equal(get_uptake_error_name(differential = FALSE, fractional = FALSE, theoretical = FALSE),
               "err_deut_uptake")
})

test_that("get_uptake_label correct value", {
  expect_equal(get_uptake_label(differential = TRUE, fractional = TRUE, theoretical = TRUE),
               "Diff Theo Frac DU [%]")
  expect_equal(get_uptake_label(differential = TRUE, fractional = TRUE, theoretical = FALSE),
               "Diff Frac DU [%]")
  expect_equal(get_uptake_label(differential = TRUE, fractional = FALSE, theoretical = TRUE),
               "Diff Theo DU [Da]")
  expect_equal(get_uptake_label(differential = TRUE, fractional = FALSE, theoretical = FALSE),
               "Diff DU [Da]")
  expect_equal(get_uptake_label(differential = FALSE, fractional = TRUE, theoretical = TRUE),
               "Theo Frac DU [%]")
  expect_equal(get_uptake_label(differential = FALSE, fractional = TRUE, theoretical = FALSE),
               "Frac DU [%]")
  expect_equal(get_uptake_label(differential = FALSE, fractional = FALSE, theoretical = TRUE),
               "Theo DU [Da]")
  expect_equal(get_uptake_label(differential = FALSE, fractional = FALSE, theoretical = FALSE),
               "DU [Da]")
})

test_that("get_uptake_error_label correct value", {
  expect_equal(get_uptake_error_label(differential = TRUE, fractional = TRUE, theoretical = TRUE),
               "Err(diff_theo_frac_deut_uptake)")
  expect_equal(get_uptake_error_label(differential = TRUE, fractional = TRUE, theoretical = FALSE),
               "Err(diff_frac_deut_uptake)")
  expect_equal(get_uptake_error_label(differential = TRUE, fractional = FALSE, theoretical = TRUE),
               "Err(diff_theo_deut_uptake)")
  expect_equal(get_uptake_error_label(differential = TRUE, fractional = FALSE, theoretical = FALSE),
               "Err(diff_deut_uptake)")
  expect_equal(get_uptake_error_label(differential = FALSE, fractional = TRUE, theoretical = TRUE),
               "Err(theo_frac_deut_uptake)")
  expect_equal(get_uptake_error_label(differential = FALSE, fractional = TRUE, theoretical = FALSE),
               "Err(frac_deut_uptake)")
  expect_equal(get_uptake_error_label(differential = FALSE, fractional = FALSE, theoretical = TRUE),
               "Err(theo_deut_uptake)")
  expect_equal(get_uptake_error_label(differential = FALSE, fractional = FALSE, theoretical = FALSE),
               "Err(deut_uptake)")
})
