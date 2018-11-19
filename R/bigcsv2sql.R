#Function to import .csv partition data to SQLite Database
bigcsv2sql = function (outputfilename, csvpath, csvfile.csv, rownumber.part = 1000000,
                       sqlite.exepath = NULL, fsplit.exepath = NULL, header = T) {
  ### IMPORTANT: USE PATH WITH FORWARD SLASH ###

  #Installing SQLite or FileSplitter if necessary
  if(is.null(sqlite.exepath)) {
    sqlite.exepath = install.sqlite()
    inst_sql = T
  }
  if(is.null(fsplit.exepath)) {
    fsplit.exepath = install.filesplitter()
    inst_fsplit = T
  }

  aux_func(outputfilename, csvpath, csvfile.csv, rownumber.part,
           sqlite.exepath, fsplit.exepath, header)

  #Removing auxiliar partitions folder and script file
  setwd(csvpath)
  unlink("partitions_90909x9x", recursive = T)
  unlink("script.sql")
  setwd(paste0(find.package("bigcsv2sql"), "/extdata"))
  if(inst_sql) unlink("sqlite", recursive = T, force = T)
  if(inst_fsplit) unlink("filesplitter", recursive = T, force = T)
}
