NBAdata <- read.csv("nba-data/2000.csv")
NBAdata1 <- read.csv("nba-data/2001.csv")
NBAdata2 <- read.csv("nba-data/2002.csv")
NBAdata3 <- read.csv("nba-data/2003.csv")
NBAdata4 <- read.csv("nba-data/2004.csv")
NBAdata5 <- read.csv("nba-data/2005.csv")
NBAdata6 <- read.csv("nba-data/2006.csv")
NBAdata7 <- read.csv("nba-data/2007.csv")
NBAdata8 <- read.csv("nba-data/2008.csv")
NBAdata9 <- read.csv("nba-data/2009.csv")
NBAdata10 <- read.csv("nba-data/2010.csv")
NBAdata11 <- read.csv("nba-data/2011.csv")
NBAdata12 <- read.csv("nba-data/2012.csv")
NBAdata13 <- read.csv("nba-data/2013.csv")
NBAdata14 <- read.csv("nba-data/2014.csv")
NBAdata15 <- read.csv("nba-data/2015.csv")
NBAdata16 <- read.csv("nba-data/2016.csv")
NBAdata17 <- read.csv("nba-data/2017.csv")
NBAdata18 <- read.csv("nba-data/2018.csv")
NBAdata19 <- read.csv("nba-data/2019.csv")
NBAdata20 <- read.csv("nba-data/2020.csv")

CleanNBAdata <- function(data, selectedYear, output){
  data%>%
    mutate(year=selectedYear)%>%
    select(Player, Pos, X3P, X3PA, X3P., year)
  write.csv(data, output)
}


CleanNBAdata(NBAdata, "2000", "~/Info201/info201-final/nba-data/2000.csv")




  