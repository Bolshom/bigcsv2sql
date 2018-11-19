\name{bigcsv2sql}
\alias{bigcsv2sql}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Split and exports data to .sqlite file.
}
\description{
This is the core function of the package. First, it will collect column's names and types to initialize a SQL database. Then, it will start to split the big .csv file, that cannot be entirely open in R environment. To finish, the function will input all data from each splitted file to a big SQL database. If the user doesn't define a SQLite or FileSplitter path, it will automatically install these softwares, then wipe whem out after the end of the function.

IMPORTANT: USE PATH WITH FORWARD SLASH
}
\usage{
bigcsv2sql(outputfilename, csvpath, csvfile.csv, rownumber.part = 1e+06, sqlite.exepath = NULL, fsplit.exepath = NULL, header = T)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{outputfilename}{
The .sqlite's file name.
}
  \item{csvpath}{
The path to the .csv file to be converted.
}
  \item{csvfile.csv}{
The .csv's name, this .csv in the string.
}
  \item{rownumber.part}{
The number of rows contained in each splitted file.
}
  \item{sqlite.exepath}{
The SQLite.exe's path to use.
}
  \item{fsplit.exepath}{
The FileSplitter.exe's path to use.
}
  \item{header}{
A boolean (TRUE or FALSE) if the .csv file has a header row.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
This will create a outputfilename.sqlite in the same folder that contains the .csv file. The .sqlite file contains all the data extracted from the .csv file.
}
\references{
File Splitter <https://github.com/dubasdey/File-Splitter>
SQLite <https://www.sqlite.org/index.html>
}
\author{
Natan Freitas Leite <natanfl@hotmail.com>
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
## This example will create a .sqlite's database with mtcars data. This will be created in package's installation folder.
require(bigcsv2sql)
csvpath = paste0(find.package("bigcsv2sql"), "/extdata")
bigcsv2sql("mtcars", csvpath, "mtcars.csv", 4)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
