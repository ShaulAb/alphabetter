#' Code Statistics Addin
#'
#' @description Addin that prints code stats.
#'
#' @export
#'
code_stats_addin <- function() {

  context <- rstudioapi::getActiveDocumentContext()
  text <- unlist(context$contents)
  rstudioapi::insertText(code_stats(text))
}

#' Code Statistics
#'
#' @description Counts code lines, comment lines, blank lines and code to comments ratio.
#'
#' @param text String
#'
#' @return String, code stats
#' @export
#'
#' @examples
#' cat(
#'   code_stats("# R calculations
#'              2 * 2 / 4
#'              (4 * 4) / 2
#'              rnorm(2)"))
#'
code_stats <- function(text) {

  # parse script lines, trim white-spaces
  txt = unlist(stringr::str_split(text, pattern = "\n"))
  txt = stringr::str_trim(txt)

  # counting blank lines, comments and code (code can start with a word or a '(' )
  blank_lines_cnt   <- length(which(txt == ""))
  code_lines_cnt    <- code_counter(txt)
  comment_lines_cnt <- length(which(stringr::str_starts(txt, pattern = "#")))

  # computing ratios
  code2comment <- round(code_lines_cnt/comment_lines_cnt, 2)
  code2comment_str <- paste("code / comments ratio =", code2comment,
                            "(", code_lines_cnt, "/", comment_lines_cnt, ")")

  # output string:
  paste(
    paste("code lines:", code_lines_cnt),
    paste("comment lines:", comment_lines_cnt),
    paste("blank lines:", blank_lines_cnt),
    code2comment_str, sep = "\n")
}


#' Code Lines Counter
#'
#' @description This function is being used internally by \code{code_stats}.
#'
#' @param text String / list of Strings
#'
#' @return Integer, code lines count
#'
#' @examples
#' \dontrun{
#' code_counter("# comment")
#' code_counter("2 * 2")
#' code_counter(c("(2 * 2)", ("2 * 2")))
#' }
code_counter <- function(text) {

  ver1 <- length(which(stringr::str_starts(string = text, pattern = "\\w")))
  ver2 <- length(which(stringr::str_starts(string = text, pattern = "[(]")))
  ver1 + ver2
}
