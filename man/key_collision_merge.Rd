% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/key_collision_merge.R
\name{key_collision_merge}
\alias{key_collision_merge}
\title{Value merging based on Key Collision}
\usage{
key_collision_merge(vect, dict = NULL, bus_suffix = TRUE)
}
\arguments{
\item{vect}{Character vector of items for which you want similar values
merged and edited to be identical.}

\item{dict}{Character vector, meant to act as a dictionary during the
merging process. If any items within \code{vect} have a match in dict, then
those items will always be edited to be identical to their match in dict.
Optional param, and default value is NULL. If no dictionary is passed,
then clusters will be created and merged within \code{vect} without the aid
of dictionary values.}

\item{bus_suffix}{Logical indicating whether the merging of records should
be insensitive to common business suffixes (TRUE) or not (FALSE). If
working with a vector of business names it's recommended to set this to
TRUE. Default value is TRUE.}
}
\value{
Character vector with similar values merged.
}
\description{
This function takes a character vector and makes edits and merges values
that are approximately equivalent yet not identical. It clusters values
based on the key collision method, described here
\url{https://github.com/OpenRefine/OpenRefine/wiki/Clustering-In-Depth}.
}
\examples{
\dontrun{
x <- c("Acme Pizza, Inc.",
       "ACME PIZZA COMPANY",
       "pizza, acme llc",
       "Acme Pizza, Inc.")
key_collision_merge(vect = x, bus_suffix = TRUE)
[1] "Acme Pizza, Inc." "Acme Pizza, Inc." "Acme Pizza, Inc." "Acme Pizza, Inc."

# Add param "dict".
dict <- c("Nicks Pizza", "acme PIZZA inc")
x <- c("Acme Pizza, Inc.",
       "ACME PIZZA COMPANY",
       "pizza, acme llc",
       "Acme Pizza, Inc.")
key_collision_merge(vect = x, dict = dict, bus_suffix = TRUE)
[1] "acme PIZZA inc" "acme PIZZA inc" "acme PIZZA inc" "acme PIZZA inc"
}
}
