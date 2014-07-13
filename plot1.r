## Original file was unzipped and put in working directory
## original data can be downloaded from : https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

#Check if procesesed file exisits 
if(!file.exists("database2.Rda")){
  ## if not, read and create procesed data file
  database1<-read.delim("household_power_consumption.txt",header=T,sep=";",na.strings="?")
  ## select wanted data
  database2<-database1[database1$Date=="1/2/2007" | database1$Date=="2/2/2007",]
  ## Set time and date to R format (and combine them)
  database2$date_time<-strptime(paste(database2$Date,database2$Time),"%d/%m/%Y %H:%M:%S")
  ## save file for future use 
  save(database2,file="database2.Rda")
} 
## if file exists load into workspace
load("database2.Rda")

## create png file for plot
png(filename="plot1.png",width=480,height=480)

## draw plot into png
hist(database2$Global_active_power,freq=T,xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",col="red")

## Save plot into png and exit device
dev.off()
