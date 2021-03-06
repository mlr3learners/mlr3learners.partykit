library(mlr3learners.partykit)

test_that("classif.ctree", {
  learner = lrn("classif.ctree")
  fun = partykit::ctree
  exclude = c(
    "formula", # handled in mlr3
    "data", # handled in mlr3
    "subset", # handled in mlr3
    "weights", # handled in mlr3
    "na.action", # handled in mlr3
    "control", # handled in partykit::ctree_control
    "ytrafo", # handled in mlr3pipelines
    "converged" # not to be used by the user
  )

  ParamTest = run_paramtest(learner, fun, exclude)
  expect_true(ParamTest, info = paste0(
    "
Missing parameters:
",
    paste0("- '", ParamTest$missing, "'", collapse = "
")))
})

# example for checking a "control" function of a learner
test_that("classif.ctree_control", {
  learner = lrn("classif.ctree")
  fun = partykit::ctree_control
  exclude = c(
  )

  ParamTest = run_paramtest(learner, fun, exclude)
  expect_true(ParamTest, info = paste0(
    "
Missing parameters:
",
    paste0("- '", ParamTest$missing, "'", collapse = "
")))
})
