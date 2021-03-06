% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kobo_check_analysis_plan.R
\name{kobo_check_analysis_plan}
\alias{kobo_check_analysis_plan}
\title{Check Analysis Plan}
\usage{
kobo_check_analysis_plan(form = "form.xlsx")
}
\arguments{
\item{form}{The full filename of the form to be accessed (xls or xlsx file).
It is assumed that the form is stored in the data folder.}
}
\value{
The return will be a list that contains a list that checks all elements of the analysis plan and message of confirmation
}
\description{
Check if the user setup the analysis plan in the right way.
}
\examples{
\dontrun{
kobo_check_analysis_plan("form.xlsx")
}

}
\author{
Maher Daoud
}
