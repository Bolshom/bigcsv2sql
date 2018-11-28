#Function to import .csv partition data to SQLite Database
bigcsv2sql = function (outputfilename, csvpath, csvfile.csv, rownumber.part = 1000000,
                       sqlite.exepath = NULL, fsplit.exepath = NULL, header = T) {
  ### IMPORTANT: USE PATH WITH FORWARD SLASH ###

  older_path = getwd()

  require(data.table)
  require(testit)

  #Installing SQLite or FileSplitter if necessary
  if(is.null(sqlite.exepath)) sqlite.exepath = install.sqlite()
  if(is.null(fsplit.exepath)) fsplit.exepath = install.filesplitter()

  #Preparing SQL Database
  if (has_error(fread(paste0(csvpath, "/", csvfile.csv), nrows = 1))) {
    prepare.sql(outputfilename, csvpath, csvfile.csv, sqlite.exepath, "read.csv", header)
  } else prepare.sql(outputfilename, csvpath, csvfile.csv, sqlite.exepath, "fread", header)
  cat("\n", "SQL Database Initialized...")

  #Creating folder to alocate csv partitions
  setwd(csvpath)
  dir.create("partitions_90909x9x")
  cat("\n", "Auxiliar partitions folder created")

  #Creating partitions with FileSplitter (https://github.com/dubasdey/File-Splitter)
  scriptpath = strsplit(csvpath, "/")[[1]]
  scriptpath = paste0(scriptpath, collapse = "\\")

  cat("\n", "Splitting .csv file")
  setwd(fsplit.exepath)
  shell(paste0("fsplit -split ", format(rownumber.part, scientific = F), ' l "', paste0(scriptpath, "\\", csvfile.csv),
               '" -f file{0}.csv -df "', paste0(scriptpath, '\\partitions_90909x9x"')))

  #Cleaning header on first partitioned file
  setwd(csvpath)
  aux = fread(paste0(csvpath, "/partitions_90909x9x/file1.csv"), skip = 1, stringsAsFactors = T)
  fwrite(aux, file = "partitions_90909x9x/file1.csv", col.names = F, row.names = F)
  rm(list = c("aux"))

  cat("\n", "Partitions created")

  #Creating sql script, first the section to import all csv partitions
  part = paste0(csvpath, "/partitions_90909x9x")
  import = list.files(part)
  import = paste0('.import "', part, '/', import, '" ', outputfilename)

  #Concatenating the script
  script = c(".mode csv",
             import,
             ".quit")

  #Creating the script file
  fileConn = file("script.sql")
  writeLines(script, fileConn)
  close(fileConn)

  cat("\n", "SQL Script created")

  #Running the script with SQLite3 to create SQL database
  setwd(sqlite.exepath)

  cat("\n", "Running SQL Script")

  shell(paste0('sqlite3 "', scriptpath, '\\', outputfilename,
               '.sqlite" < "', scriptpath, '\\script.sql"')) #SQL Script running on CMD

  cat("\n", "End of SQL Script")

  #Removing auxiliar partitions folder and script file
  setwd(csvpath)
  unlink("partitions_90909x9x", recursive = T)
  unlink("script.sql")
  setwd(older_path)
}
