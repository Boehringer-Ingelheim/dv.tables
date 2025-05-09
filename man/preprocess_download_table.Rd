% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils-export_table.R
\name{preprocess_download_table}
\alias{preprocess_download_table}
\title{Preprocess table for download}
\usage{
preprocess_download_table(count_table)
}
\arguments{
\item{count_table}{A reactive list containing dataset containing the event data
and other meta data}
}
\value{
Processed table to download as excel
}
\description{
Preprocess table for download
}
\details{
Dataframe contains summary and all subject info. as list of lists
Extract the required named list
Add overall patients from column header
Separate the columns into count and percentage
}
\keyword{internal}
