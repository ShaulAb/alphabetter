#' List Functions in Script
#'
#' @description Addin to list and sort function names alphabetically.
#'
#' @export
#'
list_funs_addin <- function() {

  context <- rstudioapi::getActiveDocumentContext()
  text <- unlist(context$contents)
  rstudioapi::insertText(list_funs(text))
}

#' Create Sorted List of Function Names
#'
#' @description Any functions appearing in the input text
#' are identified and their names. \cr
#' Names are then sorted alphabetically and outputted as a commented text in a
#' "function per line" fashion.
#'
#' @param text String
#'
#' @return commented list of function names
#' @export
#'
#' @examples
#' cat(
#'   list_funs(
#'     'hi <- function() { "hi world" }
#'     hello <- function() { "hello world" }
#'     howdy <- function() { "howdy workld" }'))
#'
list_funs <- function(text) {

  # build regex to match functions
  pattern <- '<- function'
  regex   <-  paste0(".*(?<=(", pattern, "))")

  # extract function names, sort alphabetically
  items <-
    text %>%
    stringr::str_extract_all(pattern = regex) %>%
    unlist() %>%
    stringr::str_remove(pattern) %>%
    stringr::str_trim() %>%
    sort()

  # remove empty strings
  items <- items[items > 0]

  # generate the output string:
  #   Alphabetically sorted function names, one function per line
  #   list numbers are added automatically
  list_numbers = 1:length(items)
  if (length(items))
   return(paste0("# " , list_numbers, ". ", items, "()", collapse = "\n"))

  # empty strings if no valid functions were found
  ""
}
