#Exploratory Data Analysis
#Our overall goal here is simply to examine how household energy usage varies over a 2-day 
#period in February, 2007. Your task is to reconstruct the following plots below, all of
#which were constructed using the base plotting system.

#11. First you will need to fork and clone the following GitHub repository:
#https://github.com/rdpeng/ExData_Plotting1

#2. For each plot you should:

#A. Construct the plot and save it to a PNG file with a width of 480 pixels and a height of
#480 pixels.

#B. Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding,
#check.namesode in plot1.R constructs the plot1.png plot. Your code file should include 
#code for reading the data so that the plot can be fully reproduced. You must also include
#the code that creates the PNG file.

#D. Add the PNG file and R code file to the top-level folder of your git repository 
#(no need for separate sub-folders)

#E. When you are finished with the assignment, push your git repository to GitHub so 
#that the GitHub version of your repository is up to date. 

#There should be four PNG
#files and four R code files, a total of eight files in the top-level folder of the repo.

#The four plots that you will need to construct are shown below.

	setwd("~/Coursera/Exploratory Data Ananalys")
	household_power_consumption <- read.csv("~/Coursera/Exploratory Data Ananalys/household_power_consumption.txt", sep=";")


#Viewing the data 
	dim( household_power_consumption)
	head(household_power_consumption)
	str (household_power_consumption)

#Full Data Set  
	household_power_consumption <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                                        nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

	household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")

#Subsetting 
	household_power_consumption <- subset(household_power_consumption, subset=Date >= "2007-02-01" & Date <= "2007-02-02")


#Date Conversion
	datetime <- paste(as.Date(household_power_consumption$Date), household_power_consumption$Time)
	household_power_consumption$Datetime <- as.POSIXct(datetime)


#Plot 3
	with(household_power_consumption, {
  	plot(Sub_metering_1~Datetime, type="l",
     	ylab="Global Active Power (kilowatts)", xlab="")
  	lines(Sub_metering_2~Datetime,col='Red')
  	lines(Sub_metering_3~Datetime,col='Green')
	})
	legend("topright", col=c("black", "green", "red"), lty=1, lwd=2, 
      legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# Saving to file
	dev.copy(png, file="plot3.png", height=480, width=480)
	dev.off()  