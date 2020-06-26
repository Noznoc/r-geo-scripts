# script for reading, transforming, calculating centroids, and/or exporting data, will save in current working directory

centroids <- function(filepath, data, name, crs, driver) {
  library(rgdal)
  setwd(filepath)
  data <- rgdal::readOGR(".", data, encoding = "UTF-8")
  data <- spTransform(data, CRS(crs))
  plot(data)
  coords <- coordinates(data)
  centroids <- SpatialPointsDataFrame(coords=coords, data=data@data, proj4string=CRS(crs))
  if (name != ""){
    writeOGR(data, ".", name, driver=driver) 
  }
}

centroids("../shapefile","shapefile","","+proj=longlat +datum=WGS84","ESRI Shapefile")