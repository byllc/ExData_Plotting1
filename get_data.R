hpcDataURL  <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
hpcDataName <- "Dataset.zip"

#Make sure the required directories are created
dataPath          <- "./data"
tempPath          <- "./tmp"

#make sure our auxilliary directories are
if (!file.exists(dataPath))  { dir.create(dataPath) }
if (!file.exists(tempPath))  { dir.create (tempPath) }

#where will the data live after the file is downloaded and processed
#This assumes the format of the dataset directory structure does not change
hpcDataPath  <- paste(dataPath, "hcp", sep="/")

##Zip file will go on the tmp folder
hpcZipFilePath <- paste(tempPath,hpcDataName,sep="/")

# Download the data set if it does not already exist locally
# If you want to refresh the dataset delete the "./data/UCI HAR Dataset" directory
if(!file.exists(hpcZipFilePath)){
  message( paste("File doesn't exist, retriving from ", hpcDataURL) )
  download.file(url=hpcDataURL, destfile=hpcZipFilePath, method="curl")
}

# Extract files to the data path
unzip(zipfile=hpcZipFilePath, exdir=dataPath)

fullHpcFilePath  <- paste(dataPath, "household_power_consumption.txt", sep="/")

#get the raw data
#inefficient but I have plenty of memory (32gb) and this runs quickly for me
rawData <- read.csv( fullHpcFilePath, na.strings="?", sep=";")

hpcDataForDates  <- rawData[ grepl("^[1|2]/2/2007",rawData$Date), ]

# Compute a useful timestamp field
hpcDataForDates$datetime <- strptime(paste(hpcDataForDates$Date,hpcDataForDates$Time), "%d/%m/%Y %H:%M")