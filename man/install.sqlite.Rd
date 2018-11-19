\name{install.sqlite}
\alias{install.sqlite}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Unzip SQLite.
}
\description{
This function is necessary when the user doesn't define a SQLite path to the main function bigcsv2sql. So, this will unzip the program that is downloaded within the package. The SQLite is responsible for creating a SQL database.
}
\usage{
install.sqlite()
}
%- maybe also 'usage' for other objects documented here.
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
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
## The function is currently defined as
function ()
{
    zippath = system.file("extdata", "sqlite.zip", package = "bigcsv2sql")
    unzip_dir = paste0(find.package("bigcsv2sql"), "/extdata/sqlite")
    unzip(zippath, exdir = unzip_dir)
    return(unzip_dir)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
