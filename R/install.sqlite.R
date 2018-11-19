install.sqlite = function () {
  setwd(paste0(find.package("bigcsv2sql"), "/extdata"))
  if("sqlite" %in% dir()) unlink("sqlite", recursive = T)
  zippath = system.file("extdata", "sqlite.zip", package = "bigcsv2sql")
  unzip_dir = paste0(find.package("bigcsv2sql"), "/extdata/sqlite")
  unzip(zippath, exdir = unzip_dir)
  return(unzip_dir)
}
