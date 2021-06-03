library(tidyverse)

## read all the data
NBAdata <- read.csv("NBAAnalysis/nba-data/2000.csv")
NBAdata1 <- read.csv("NBAAnalysis/nba-data/2001.csv")
NBAdata2 <- read.csv("NBAAnalysis/nba-data/2002.csv")
NBAdata3 <- read.csv("NBAAnalysis/nba-data/2003.csv")
NBAdata4 <- read.csv("NBAAnalysis/nba-data/2004.csv")
NBAdata5 <- read.csv("NBAAnalysis/nba-data/2005.csv")
NBAdata6 <- read.csv("NBAAnalysis/nba-data/2006.csv")
NBAdata7 <- read.csv("NBAAnalysis/nba-data/2007.csv")
NBAdata8 <- read.csv("NBAAnalysis/nba-data/2008.csv")
NBAdata9 <- read.csv("NBAAnalysis/nba-data/2009.csv")
NBAdata10 <- read.csv("NBAAnalysis/nba-data/2010.csv")
NBAdata11 <- read.csv("NBAAnalysis/nba-data/2011.csv")
NBAdata12 <- read.csv("NBAAnalysis/nba-data/2012.csv")
NBAdata13 <- read.csv("NBAAnalysis/nba-data/2013.csv")
NBAdata14 <- read.csv("NBAAnalysis/nba-data/2014.csv")
NBAdata15 <- read.csv("NBAAnalysis/nba-data/2015.csv")
NBAdata16 <- read.csv("NBAAnalysis/nba-data/2016.csv")
NBAdata17 <- read.csv("NBAAnalysis/nba-data/2017.csv")
NBAdata18 <- read.csv("NBAAnalysis/nba-data/2018.csv")
NBAdata19 <- read.csv("NBAAnalysis/nba-data/2019.csv")
NBAdata20 <- read.csv("NBAAnalysis/nba-data/2020.csv")

## function to clean data and overwrite original data
CleanNBAdata <- function(data, selectedYear, output){
  clean1 <- data %>%
    mutate(year = selectedYear) %>%
    select(Player, Pos, X3P, X3PA, X3P., year)
  clean2 <- na.omit(clean1)
  write.csv(clean2, output, row.names = FALSE)
}

## calling function multiple times to clean data
CleanNBAdata(NBAdata, "2000", "NBAAnalysis/nba-data/2000.csv")
CleanNBAdata(NBAdata1, "2001", "NBAAnalysis/nba-data/2001.csv")
CleanNBAdata(NBAdata2, "2002", "NBAAnalysis/nba-data/2002.csv")
CleanNBAdata(NBAdata3, "2003", "NBAAnalysis/nba-data/2003.csv")
CleanNBAdata(NBAdata4, "2004", "NBAAnalysis/nba-data/2004.csv")
CleanNBAdata(NBAdata5, "2005", "NBAAnalysis/nba-data/2005.csv")
CleanNBAdata(NBAdata6, "2006", "NBAAnalysis/nba-data/2006.csv")
CleanNBAdata(NBAdata7, "2007", "NBAAnalysis/nba-data/2007.csv")
CleanNBAdata(NBAdata8, "2008", "NBAAnalysis/nba-data/2008.csv")
CleanNBAdata(NBAdata9, "2009", "NBAAnalysis/nba-data/2009.csv")
CleanNBAdata(NBAdata10, "2010", "NBAAnalysis/nba-data/2010.csv")
CleanNBAdata(NBAdata11, "2011", "NBAAnalysis/nba-data/2011.csv")
CleanNBAdata(NBAdata12, "2012", "NBAAnalysis/nba-data/2012.csv")
CleanNBAdata(NBAdata13, "2013", "NBAAnalysis/nba-data/2013.csv")
CleanNBAdata(NBAdata14, "2014", "NBAAnalysis/nba-data/2014.csv")
CleanNBAdata(NBAdata15, "2015", "NBAAnalysis/nba-data/2015.csv")
CleanNBAdata(NBAdata16, "2016", "NBAAnalysis/nba-data/2016.csv")
CleanNBAdata(NBAdata17, "2017", "NBAAnalysis/nba-data/2017.csv")
CleanNBAdata(NBAdata18, "2018", "NBAAnalysis/nba-data/2018.csv")
CleanNBAdata(NBAdata19, "2019", "NBAAnalysis/nba-data/2019.csv")
CleanNBAdata(NBAdata20, "2020", "NBAAnalysis/nba-data/2020.csv")

## function to merge all the data into one csv file
combine <- function(output) {
  combined <- bind_rows(NBAdata, NBAdata1, NBAdata2, NBAdata3, NBAdata4, NBAdata5, NBAdata6, NBAdata7, 
                        NBAdata8, NBAdata9, NBAdata10, NBAdata11, NBAdata12, NBAdata13, NBAdata14, 
                        NBAdata15, NBAdata16, NBAdata17, NBAdata18, NBAdata19, NBAdata20)
  write.csv(combined, output, row.names = FALSE)
}

combine("NBAAnalysis/nba-data/2000-20.csv")
  