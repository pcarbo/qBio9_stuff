# Import the data from the CSV file into a data frame in R.
storms <- read.csv("StormEvents_details-ftp_v1.0_d1974_c20220425.csv.gz",
                   stringsAsFactors = FALSE)

# Get an overview of the data.
nrow(storms)
ncol(storms)
colnames(storms)

# Look more closely at some of the columns.
table(storms$EVENT_TYPE)
table(storms$MONTH_NAME)
table(storms$TOR_F_SCALE)
summary(storms$BEGIN_DAY)
summary(storms$BEGIN_LON)
summary(storms$BEGIN_LAT)

# Make some improvements to the data frame.
storms$EVENT_TYPE <- factor(storms$EVENT_TYPE)
storms$STATE      <- factor(storms$STATE)
storms$MONTH_NAME <- factor(storms$MONTH_NAME,month.name)
rows <- which(storms$TOR_F_SCALE == "")
storms[rows,"TOR_F_SCALE"] <- NA
storms$TOR_F_SCALE <- factor(storms$TOR_F_SCALE)

# Extract the relevant rows of the table.
rows <- which(storms$EVENT_TYPE == "Tornado")
tornadoes <- storms[rows,]
nrow(storms)
nrow(tornadoes)

# What month and what day of the year saw the most tornadoes?
table(tornadoes$MONTH_NAME)
tornadoes$dayofyear <- paste(tornadoes$MONTH_NAME,
                             tornadoes$BEGIN_DAY,
                             sep = "-")
table(tornadoes$dayofyear)

## Which two states had the most tornadoes?
sort(table(tornadoes$STATE))

# Plot the tornadoes on a map.
plot(tornadoes$BEGIN_LON,tornadoes$BEGIN_LAT,pch = 20)
library(ggplot2)
map_usa_latlongs <- function (lats, longs) {
  dat <- data.frame(lat = lats,long = longs)
  return(ggplot(dat,aes(x = long,y = lat)) +
         geom_path(data = map_data("state"),
                   aes(x = long,y = lat,group = group),
                   color = "gray") +
         geom_point(shape = 20,size = 1) +
     	 theme_classic())
}
map_usa_latlongs(tornadoes$BEGIN_LAT,tornadoes$BEGIN_LON)

# Remove the outliers.
rows <- which(tornadoes$BEGIN_LON < -140 |
              tornadoes$BEGIN_LAT < 25)
tornadoes[rows,]
tornadoes <- tornadoes[-rows,]
map_usa_latlongs(tornadoes$BEGIN_LAT,tornadoes$BEGIN_LON)

rows <- which(tornadoes$dayofyear == "April-3")
map_usa_latlongs(tornadoes[rows,"BEGIN_LAT"],tornadoes[rows,"BEGIN_LON"])
