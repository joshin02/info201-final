library(shiny)
library(tidyverse)

data <- read.csv("../nba-data/2000-20.csv")

nba <- data %>%
  group_by(year) %>%
  mutate(avgAttempt = sum(X3PA) / nrow(data)) %>%
  mutate(avgMade = sum(X3P) / nrow(data)) %>%
  mutate(avgPercent = avgMade / avgAttempt) %>% 
  select(year, avgAttempt, avgMade, avgPercent) %>% 
  unique()


shinyServer(function(input, output) {
    output$bargraph <- renderPlot({
      ggplot(nba, aes_string(x = "year", y = input$yVar)) + 
        geom_line(color = "#17408b", size = 1.5) +
        geom_point(color = "#17408b", size = 4) +
        scale_x_continuous(breaks = seq(2000, 2020, by = 1)) +
        theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
              panel.background = element_blank(), axis.line = element_line(colour = "black")) +
        labs(x = "Year", y = "Average", title = "Average 3 point attempts/made/percentage in the NBA")
    })
})
