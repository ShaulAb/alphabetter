context("Code Statistics")
library(alphabetter)

# test strings:
#   1. empty string
#   2. example from function documentation
#   3. only comments
#   4. only code

# {2}
doc_example <-
  "# R calculations
  2 * 2 / 4
  (4 * 4) / 2
  rnorm(2)"

# {3}
only_comments <-
  '# comment 1
  # comment 2
  ##  comment 3
  ##comment 4'

# {4}
only_code <-
  "2 * 2 / 4
  (4 * 4) / 2
  rnorm(2)"

test_that("code stats validity", {
  expect_equal(code_stats(""),
               "code lines: 0\ncomment lines: 0\nblank lines: 1\ncode / comments ratio = NaN ( 0 / 0 )")
  expect_equal(code_stats(doc_example),
               "code lines: 3\ncomment lines: 1\nblank lines: 0\ncode / comments ratio = 3 ( 3 / 1 )")
  expect_equal(code_stats(only_comments),
               "code lines: 0\ncomment lines: 4\nblank lines: 0\ncode / comments ratio = 0 ( 0 / 4 )")
  expect_equal(code_stats(only_code),
               "code lines: 3\ncomment lines: 0\nblank lines: 0\ncode / comments ratio = Inf ( 3 / 0 )")
})
