#' Sort Selected Lines
#'
#' @description Addin that sorts selected lines alphabetically.
#'
#' @export
#'
alpha_sort_addin <- function() {

  context <- rstudioapi::getActiveDocumentContext()
  selected_text <- unlist(context$selection)["text"]
  rstudioapi::insertText(alpha_sort(selected_text))
}


#' Sort by Alphabet
#'
#' @description Helper function for alphabetize addin. \cr
#' Given active text selection, the function parses the text and
#' re-order them by the alphabet.
#'
#' @param text String, corresponds to user text selection
#'
#' @return sorted text
#' @export
#'
alpha_sort <- function(text) {

  # split by newline ('\n')
  words <- stringr::str_split(text, pattern = "\n", simplify = TRUE)

  # trim leading spaces
  words <- stringr::str_trim(words)

  # sort alphabetically and collapse back by newline
  paste(sort(words), collapse = "\n")
}
