% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/basic_gayz.R
\name{basic_gayz}
\alias{basic_gayz}
\title{Basic gay text replacement}
\usage{
basic_gayz(abstract_text, pattern = c(), replacement = c(), gayer = FALSE)
}
\arguments{
\item{abstract_text}{Academic abstract to make gay(er)}

\item{pattern}{A singular noun or vector of singular nouns to search for. Defaults to vector of common units of observation in SBS research, e.g., participant, individual, etc.}

\item{replacement}{A singular noun or vector of singular nouns to use as replacements. Defaults to vector of common gay nonsense.}

\item{gayer}{Boolean, default FALSE. If TRUE, gives basic_gayz free reign to make various other gay changes.}
}
\value{
A gay(er) abstract
}
\description{
Replace common text from social-science abstracts with gay nonsense.
}
\examples{
abstract_text <- "75 participants were recruited. However,
8 individuals failed attention checks, resulting in an
analytic sample of 63 observations."

basic_gayz(abstract_text)

basic_gayz(abstract_text, gayer = TRUE)

basic_gayz(abstract_text, replacement = "queen")

basic_gayz(abstract_text, pattern = c("participant", "observation"), replacement = "queen")
}
