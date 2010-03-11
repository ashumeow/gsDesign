\name{gsBinomialExact}
\alias{gsBinomialExact}
\alias{print.gsBinomialExact}
\title{3.4: One-Sample Exact Binomial Boundary Crossing Probabilities}
\description{Computes power/Type I error and expected sample size for a group sequential design
in a single-arm trial with a binary outcome.
The print function has been extended using \code{print.gsBinomialExact} to print \code{gsBinomialExact} objects; see examples.
}

\usage{
gsBinomialExact(k=2, theta=c(.1, .2), n.I=c(50, 100), a=c(3, 7), b=c(20,30))
}
\arguments{
	\item{k}{Number of analyses planned, including interim and final.}
	\item{theta}{Vector of possible underling binomial probabilities for a single binomial sample.}
	\item{n.I}{Sample size at analyses (increasing positive integers); vector of length k.}
	\item{a}{Number of "successes" required to cross lower bound cutoffs for futility or harm at each analysis; vector of length k; -1 means no lower bound.}
	\item{b}{Number of "successes" required to cross upper bound cutoffs for futility or harm at each analysis; vector of length k.}

}
\details{
Based on the book "Group Sequential Methods with Applications to Clinical Trials,"
Christopher Jennison and Bruce W. Turnbull, Chapter 12, Section 12.1.2 Exact Calculations for Binary Data.
This computation is often used as an approximation for the distribution of the number of events in one treatment group out of all events when the probability of an event is small and sample size is large.

An object of class \code{gsBinomialExact} is returned.
On output, the values of \code{theta} input to \code{gsBinomialExact} will be the parameter values for which the boundary crossing probabilities and expected sample sizes are computed.

Note that a[1] equal to -1 lower bound at n.I[1] means 0 successes continues at interim 1; a[2]==0 at interim 2 means 0 successes stops trial for futility at 2nd analysis. 
For final analysis, set a[k] equal to b[k]-1 to incorporate all possibilities into non-positive trial; see example.  
}

\value{
\code{gsBinomialExact()} returns a list of class \code{gsBinomialExact} and \code{gsProbability} (see example); when displaying one of these objects, the default function to print is \code{print.gsProbability()}. 
The object returned from \code{gsBinomialExact()} contains the following elements: 
	\item{k}{As input.}
	\item{theta}{As input.}
	\item{n.I}{As input.}
	\item{lower}{A list containing two elements: \code{bound} is as input in \code{a} and \code{prob} is a matrix of boundary 
	crossing probabilities. Element \code{i,j} contains the boundary crossing probability at analysis \code{i} for the \code{j}-th element of \code{theta} input. All boundary crossing is assumed to be binding for this computation; that is, the trial must stop if a boundary is crossed.}
	\item{upper}{A list of the same form as \code{lower} containing the upper bound and upper boundary crossing probabilities.}
	\item{en}{A vector of the same length as \code{theta} containing expected sample sizes for the trial design
	corresponding to each value in the vector \code{theta}.}
}
\seealso{\code{\link{gsProbability}}}
\note{The manual is not linked to this help file, but is available in library/gsdesign/doc/gsDesignManual.pdf
in the directory where R is installed.}
\author{Jon Hartzel with modifications for gsDesign package by Yevgen Tymofyeyev and Keaven Anderson \email{keaven\_anderson@merck.}}
\references{
Jennison C and Turnbull BW (2000), \emph{Group Sequential Methods with Applications to Clinical Trials}.
Boca Raton: Chapman and Hall.
} 

\examples{

zz <- gsBinomialExact(k=3,theta=seq(0,1,0.1), n.I=c(12,24,36),
        a=c(-1, 0, 11),  b=c( 5, 9, 12))

# let's see what class this is
class(zz)

# because of "gsProbability" class above, following is equivalent to 
# print.gsProbability(zz)
zz
}
\keyword{design}