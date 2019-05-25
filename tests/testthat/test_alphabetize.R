context("Text Lines Sorting")
library(alphabetter)

# test strings:
#   1. empty string
#   2. unordered items
#   3. libraries list
#   4. constants list

# {2}
unordered_items <-
  'c  # item c
   b  # item b
   a  # item a'

# {3}
lib_list <-
  'library(magrittr)
   library(dplyr)
   library(ggplot2)'

# {4}
const_list <-
  'TIMEOUT = 120L
   DATA_PATH = "/home/data/"
   FIX_WIDTH = 1020L'

test_that("different use-cases", {
  expect_equal(alpha_sort(unordered_items), "a  # item a\nb  # item b\nc  # item c")
  expect_equal(alpha_sort(lib_list),
               "library(dplyr)\nlibrary(ggplot2)\nlibrary(magrittr)")
  expect_equal(alpha_sort(const_list),
               "DATA_PATH = \"/home/data/\"\nFIX_WIDTH = 1020L\nTIMEOUT = 120L")
})
