#' Notify On Read/Write Lines.
#'
#' @description Addin to notify on read/write Lines
#'
#' @export
#'
notify_io_addin <- function() {

  context <- rstudioapi::getActiveDocumentContext()
  text <- unlist(context$contents)
  rstudioapi::insertText(notify_io(text))
}

#' Notify on IO components in the code
#'
#' @param text String
#'
#' @return String
#' @export
#'
#' @examples
#' cat(
#'   notify_io(
#'     'df <- read.csv("my_data.csv")
#'     write.csv(df, "your_data.csv")
#'     write_variable <- "will not be mixed up with write function"'))
notify_io <- function(text) {

  # object to store I/O matches
  matched <- list()

  # unlist and trim whitespaces
  txt <- unlist(stringr::str_split(text, pattern = "\n"))
  txt <- stringr::str_trim(txt)

  # lines containing read/write methods
  reg_patterns  <- paste0(io_patterns, collapse = "|")
  matched_lines <- which(re2r::re2_detect(string = txt, pattern = reg_patterns))

  # extract line No, I/O function, and artifact (if qouted)
  for (line in matched_lines) {
    content <- txt[line]
    cmd   <- re2r::re2_extract(content, reg_patterns)
    file  <- noquote(re2r::re2_extract(content, in_quotes))
    matched <- append(matched, paste0("# line", line, ":\t", cmd, "\t", file, sep = ""))
  }

  return(paste(matched, collapse = "\n"))
}
