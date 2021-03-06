% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SY.monthly.R
\docType{data}
\name{SY4.monthly}
\alias{SY4.monthly}
\title{Stambaugh–Yuan Four-Factors Data Set}
\format{
An \code{xts} object containing observations of Stambaugh–Yuan (2017) four-factors
data set on U.S. Stock Market, and the risk-free rate on 1-month U.S. T-Bill.
\itemize{
\item \strong{Frequency}: Monthly.
\item \strong{Date Range}: 1963-01 to 2016-12.
\item \strong{Data updated}: 2020-08-24 23:13:55 CEST.
\item \strong{RF}: A numeric. The risk-free rate on 1-month U.S. T-Bill. See 'RF variable' section below.
\item \strong{MKT.RF}: A numeric. The market portfolio proxy return net of risk-free rate factor. See 'MKT.RF factor' section below.
\item \strong{SMB}: A numeric. The "Small Minus Big" size factor. See 'SMB factor' section below.
\item \strong{MGMT}: A numeric. The investment factor. See 'MGMT factor' section below.
\item \strong{PERF}: A numeric. The profitability factor. See 'PERF factor' section below.
}

The object consists of 648 rows and 5 columns.
}
\source{
\url{http://finance.wharton.upenn.edu/~stambaug/M4.csv}
}
\usage{
data("SY4.monthly")
}
\description{
\code{SY4.monthly} is the Stambaugh–Yuan (2017) four-factors monthly data series on
U.S. stock market from 1963-01 to 2016-12. The data set also includes the risk-free
rate on 1-month U.S. T-Bill during the same period.
}
\details{
In addition to column definitions, this section contains a glimpse into factors
construction and their underlying variables.
}
\section{Stambaugh-Yuan (2017) Factors Construction}{


Stambaugh-Yuan (2017) consider 11 anomalies. Anomalies form two clusters:
\itemize{
\item \emph{First cluster}: net stock issues, composite equity issues, accruals,
net operating assets, asset growth, and investment to assets.
\item \emph{Second cluster}: distress, O-score, momentum, gross profitability, and
return on assets.
}

Authors construct factors based on equally-weighted averages of stocks' anomaly
rankings, in the perspective of having a less noisy mispricing measure for each
stock across anomalies. In particular, stock's rankings are averaged with respect
to the available anomaly measures within each of the two clusters. Thus, each
month a stock has two composite mispricing measures, \eqn{P1} and \eqn{P2}.

\emph{Mispricing factors} are then constructed by applying a \eqn{2x3} sorting procedure,
similarly to Fama-French (2015):
\itemize{
\item First, NYSE, AMEX, and NASDAQ stocks (excluding the ones with a price lower
than 5$) are sorted and split into two groups based on the NYSE median size breakpoint;
\item Second, stock's are sorted by both \eqn{P1} and \eqn{P2} independently, and
assigned to three groups ("low", "middle", and "high") with the 20th and 80th
percentiles of the NYSE/AMEX/NASDAQ as breakpoints (rather than the commonly
used 30th and 70th percentiles of the NYSE). The motivation authors provide
for this methodological choice on breakpoints is that relative mispricing in
the cross-section is considered to be "more a property of the extremes than
of the middle".
\item Finally, value-weighted returns of each of the four portfolios formed by the
intersection of the two size categories with high and low categories of either
\eqn{P1} or \eqn{P2} sorts are averaged and constitute their two mispricing
factors, \emph{MGMT} and \emph{PERF}, respectively.
}
}

\section{RF variable}{


The \code{RF} variable refers to the \emph{risk-free rate}. It depends on the period been
considered and on the country. For example, for U.S. monthly data series is the
one month \emph{T-Bill} return.
The \code{RF} data series distributed by K. R. French with the Fama-French factors
data are usually obtained from \emph{Ibbotson Associates Inc. (Morningstar)}.
}

\section{MKT.RF factor}{


With \code{MKT.RF} we indicate the excess return on the market portfolio return proxy,
net of the risk-free rate \eqn{RF} calculated on the same period \eqn{t}, that is

\deqn{MKT.RF = MKT - RF}

or, as it is also commonly denoted in the literature,

\deqn{MKT.RF = R_{m} - R_{f}}

\eqn{MKT} is obtained by Fama-French as the value-weight return of all CRSP
firms that are incorporated in the U.S. and listed on the NYSE, AMEX, or NASDAQ
securities markets. These firms must have a CRSP share code of 10 or 11, good
shares and price data, at the beginning of the period.
}

\section{SMB factor}{


The \code{SMB} (\emph{Small Minus Big}) factor Stambaugh-Yuan (2017) constructed differs
from the homonymous factor constructed by means of the standard Fama-French (1993, 2015)
methodology widely adopted.

First of all, stocks used to form the size factor in a given month are the
stocks not used in forming either of the mispricing factors.

Moreover, in Stambaugh-Yuan (2017) the return on the \emph{small-cap leg} is
the value-weighted portfolio of stocks present in the intersection of both
small-cap middle groups when sorting on the \eqn{P1} and \eqn{P2} mispricing
composite measures. The \emph{large-cap leg} is the value-weighted portfolio of stocks
in the intersection of the large-cap middle groups in the sorts on the two measures.
Thus the value of SMB in a given month is the return on the small-cap leg minus
the large-cap return.

Computing SMB using stocks only from the middle of their mispricing sorts is
meant to reduce the "arbitrage asymmetry bias" while neutralizing mispricing
effects.
}

\section{MGMT factor}{


The \emph{MGMT} factor is the arithmetic average of the returns on the two low-P1
portfolios (underpriced stocks) minus the arithmetic average of the returns on
the two high-P1 portfolios (overpriced stocks).
}

\section{PERF factor}{


The \emph{PERF} factor is the arithmetic average of the returns on the two low-P2
portfolios (underpriced stocks) minus the arithmetic average of the returns on
the two high-P2 portfolios (overpriced stocks).
}

\examples{
data(SY4.monthly)

head(SY4.monthly)

}
\references{
Fama, Eugene F and French, Kenneth R (1993). \emph{Common risk factors in the returns on stocks and bonds}. Journal of Financial Economics.

Fama, Eugene F and French, Kenneth R (2015). \emph{A five-factor asset pricing model}. Journal of Financial Economics.

Stambaugh, R. F. and Yuan, Y. (2017). \emph{Mispricing Factors}. The Review of Financial Studies.
}
\keyword{datasets}
