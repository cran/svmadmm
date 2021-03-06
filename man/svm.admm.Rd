% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/svm.admm.R
\name{svm.admm}
\alias{svm.admm}
\title{linear/nonlinear svm solver based ADMM and IADMM algorithms}
\usage{
svm.admm(x.tr, y.tr, type = 0, kernel = "radial", sigma = 1/ncol(x.tr),
  degree = 1, scale = 1, offset = 1, algo = "iadmm", lambda = 1,
  rho = 1, eps = 0.01)
}
\arguments{
\item{x.tr}{a n*p data matrix. Each row stands for an example (sample, point) and each column stands for a dimension (feature, variable).}

\item{y.tr}{a n-length vector. The values correspond to class labels.}

\item{type}{\code{svmadmm} can provide 3 types of linear/kernel models.
          The default value for \code{type} is 0. See details below. Valid options are:
\itemize{
      \item 0 -- L2-regularized kernel svm (dual)
      \item 1 -- L2-regularized linear svm (primal)
      \item 2 -- L1-regularized linear svm (primal)
  }}

\item{kernel}{the kernel used in training and predicting when \code{type} is 0.
          The default value for \code{kernel} is radial. See details below. Valid options are:
\itemize{
      \item \code{radial} -- The Gaussian RBF kernel k(x,x') = exp(-sigma \|x - x'\|^2)
      \item \code{linear} -- The Linear kernel k(x,x') = <x, x'>
      \item \code{polynomial} -- The Polynomial kernel k(x,x') = (scale <x, x'> + offset)^{degree}
  }}

\item{sigma}{The inverse kernel width used by the Gaussian.}

\item{degree}{The degree of the polynomial kernel function. This has to be an positive integer.}

\item{scale}{The scaling parameter of the polynomial kernel is a convenient way of normalizing patterns without the need to modify the data itself.}

\item{offset}{The offset used in a polynomial kernel.}

\item{algo}{the algorithm to solve the problem w.r.t. \code{type}.}

\item{lambda}{regularization constant (default: 1). Rules the trade-off
between regularization and correct classification on \code{data}.}

\item{rho}{regularization constant (default: 1).}

\item{eps}{epsilon in the termination condition.}
}
\value{
An list containing the fitted model, including:
\item{alpha}{ A solution for dual form svm classification.}
\item{beta}{ A solution for primal form svm classifciation, also are the model weights.}
\item{type}{ An integer correspinding to \code{type}.}
\item{kernel}{ A function to define the kernel.}
\item{x.tr}{ The training input data.}
\item{y.tr}{ The training output data.}
}
\description{
\code{svm.admm} is a simple function for solving large-scale regularized linear/nonlinear
  classification by using ADMM and IADMM algorithms. This function provides
  linear L2-regularized primal classification (both ADMM and IADMM are available),
  kernel L2-regularized dual classification (IADMM) as well as L1-regularized primal
  classification (both ADMM and IADMM are available). The training of the models perform well
  practice.
}
\details{
\code{svmadmm} internally computing kernel matrix when \code{type} is 0, which is based by the package \strong{kernlab}.
}
\examples{
library(svmadmm)
n = 100
p = 10
x = matrix(runif(2 * n * p, -1, 1), nrow = 2 * n)
y = sign(x[, 1])
y.ind = sample(1 : (2 * n), n / 10, replace = FALSE)
y[y.ind] = - y[y.ind]
x.tr = x[1 : n, ]
y.tr = y[1 : n]
x.te = x[-(1 : n), ]
y.te = y[-(1 : n)]
model = svm.admm(x.tr, y.tr)
fit = svm.predict(x.te, model)
}

