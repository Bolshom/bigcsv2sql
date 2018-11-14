#Function to initialize SQL Database with correct column classes
prepare.sql = function (outputfilename, csvpath, csvfile.csv, sqlite.exepath, read_func = "fread", header = T) {

  require(data.table)

  setwd(csvpath)

  #Getting the column types from a single sample of data
  if (read_func == "fread") sample = fread(csvfile.csv, nrows = 1000, header = header) else {
    sample = read.table(csvfile.csv, nrows = 1000, sep = ",", header = header)
  }
  sample = sapply(sample, class)
  cn = names(sample)
  #Changing types to SQL types
  t = ifelse(sample == "character", "text",
             ifelse(sample == "numeric", "real", "integer"))

  #Preparing schema vector
  schema = mapply(sql.schema, cn, t)
  schema = paste0(schema, collapse = " , ")

  #Creating schema script for SQL Database
  script.schema = c(paste0("create table ", outputfilename, " (",schema, ");"),
                    ".quit")

  #Creating .sql script file
  fileConn = file("script.schema.sql")
  writeLines(script.schema, fileConn)
  close(fileConn)

  #Sending to SQLite3 Shell
  setwd(sqlite.exepath)
  scriptpath = strsplit(csvpath, "/")[[1]]
  scriptpath = paste0(scriptpath, collapse = "\\")

  shell(paste0('sqlite3 "', scriptpath, '\\', outputfilename,
               '.sqlite" < "', scriptpath, '\\script.schema.sql"'))

  #Cleaning auxiliar script
  setwd(csvpath)
  unlink("script.schema.sql")
}
