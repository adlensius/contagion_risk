library(moments)

# Read Data
data_ts1 <- read_excel("C:/Users/a.djunaedi19/Downloads/CLEANED S&P500 vs FTSE100.xlsx")
data_ts2 <- read_excel("C:/Users/a.djunaedi19/Downloads/CLEANED S&P500 vs NI225.xlsx")

# convert column to date class
data_ts1$Date <- as.Date(data_ts1$Date)
data_ts2$Date <- as.Date(data_ts2$Date)

# Convert to xts time series
sp1 <- xts(data_ts1$SP, data_ts1$Date) 
ftse1 <- xts(data_ts1$FTSE, data_ts1$Date)

sp2 <- xts(data_ts2$SP, data_ts2$Date) 
ni2 <- xts(data_ts2$NI, data_ts2$Date)

# Get summary statistics
# group 1
means1 <- c(mean(sp1), mean(ftse1))
sd1 <- c(sd(sp1), sd(ftse1))
skew1 <- c(skewness(sp1), skewness(ftse1))
kurt1 <-c(kurtosis(sp1), kurtosis(ftse1))

summary1 <- data.frame(index = c("S&P 500","FTSE 100"), 
                       Mean = means1, 
                       Standard_Deviation = sd1,
                       Skewness = skew1,
                       Kurtosis = kurt1)

# group 2
means2 <- c(mean(sp2), mean(ni2))
sd2 <- c(sd(sp2), sd(ni2))
skew2 <- c(skewness(sp2), skewness(ni2))
kurt2 <-c(kurtosis(sp2), kurtosis(ni2))

summary2 <- data.frame(index = c("S&P 500","NIKKEI 225"), 
                       Mean = means2, 
                       Standard_Deviation = sd2,
                       Skewness = skew2,
                       Kurtosis = kurt2)




