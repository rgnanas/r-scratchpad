library(tseries);
library(forecast);

#setwd as appropriate
setwd("F:/R Scripts/r-scratchpad")
 
inputstore = "./data/"
outputstore = "./forecasts/"

datafiles = list.files(inputstore)

for (file in datafiles) {
	print(file)
	data <- read.csv(paste(inputstore,file, sep=""))
	close_prices = data[,7]

	arima.final <- Arima(close_prices, order=c(2,1,2))
	# using confidence interval 95
	results <- forecast(arima.final, level=c(95), h=3)

	# intent of magic code below - file name is Ticker.index.csv. 
	# Extract ticker part alone and use as rowname
	strings <- strsplit(file, "\\.")
	ticker <- unlist(strings[1])[1]
	write.table(ticker, file="./forecasts/results-95.csv", col.names=F, row.names=F, append=TRUE)
	write.table(results, file = "./forecasts/results-95.csv",col.names=FALSE, row.names=F, na="", append=TRUE)
}


	