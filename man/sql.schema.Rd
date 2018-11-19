\name{sql.schema}
\alias{sql.schema}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Create SQL's schema.
}
\description{
This function exists to define the type of each column into the database. It works together with prepare.sql function in this package, to initialize the database.
}
\usage{
sql.schema(col.name, type)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{col.name}{
The column name as written in the .csv header.
}
  \item{type}{
The type of this column, whether it is an integer, a real, a character...
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
It returns a string composed of "col.name type". For example sql.schema("price", "integer") will return a string "price integer".
}
\references{
%% ~put references to the literature/web site here ~
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
function (col.name, type)
{
    x = c(col.name, " ", type)
    paste0(x, collapse = "")
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
