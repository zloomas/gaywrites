
<!-- README.md is generated from README.Rmd. Please edit that file -->
<style type="text/css">
pre code {
  white-space: pre-wrap;
}
</style>

# gaywrites

<!-- badges: start -->
<!-- badges: end -->

The goal of `gaywrites` is to take academic abstracts and make them just
a little bit gayer.

## Installation

You can install `gaywrites` like so:

``` r
# devtools::install_github("zloomas/gaywrites")
```

## Example

This is a basic example which shows you how to make gay modifications to
a typical academic abstract from a social-behavioral science article.
Consider the example below from Laliberte, Yim, Stone, and Dennis
(2021):

``` r
library(gaywrites)

# text from above
abstract_text <- "A primary challenge for alibi-generation research is establishing the ground truth of real-world events of interest. In the current study, we used a smartphone app to record data on adult participants (N = 51) for a month prior to a memory test. The app captured accelerometry data, GPS locations, and audio environments every 10 min. After a week-long retention interval, we asked participants to identify where they were at a given time from among four alternatives. Participants were incorrect 36% of the time. Furthermore, our forced-choice procedure allowed us to conduct a conditional logit analysis to assess the different aspects of the events that the participants experienced and their relative importance to the decision process. We found strong evidence that participants confuse days across weeks. In addition, people often confused weeks in general and also hours across days. Similarity of location induced more errors than similarity of audio environments or movement types."

basic_gayz(abstract_text)
#> [1] "A primary challenge for alibi-generation research is establishing the ground truth of real-world events of interest. In the current study, we used a smartphone app to record data on henny besties (N = 51) for a month prior to a memory test. The app captured accelerometry data, GPS locations, and audio environments every 10 min. After a week-long retention interval, we asked girlbosses to identify where they were at a given time from among four alternatives. Besties were incorrect 36% of the time. Furthermore, our forced-choice procedure allowed us to conduct a conditional logit analysis to assess the different aspects of the events that the queens experienced and their relative importance to the decision process. We found strong evidence that babes confuse days across weeks. In addition, girlies often confused weeks in general and also hours across days. Similarity of location induced more errors than similarity of audio environments or movement types."

basic_gayz(abstract_text, replacement = "girlie")
#> [1] "A primary challenge for alibi-generation research is establishing the ground truth of real-world events of interest. In the current study, we used a smartphone app to record data on girlie girlies (N = 51) for a month prior to a memory test. The app captured accelerometry data, GPS locations, and audio environments every 10 min. After a week-long retention interval, we asked girlies to identify where they were at a given time from among four alternatives. Girlies were incorrect 36% of the time. Furthermore, our forced-choice procedure allowed us to conduct a conditional logit analysis to assess the different aspects of the events that the girlies experienced and their relative importance to the decision process. We found strong evidence that girlies confuse days across weeks. In addition, girlies often confused weeks in general and also hours across days. Similarity of location induced more errors than similarity of audio environments or movement types."

basic_gayz(abstract_text, pattern = "participant", replacement = c("bestie", "girlie"))
#> [1] "A primary challenge for alibi-generation research is establishing the ground truth of real-world events of interest. In the current study, we used a smartphone app to record data on adult besties (N = 51) for a month prior to a memory test. The app captured accelerometry data, GPS locations, and audio environments every 10 min. After a week-long retention interval, we asked besties to identify where they were at a given time from among four alternatives. Girlies were incorrect 36% of the time. Furthermore, our forced-choice procedure allowed us to conduct a conditional logit analysis to assess the different aspects of the events that the girlies experienced and their relative importance to the decision process. We found strong evidence that girlies confuse days across weeks. In addition, people often confused weeks in general and also hours across days. Similarity of location induced more errors than similarity of audio environments or movement types."
```

## Upcoming

-   Handle search/replace instances at the end of a sentence.
-   Generalize methods to handle other parts of speech besides units of
    observation.

## Example abstract citation

Laliberte, E., Yim, H., Stone, B., & Dennis, S. J. (2021). The Fallacy
of an Airtight Alibi: Understanding Human Memory for “Where” Using
Experience Sampling. Psychological Science.
<https://doi.org/10.1177/0956797620980752>
