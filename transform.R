# script for read, transforming, and exporting data, will save in current working directory

transform <- function(filepath, data, name, crs, driver) {
  library(rgdal)
  setwd(filepath)
  data <- rgdal::readOGR(".", data, encoding = "UTF-8")
  data <- spTransform(data, CRS(crs))
  writeOGR(data, ".", name, driver=driver) 
}

transform(" "," ","ccs_longlat","+proj=longlat +datum=WGS84","ESRI Shapefile")