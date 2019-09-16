context("I/O Notifications")
library(alphabetter)

# test strings:
#   1. no read/writes at all
#   2. read/write with single quotes
#   3. read/write with double quotes


# {1}
no_rw <-
  'my_w <- "write.csv name here"
   my_r <- "read.csv name here"
   # some comments'

no_rw2 <-
  'write.something(df, "df")
   my_r <- read.something("path")'

# {2}
single_quotes <-
  "df <- read_csv('iris.csv')
   head(df)
   write_csv(head(df), 'head_iris.csv')"

# {3}
double_quotes <-
  'df <- read_csv("iris.csv")
   head(df)
   write_csv(head(df), "head_iris.csv")'

test_that("no false alarms", {
  expect_equal(notify_io(no_rw), "")
  expect_equal(notify_io(no_rw2), "")
})

test_that("single quotes", {
  expect_equal(notify_io(single_quotes),
               "# line 1:\tread_csv\t'iris.csv'\n# line 3:\twrite_csv\t'head_iris.csv'")
})

test_that("double quotes", {
  expect_equal(notify_io(double_quotes),
               '# line 1:\tread_csv\t"iris.csv"\n# line 3:\twrite_csv\t"head_iris.csv"')
})
