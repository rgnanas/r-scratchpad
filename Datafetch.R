library(quantmod);

#setwd as appropriate
setwd("F:/R Scripts/r-scratchpad")
tickers = readLines("tickers.txt")

for (name in 1:length(tickers)) {
	print(tickers[name]) 
	path = "F:/R Scripts/data/"
	try (data <- getSymbols(tickers[name], from='2015-01-01', to='2017-04-24', auto.assign = FALSE))
	if(!is.null(data)) {
		try(write.zoo(data, paste(path, tickers[name],".csv"),index.name="Date",sep=","))
	}
}