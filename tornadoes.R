storms <- read.csv("StormEvents_details-ftp_v1.0_d1974_c20220425.csv.gz",
                   stringsAsFactors = FALSE)
nrow(storms)
ncol(storms)
colnames(storms)
table(storms$EVENT_TYPE)
table(storms$MONTH_NAME)
table(storms$TOR_F_SCALE)
summary(storms$BEGIN_DAY)
summary(storms$BEGIN_LON)
summary(storms$BEGIN_LAT)
storms$EVENT_TYPE <- factor(storms$EVENT_TYPE)
storms$STATE      <- factor(storms$STATE)
storms$MONTH_NAME <- factor(storms$MONTH_NAME,month.name)
rows <- which(storms$TOR_F_SCALE == "")
storms[rows,"TOR_F_SCALE"] <- NA
storms$TOR_F_SCALE <- factor(storms$TOR_F_SCALE)
rows <- which(storms$EVENT_TYPE == "Tornado")
tornadoes <- storms[rows,]
nrow(storms)
nrow(tornadoes)
table(tornadoes$MONTH_NAME)
plot(table(tornadoes$MONTH_NAME))
tornadoes$dayofyear <- paste(tornadoes$MONTH_NAME,
                             tornadoes$BEGIN_DAY,
                             sep = "-")
table(tornadoes$dayofyear)
plot(table(tornadoes$dayofyear))
