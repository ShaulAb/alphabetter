#' Sort Selected Lines
#'
#' Call this addin for code sections like libraries, constants etc.
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
#' @description helper function for alphabetize addin.
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

  # sort alphabetically and collapse back by newline
  paste(sort(words), collapse = "\n")
}
