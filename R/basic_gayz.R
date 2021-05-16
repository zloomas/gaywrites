#' Basic gay text replacement
#'
#' Replace common text from social-science abstracts with gay nonsense.
#'
#' @param abstract_text Academic abstract to make gay(er)
#' @param pattern A singular noun or vector of singular nouns to search for. Defaults to vector of common units of observation in SBS research, e.g., participant, individual, etc.
#' @param replacement A singular noun or vector of singular nouns to use as replacements. Defaults to vector of common gay nonsense.
#' @param gayer Boolean, default FALSE. If TRUE, gives basic_gayz free reign to make various other gay changes.
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
#' basic_gayz(abstract_text, gayer = TRUE)
#'
#' basic_gayz(abstract_text, replacement = "queen")
#'
#' basic_gayz(abstract_text, pattern = c("participant", "observation"), replacement = "queen")
basic_gayz <- function(abstract_text, pattern=c(), replacement=c(), gayer=FALSE) {
  # make useful defaults to find common units of observation
  # start with easy words if none are provided
  if (length(pattern) == 0) {

    simple_single_search <- c("participant", "subject", "patient", "voter",
                              "individual", "human", "employee", "supervisor",
                              "manager", "human being", "student", "teacher",
                              "respondent", "panelist", "adult", "adolescent",
                              "worker", "player", "actor", "observation")

    complex_single_search <- c("child", "person", "man", "woman")

    complex_plural_search <- c(" children ", " people ", " men ", " women ")

  } else {

    simple_single_search <- pattern

    complex_single_search <- c()

    complex_plural_search <- c()

  }

  single_search <- append(simple_single_search, complex_single_search)

  for (ix in 1:length(single_search)) {
    single_search[ix] <- paste0(" ", single_search[ix], " ")
  }

  simple_plural_search <- vector(mode="character", length(simple_single_search))

  for (ix in 1:length(simple_single_search)) {
    simple_plural_search[ix] <- paste0(" ", simple_single_search[ix], "s ")
  }

  plural_search <- append(simple_plural_search, complex_plural_search)

  if (length(replacement) == 0) {

    simple_single_replace <- c("bestie", "girlie", "queen", "kween",
                               "babe", "mama", "diva")

    complex_single_replace <- c("henny", "hunty", "girlboss", "barb")

    complex_plural_replace <- c(" hennies ", " hunties ", " girlbosses ",
                                " barbz ", " theydies ")

  } else {

    simple_single_replace <- replacement

    complex_single_replace <- c()

    complex_plural_replace <- c()

  }

  single_replace <- append(simple_single_replace, complex_single_replace)

  for (ix in 1:length(single_replace)) {
    single_replace[ix] <- paste0(" ", single_replace[ix], " ")
  }

  plural_replace <- vector(mode="character", length(simple_single_replace))

  for (ix in 1:length(simple_single_replace)) {
    plural_replace[ix] <- paste0(" ", simple_single_replace[ix], "s ")
  }

  plural_replace <- append(plural_replace, complex_plural_replace)

  # first search for singular nouns + replace with singular nouns
  # include title-case handling to catch instances where word is first
  # in a sentence

  for (word in single_search) {

    while(stringr::str_detect(abstract_text, word)) {

      abstract_text <- stringr::str_replace(abstract_text,
                                            word,
                                            sample(single_replace, 1))

    }

    while(stringr::str_detect(abstract_text, stringr::str_to_title(word))) {

      abstract_text <- stringr::str_replace(abstract_text,
                                            stringr::str_to_title(word),
                                            stringr::str_to_title(sample(single_replace, 1)))

    }

  }

  # then search for plural nouns + replace with plural nouns

  for (word in plural_search) {

    while(stringr::str_detect(abstract_text, word)) {

      abstract_text <- stringr::str_replace(abstract_text,
                                            word,
                                            sample(plural_replace, 1))

    }

    while(stringr::str_detect(abstract_text, stringr::str_to_title(word))) {

      abstract_text <- stringr::str_replace(abstract_text,
                                            stringr::str_to_title(word),
                                            stringr::str_to_title(sample(plural_replace, 1)))

    }

  }

  if (gayer) {

    # add padding to the start and end of the abstract

    start_opts <- c("Girl, you are not gonna believe what happened.",
                    "Ok sis, here's the tea.")

    end_opts <- c("Periodt!", "And that's that on that.", "And that's tea.",
                  "And that's what you missed on Glee.", "Can you believe?",
                  "And now, sashay away.",
                  'Anyway, stream "Slumber Party" on Spotify.',
                  'Anyway, stream "MONTERO (Call Me By Your Name)" on Spotify.')

    if (stringr::str_detect(abstract_text, " I ")) {

      single_start_opts <- c("Hey queen, I've done it again.")

      start_opts <- c(start_opts, single_start_opts)

      single_end_opts <- c("And I'm just as gagged as you, sis.",
                           "And I love that for me.")

      end_opts <- append(end_opts, single_end_opts)

    } else if (stringr::str_detect(abstract_text, " (w|W)e ")) {

      plural_start_opts <- c("Hey queen, we've done it again.")

      start_opts <- c(start_opts, plural_start_opts)

      plural_end_opts <- c("And we're just as gagged as you, sis.",
                           "And we love that for us.")

      end_opts <- append(end_opts, plural_end_opts)

    }

    abstract_text <- paste(sample(start_opts, 1), abstract_text)

    abstract_text <- paste(abstract_text, sample(end_opts, 1))

    # handle transitions

    abstract_text <- stringr::str_replace(abstract_text,
                                          "However|Surprisingly",
                                          "The gag is")

    # results qualifiers

    results_search <- c("significant", "positive", "negative", "strong",
                        "moderate", "weak")

    for (ix in 1:length(results_search)) {
      results_search[ix] <- paste0(" ", results_search[ix], " ")
    }

    results_replace <- c("goopy", "gaggy", "iconic", "legendary", "skinny")

    for (ix in 1:length(results_replace)) {
      results_replace[ix] <- paste0(" ", results_replace[ix], " ")
    }

    for (word in results_search) {

      while(stringr::str_detect(abstract_text, word)) {

        abstract_text <- stringr::str_replace(abstract_text,
                                              word,
                                              sample(results_replace, 1))

      }
    }

  }

  return(abstract_text)

}




