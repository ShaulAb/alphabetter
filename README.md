# alphabetter 0.0.1 <img src="man/figures/logo.png"  height="200" width="200" align="right"/>

[![Travis build status](https://travis-ci.org/ShaulAb/alphabetter.svg?branch=master)](https://travis-ci.org/ShaulAb/alphabetter)
[![Coverage status](https://codecov.io/gh/ShaulAb/alphabetter/branch/master/graph/badge.svg)](https://codecov.io/github/ShaulAb/alphabetter?branch=master)


<br><br>

## Overview

*alphabetter* contains a set of addins to show important aspects of your code.  
There are 4 addins:
  
  + *Alphabetize*
  + *Codestats*
  + *Funlister*
  + *ArtifactsNote*
  
<br>

## *Alphabetize*

Alphabetize code by selecting relevant lines and apply `Alphabetize`.  
Useful for code sections with packages or constants.  
For example, the sorted:

```r
library(dplyr)
library(ggplot2)
library(magrittr)
```

makes dependencies much easier to skim.  

Or, in the case of constants:

```r
STABLE  <- TRUE
TODAY   <- lubridate::today()
GOAL    <- 1000L
RELEASE <- "1.0.1"
STATE   <- "cran"
```

will become:

```r

GOAL    <- 1000L
RELEASE <- "1.0.1"
STABLE  <- TRUE
STATE   <- "cran"
TODAY   <- lubridate::today()
```

<br>


## *Funlister*

Generate a list of all the functions in the script.  
`FunLister` will go over the entire script and generate a sorted list of all the function names.

For example:

```r
# 1. a() <--- added by FunLister
# 2. b() <--- added by FunLister
# 3. c() <--- added by FunLister

# comment about b
b <- function() { "b" }

# comment about c
c <- function() { "c" }

# comment about a
a <- function() { "a" }
```

<br>

## *Codestats*

Counting code lines, commented lines and blank lines.  
`CodeStats` output:

```r
code lines: x
comment lines: y
blank lines: z
code / comments ratio = d.dd ( x / y )
```

<br>

## *ArtifactsNote*

Notify on all code lines containing read/write functions.
Currently `readr`, `data.table` and `base` methods will be matched.

```r
# line4:	read_csv	"raw_data.csv"   <--- added by `ArtifactsNote`
# line8:	write_csv	"final_data.csv" <--- added by `ArtifactsNote`

library(readr)
library(dplyr)

my_data <- read_csv("raw_data.csv")
<some logic>
my_data %>% 
  select(x1, x2) %>% 
  write_csv("final_data.csv")
```

<br>
