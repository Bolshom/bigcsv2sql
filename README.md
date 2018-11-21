# Big CSV to SQL
-----------------------------------------------------------------------------------------

![LGPLv3](https://img.shields.io/badge/Licence-LGPLv3-green.svg)

## Description
-----------------------------------------------------------------------------------------

Version: 1.0.0

A Windows based R function created to partition a big .csv file with FileSplitter.

Then, the function create a .sqlite file with all .csv data.

The softwares ![FileSplitter](https://github.com/dubasdey/File-Splitter) and ![SQLite](https://www.sqlite.org/index.html) will be installed if the user doesn't have it, built in the machine.


## Installation
-----------------------------------------------------------------------------------------

In R:

>> install.packages("devtools")
>> devtools::install_github("Bolshom/bigcsv2sql")
>> require(bigcsv2sql)

Example:

>> csvpath = paste0(find.package("bigcsv2sql"), "/extdata")
>> bigcsv2sql("mtcars", csvpath, "mtcars.csv", 4)

This will generate a mtcars.sqlite file.

Then one can use DBI package to send a query over this database:

>> require(dbplyr)
>> require(DBI)
>> require(RSQLite)
>> setwd(paste0(find.package("bigcsv2sql"), "/extdata"))
>> con = dbConnect(SQLite(), dbname = "mtcars.sqlite")
>> query = dbSendQuery(con, "select * from mtcars where carb >= 4")
>> results = dbFetch(query)
>> dbClearResult(query)
>> results

Check ![DBI documentation](https://cran.r-project.org/web/packages/DBI/DBI.pdf) for further knowledge about the usage.