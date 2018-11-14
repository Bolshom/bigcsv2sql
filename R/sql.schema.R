#Function to create schema vector
sql.schema = function (col.name, type) {
  x = c(col.name," ",  type)
  paste0(x, collapse = "")
}
