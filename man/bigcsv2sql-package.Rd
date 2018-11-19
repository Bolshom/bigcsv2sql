\name{bigcsv2sql-package}
\alias{bigcsv2sql-package}
\title{
Split and exports data to .sqlite file.
}
\description{
The package's purpose is to split and exports data, from a big .csv file, to a .sqlite file. This package requires FileSplitter to split the .csv, and also SQLite to create the SQL database. It was designed to work on a Windows-based OS.

If the user's PC doesn't have File Splitter or SQLite softwares installed, then the package will unzip them temporarily, erasing the folders after the end of the function.

IMPORTANT: USE PATH WITH FORWARD SLASH
}
\references{
File Splitter <https://github.com/dubasdey/File-Splitter>
SQLite <https://www.sqlite.org/index.html>
}
\author{
Natan Freitas Leite <natanfl@hotmail.com>
}
\examples{
## This example will create a .sqlite's database with mtcars data. This will be created in package's installation folder.
require(bigcsv2sql)
csvpath = paste0(find.package("bigcsv2sql"), "/extdata")
bigcsv2sql("mtcars", csvpath, "mtcars.csv", 4)

## Loading functions to apply a query over the created database.
require(dbplyr)
require(DBI)
require(RSQLite)

## Sending the query
setwd(paste0(find.package("bigcsv2sql"), "/extdata"))
con = dbConnect(SQLite(), dbname = "mtcars.sqlite")
query = dbSendQuery(con, "select * from mtcars where carb >= 4")
results = dbFetch(query)
dbClearResult(query)
results
}
