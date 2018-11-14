install.filesplitter = function () {
  zippath = system.file("extdata", "filesplitter.zip", package = "bigcsv2sql")
  unzip_dir = paste0(find.package("bigcsv2sql"), "/extdata/filesplitter")
  unzip(zippath, exdir = unzip_dir)
  return(unzip_dir)
}
