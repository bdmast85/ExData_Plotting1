setwd("C:\\Users\\Brent\\Documents\\Courses\\EDA")
# read text file
dat <- read.csv("household_power_consumption.txt", sep=";",
header=TRUE,na.strings="?",colClasses=c(rep("character",2),rep("numeric",7)))
# convert time and date to R format
dat$Time<- strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
str(dat)
summary(dat)
head(dat) 
# save file
save(dat,file="dat.Rdata")
# min and max dates
dates <- as.Date(c("2007-02-01","2007-02-02"))
dates
# check to see if they are in correct date format
dates[2]-dates[1]
# subset data on min and max dates
dat2 <- subset(dat,Date>=min(dates) & Date<=max(dates))
summary(dat2)
str(dat2)
head(dat2)
save(dat2,file="dat2.Rdata")
# remove larger data set to free up space
rm(dat)
attach(dat2)

## Plot 2
png(filename="plot2.png",height=480,width=480)
plot(Time,Global_active_power,type="l",
ylab="Global Active Power (kilowatts)",xlab="")
dev.off()

detach(dat2)


