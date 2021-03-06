% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/svm.predict.R
\name{svm.predict}
\alias{svm.predict}
\title{The predict function for svm.admm}
\usage{
svm.predict(x.te, model)
}
\arguments{
\item{x.te}{A n*p data matrix, input test data.}

\item{model}{The training result created by \code{svm.admm}.}
}
\value{
n-length vector, predicted labels.
}
\description{
\code{svm.predict} The function applies a model produced by the \code{svm.admm} function
   to every row of a data matrix and returns the model predictions.
}

