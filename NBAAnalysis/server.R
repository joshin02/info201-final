library(shiny)
library(tidyverse)

data <- read.csv("../nba-data/2000-20.csv")

data <- data %>%
  group_by(year) %>%
  mutate(avgAttempt = sum(X3PA) / nrow(data)) %>%
  mutate(avgMade = sum(X3P) / nrow(data)) %>%
  mutate(avgPercent = sum(X3P.) / nrow(data))


shinyServer(function(input, output) {
    output$bargraph <- renderPlot({
      
      ggplot(data) + 
        geom_line(aes_string(x = "year", y = input$yVar)) +
        labs(x = "Year", y = "Average", title = "Average 3 point attempts/made/percentage in the NBA")
      
    })
})
