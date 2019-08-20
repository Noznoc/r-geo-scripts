# script for reading, transforming, and exporting data, will save in current working directory

transform <- function(filepath, data, name, crs, driver) {
  library(rgdal)
  setwd(filepath)
  data <- rgdal::readOGR(".", data, encoding = "UTF-8")
  data <- spTransform(data, CRS(crs))
  writeOGR(data, ".", name, driver=driver) 
}

transform("[enter file path of where data is stored]","[enter file name of data]","[enter file name of data that will be exported]","[specify proj4 string, e.g., +proj=longlat +datum=WGS84]","[specify driver, the data format, e.g., ESRI Shapefile]")