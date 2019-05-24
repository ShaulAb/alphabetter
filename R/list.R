#' Sort Selected Lines
#'
#' Call this addin for code sections like libraries, constants etc.
#'
#' @export
#'
list_funs_addin <- function() {

  context <- rstudioapi::getActiveDocumentContext()
  text <- unlist(context$contents)
  rstudioapi::insertText(list_functions(text))
}

#' List functions in current script
#'
#' @description Any functions appearing in the input text
#' are identified and their names. Names are then sorted
#' alphabetically and outputted as a commented text in a
#' "function per line" fashion.
#'
#' @param text String
#'
#' @return commented list of functions
#' @export
#'
list_functions <- function(text) {

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
  paste0("# " , list_numbers, ". ", items, "()", collapse = "\n")

}
