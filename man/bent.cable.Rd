\name{bent.cable}
\alias{bent.cable}
\alias{logLik.bent_cable}
\alias{predict.bent_cable}

\title{Fits a bent-cable model to the given data}
\description{
Fits a bent-cable model to the given data by exhaustively searching
the 2-dimensional parameter space to find the maximum likelihood
estimators for \eqn{\alpha} and \eqn{\gamma}.  
}

\usage{bent.cable(x, y, grid.size=100)}

\arguments{
	\item{x}{The independent variable}
	\item{y}{The dependent variable}
	\item{grid.size}{How many \eqn{\alpha} and \eqn{gamma} values to examine.  The total number of
	 	parameter combinations examined is \code{grid.size} squared.}
}

\details{
Fit the model which is essentially a piecewise linear model with a quadratic curve of length \eqn{2\gamma} 
connecting the two linear pieces.

The reason for searching the space exhaustively is because the bent-cable model often has a likelihood surface with a very
flat ridge instead of definite peak.  While the exhaustive search is slow, at least it is possible to examine the contour plot
of the likelihood surface.
}

\value{
	A list of 7 elements:
	\item{log.likelihood}{A matrix of log-likelihood values.}
	\item{SSE}{A matrix of sum-of-square-error values.}
	\item{alphas}{A vector of alpha values examined.}
	\item{gammas}{A vector of gamma values examined.}
	\item{alpha}{The MLE estimate of alpha.}
	\item{gamma}{The MLE estimate of gamma.}
	\item{model}{The \code{lm} fit after \eqn{alpha} and \eqn{gamma} are known. }
}

\references{
Chiu, G. S., R. Lockhart, and R. Routledge. 2006. Bent-cable regression 
	theory and applications. Journal of the American Statistical Association 
	101:542-553.

Toms, J. D., and M. L. Lesperance. 2003. Piecewise regression: a tool for 
		identifying ecological thresholds. Ecology 84:2034-2041. 
}	



\author{Derek Sonderegger}

\seealso{\code{\link{piecewise.linear}}}

\examples{
data(Arkansas)
x <- Arkansas$year
y <- Arkansas$sqrt.mayflies

# For a more accurate estimate, increase grid.size
model <- bent.cable(x,y, grid.size=20)
plot(x,y)
x.grid <- seq(min(x), max(x), length=200)
lines(x.grid, predict(model, x.grid), col='red')
}

\keyword{regression}
