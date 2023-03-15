app <- AppDriver$new(name = "test1", height = 975, width = 1619)

test_that("Out1 time elapsed - set1", {
  app$click("run1")
  app$expect_values(output = "out1")
})

test_that("Out2 time elapsed - set1", {
  app$click("run2")
  app$expect_values(output = "out2")
})

test_that("Out3 time elapsed - set1", {
  app$click("run3")
  app$expect_values(output = "out3")
  app$close()
})
