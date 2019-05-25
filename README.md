# alphabetter

Utility functions and addins that I use in my own code.

## Sorting

### `alpha_sort()`

I find it very convenient to concentrate all relevant R packages at the top of my scripts, for example:

``` r
library(magrittr)
library(dplyr)
library(ggplot2)
```

You can alphabetize the above code by selecting relevant lines and apply `alpha_sort_addin`, the output will be:

```r
library(dplyr)
library(ggplot2)
library(magrittr)
```

The same goes for constants:

```r
FIG_WIDTH = 750L
DATA_PATH = "./data"
```

Will become:

``` r
DATA_PATH = "./data"
FIG_WIDTH = 750L
```

This makes things much easier to skim.

<br>


## Listing

### `list_funs()`

When developing packages, or R scripts with many functions (like `utils.R`), I find it useful to generate a list of all the functions in the script.  
`list_funs_addin` will go over the entire script and generate a sorted list of all the function names. The list is sorted alphabetically, which makes it easy to skim.

For example:

```r
# script with some functions..

# comment about b
b <- function() { "b" }

# comment about c
c <- function() { "c" }

# comment about a
a <- function() { "a" }
```

After applying the addin will result in:

```r
# script with some functions..
# 1. a()
# 2. b()
# 3. c()

# comment about b
b <- function() { "b" }

# comment about c
c <- function() { "c" }

# comment about a
a <- function() { "a" }
```

## Code Stats

To be continued...
