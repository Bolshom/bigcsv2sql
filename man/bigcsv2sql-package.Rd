\name{bigcsv2sql-package}
\alias{bigcsv2sql-package}
\title{
Split and exports data to .sqlite file.
}
\description{
The package's purpose is to split and exports data, from a big .csv file, to a .sqlite file. This package requires FileSplitter to split the .csv, and also SQLite to create the SQL database. It was designed to work on a Windows-based OS.

If the user's PC doesn't have File Splitter or SQLite softwares installed, then the package will unzip them temporarily, erasing the folders after the end of the function.
}
\references{
File Splitter <https://github.com/dubasdey/File-Splitter>
SQLite <https://www.sqlite.org/index.html>
}
\author{
Natan Freitas Leite <natanfl@hotmail.com>
}
