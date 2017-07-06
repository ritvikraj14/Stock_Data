# Reading dataset of all the stock files using read_csv()
  IBM <- read.csv("~/Documents/Dataset_Explanation/Stock_Data/IBM.csv")
  GE <- read.csv("~/Documents/Dataset_Explanation/Stock_Data/GE.csv")
  Boeing <- read.csv("~/Documents/Dataset_Explanation/Stock_Data/Boeing.csv")
  CocaCola <- read.csv("~/Documents/Dataset_Explanation/Stock_Data/CocaCola.csv")
  ProcterGamble <- read.csv("~/Documents/Dataset_Explanation/Stock_Data/ProcterGamble.csv")

# Use View to view all the dataset
  View(IBM)
  View(GE)
  View(Boeing)
  View(CocaCola)
  View(ProcterGamble)

# Use str to look at the structure of the data. The date column is stored as factor.   
  str(IBM)
  str(GE)
  str(Boeing)
  str(CocaCola)
  str(ProcterGamble)

# Converting the date column to object in R 
  IBM$Date = as.Date(IBM$Date, "%m/%d/%y")
  GE$Date = as.Date(GE$Date, "%m/%d/%y")
  CocaCola$Date = as.Date(CocaCola$Date, "%m/%d/%y")
  ProcterGamble$Date = as.Date(ProcterGamble$Date, "%m/%d/%y")
  Boeing$Date = as.Date(Boeing$Date, "%m/%d/%y")

# there are 480 observations in each data set. We can find this using str().
# Also this is monthly data of 40 years. so total observation = 12*40 = 480

# mean of stock price of IBM, earliest and latest year in our data set is 1970. use summary() to find this
  summary(IBM)  

# minimum stock price of GE
  summary(GE)

# maximum stock price of Coca-Cola
  summary(CocaCola)

# median value of the Boeing StockPrice
  summary(Boeing)

# standard deviation of the stock price of Procter & Gamble
  sd(ProcterGamble$StockPrice)  

# Plot CocaCola stock price for the last 40 years and get its highest and lowest stock value 
  plot(CocaCola$Date, CocaCola$StockPrice, type="l")    

# Plotting cocaCola dna ProcterGamble stock price against Date on the same plot
  plot(CocaCola$Date, CocaCola$StockPrice, type="l", col="red")
  lines(ProcterGamble$Date, ProcterGamble$StockPrice, col="blue")

# As an alternative choice to changing the colors, you could instead change the line type of the Procter & Gamble line by adding the argument lty=2

# Draw vericle line at a particular date and make line thicker by adding lwd
  abline(v=as.Date(c("2000-03-01")), lwd=2)  

# Around 1983, the stock for Coca-Cola was going up while for Procter and Gamble was going down

# Looking at how the stock prices changed from 1995-2005 for all five companies
  plot(CocaCola$Date[301:432], CocaCola$StockPrice[301:432], type="l", col="red", ylim=c(0,210))
  lines(ProcterGamble$Date[301:432], ProcterGamble$StockPrice[301:432], col="blue")
  lines(IBM$Date[301:432], IBM$StockPrice[301:432], col="green")
  lines(GE$Date[301:432], GE$StockPrice[301:432], col="purple")
  lines(Boeing$Date[301:432], Boeing$StockPrice[301:432], col="orange")

# Alternatively, lty=2 will make the line dashed, lty=3 will make the line dotted, lty=4 will make the line alternate between dashes and dots, and lty=5 will make the line long-dashed  

# IBM reaches the highest value in the period of 1995 to 2005

# which companies saw a decreasing trend in their stock price from September 1997 to November 1997
  abline(v=as.Date(c("1997-09-01")), lwd=2)
  abline(v=as.Date(c("1997-11-01")), lwd=2)

# average stock price of IBM 
  mean(IBM$StockPrice)  

# Use the tapply command to calculate the mean stock price of IBM, sorted by months
  tapply(IBM$StockPrice, months(IBM$Date), mean)  

# Check the month which has the highest average for GE and Coca-Cola
  tapply(GE$StockPrice, months(GE$Date), mean)  
  tapply(CocaCola$StockPrice, months(CocaCola$Date), mean)

# In which month are the stock prices lower between January and December
  tapply(IBM$StockPrice, months(IBM$Date), mean)  

# Having lower stock prices in December is a trend that holds for all five companies

# After seeing these trends, we are ready to buy stock in certain months and sell it in others! But, we should be careful, because one really good or really bad year could skew the average to show a trend that is not really there in general.
