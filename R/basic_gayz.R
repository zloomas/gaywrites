#' Basic gay text replacement
#'
#' Replace common text from social-science abstracts with gay nonsense.
#'
#' @param abstract_text Academic abstract to make gay(er)
#' @param pattern A singular noun or vector of singular nouns to search for. Defaults to vector of common units of observation in SBS research, e.g., participant, individual, etc.
#' @param replacement A singular noun or vector of singular nouns to use as replacements. Defaults to vector of common gay nonsense.
#'
#' @return A gay(er) abstract
#' @export
#'
#' @examples
#' abstract_text <- "75 participants were recruited, of which
#' 8 individuals failed attention checks, resulting in an
#' analytic sample of 63 observations."
#'
#' basic_gayz(abstract_text)
#'
#' basic_gayz(abstract_text, replacement = "queen")
#'
#' basic_gayz(abstract_text, pattern = c("participant", "observation"), replacement = "queen")
basic_gayz <- function(abstract_text, pattern = c(), replacement = c()) {
  # make useful defaults to find common individuals
  if (length(pattern) == 0) {
    single_search <- c("participant", "subject", "patient", "voter",
                       "individual", "human", "employee", "supervisor",
                       "manager", "human being", "student", "teacher",
                       "respondent", "panelist", "adult", "adolescent",
                       "worker", "player", "actor", "observation")
  } else {
    single_search <- pattern
  }

  complex_single_search <- c("child", "person", "man", "woman")

  complex_plural_search <- c("children", "people", "men", "women")

  if (length(replacement) == 0) {
    single_replace <- c("bestie", "girlie", "queen", "kween", "girl", "babe")
  } else {
    single_replace <- replacement
  }

  plural_replace <- vector()

  for (word in single_replace) {
    plural_replace <- append(plural_replace, paste0(word, "s"))
  }

  complex_single_replace <- c("henny", "hunty")

  for (word in single_search) {
    if (stringr::str_detect(abstract_text, word)) {
      abstract_text <- stringr::str_replace_all(abstract_text,
                                                word,
                                                sample(single_replace, 1))
    }
  }

  for (word in complex_single_search) {
    if (stringr::str_detect(abstract_text, word)) {
      abstract_text <- stringr::str_replace_all(abstract_text,
                                                word,
                                                sample(single_replace, 1))
    }
  }

  return(abstract_text)

}




