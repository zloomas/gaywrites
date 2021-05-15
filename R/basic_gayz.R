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
  # make useful defaults to find common units of observation
  # start with easy words if none are provided
  if (length(pattern) == 0) {
    simple_single_search <- c("participant", "subject", "patient", "voter",
                              "individual", "human", "employee", "supervisor",
                              "manager", "human being", "student", "teacher",
                              "respondent", "panelist", "adult", "adolescent",
                              "worker", "player", "actor", "observation")
  } else {
    simple_single_search <- pattern
  }

  complex_single_search <- c("child", "person", "man", "woman")

  single_search <- append(simple_single_search, complex_single_search)

  for (ix in 1:length(single_search)) {
    single_search[ix] <- paste0(single_search[ix], " ")
  }

  simple_plural_search <- vector(mode="character", length(simple_single_search))

  for (ix in 1:length(simple_single_search)) {
    simple_plural_search[ix] <- paste0(simple_single_search[ix], "s")
  }

  complex_plural_search <- c("children", "people", "men", "women")

  plural_search <- append(simple_plural_search, complex_plural_search)

  if (length(replacement) == 0) {
    simple_single_replace <- c("bestie", "girlie", "queen", "kween",
                               "girl", "babe", "mama")
  } else {
    simple_single_replace <- replacement
  }

  complex_single_replace <- c("henny", "hunty", "girlboss", "barb")

  single_replace <- append(simple_single_replace, complex_single_replace)

  plural_replace <- vector(mode="character", length(simple_single_replace))

  for (ix in 1:length(simple_single_replace)) {
    plural_replace[ix] <- paste0(plural_replace[ix], "s")
  }

  complex_plural_replace <- c("hennies", "hunties", "girlbosses", "barbz")

  plural_replace <- append(plural_replace, complex_plural_replace)

  # first search for singular nouns + replace with singular nouns
  # include title-case handling to catch instances where word is first
  # in a sentence

  for (word in single_search) {
    abstract_text <- stringr::str_replace_all(abstract_text,
                                              word,
                                              sample(single_replace, 1))
    abstract_text <- stringr::str_replace_all(abstract_text,
                                              stringr::str_to_title(word),
                                              sample(single_replace, 1))
  }

  # then search for plural nouns + replace with plural nouns

  for (word in plural_search) {
    abstract_text <- stringr::str_replace_all(abstract_text,
                                              word,
                                              sample(plural_replace, 1))
    abstract_text <- stringr::str_replace_all(abstract_text,
                                              stringr::str_to_title(word),
                                              sample(plural_replace, 1))
  }

  return(abstract_text)

}




