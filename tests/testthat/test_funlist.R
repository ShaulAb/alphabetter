context("Functions Listing")
library(alphabetter)

# test strings:
#   1. no functions at all
#   2. functions written without proper spacing
#   3. single function
#   4. duplicated function
#   5. multiple functions

# {1}
no_funs <-
  'hey <- funct() { "d" }
   low <- fun(id = row) { print(id) }
   # some comment'

# {2}
bad_syntax <-
  'hey<-function() { "d" }
   low<-function(id = row) { print(id) }'

# {3}
single_fun <- 'my_fun <- function() { "single" }'

# {4}
duplicated_fun <- paste(single_fun, single_fun, sep = '\n')

# {5}
multiple_funs <-
  'b <- function() { "b" }
   c <- function() { "c" }
   a <- function() { "a" }
   # that is all folks'

test_that("no false alarms", {
  expect_equal(list_funs(no_funs), "")
  expect_equal(list_funs(bad_syntax), "")
})

test_that("single function", {
  expect_equal(list_funs(single_fun), "# 1. my_fun()")
  expect_equal(list_funs(duplicated_fun), "# 1. my_fun()\n# 2. my_fun()")
})

test_that("multiple functions", {
  expect_equal(list_funs(multiple_funs), "# 1. a()\n# 2. b()\n# 3. c()")
})
