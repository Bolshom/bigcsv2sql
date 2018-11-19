\name{prepare.sql}
\alias{prepare.sql}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Initialize SQL database.
}
\description{
This function takes a subset of the .csv file, in order to get each column type to prepare the SQL database. It also defines the column names within SQL's database. The function will try to use data.table::fread, but if this doesn't work it will try read.table (read.csv). It will work together with the main function bigcsv2sql.

IMPORTANT: USE PATH WITH FORWARD SLASH
}
\usage{
prepare.sql(outputfilename, csvpath, csvfile.csv, sqlite.exepath, read_func = "fread", header = T)
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
  \item{sqlite.exepath}{
The SQLite.exe's path to use.
}
  \item{read_func}{
A string to identify whether the function will use "fread" or "read.csv"/"read.table".
}
  \item{header}{
A boolean (TRUE or FALSE) if the .csv file has a header row.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
This will create a outputfilename.sqlite in the same folder that contains the .csv file. The .sqlite file contains only the column's names and the respectively column's types.
}
\references{
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
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
