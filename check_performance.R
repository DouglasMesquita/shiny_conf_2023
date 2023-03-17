library(shiny.benchmark)

commits <- list(
  "develop" = "develop",
  "feature1" = "feature1",
  "using_renv" = "feature2"
)

cypress_dir <- "tests/cypress/"
testthat_dir <- "tests/"

# basic usage
cypress_out <- benchmark(
  commit_list = commits,
  cypress_dir = cypress_dir,
  use_renv = FALSE,
  tests_pattern = "set1"
)

shinytest2_out <- benchmark(
  commit_list = commits,
  shinytest2_dir = testthat_dir,
  use_renv = FALSE,
  tests_pattern = "set1"
)

# package managements
shinytest2_out <- benchmark(
  commit_list = commits,
  shinytest2_dir = testthat_dir,
  use_renv = TRUE,
  renv_prompt = TRUE,
  tests_pattern = "set1"
)

# handling multiple files
shinytest2_out <- benchmark(
  commit_list = commits,
  shinytest2_dir = testthat_dir,
  use_renv = FALSE,
  tests_pattern = c("set1", "set2", "set[0-9]")
)

# repetitions
shinytest2_out <- benchmark(
  commit_list = commits,
  shinytest2_dir = testthat_dir,
  use_renv = FALSE,
  tests_pattern = "set1",
  n_rep = 5
)

summary(shinytest2_out)
plot(shinytest2_out)
