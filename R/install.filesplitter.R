install.filesplitter = function () {
  older_path = getwd()
  setwd(paste0(find.package("bigcsv2sql"), "/extdata"))
  if("filesplitter" %in% dir()) unlink("filesplitter", recursive = T)
  zippath = system.file("extdata", "filesplitter.zip", package = "bigcsv2sql")
  unzip_dir = paste0(find.package("bigcsv2sql"), "/extdata/filesplitter")
  unzip(zippath, exdir = unzip_dir)
  setwd(older_path)
  return(unzip_dir)
}
