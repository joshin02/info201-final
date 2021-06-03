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
    
    output$sumGraph <- renderText ({
      paste0("The line graph above attempts to answer the question regarding if NBA players are shooting 
             and making more 3 pointers over the years. Looking at the average 3 point attempts and 3 point made, 
             we can see that there is a similar upward trend for both variables. While there are noticeable dips
             like in year 2011 and 2019, it is safe to say that NBA players over the year are shooting and making
             more 3 pointers. Furthermore, looking at the average 3 point percentage, there are a lot of dips and spikes,
             indicating that while players are shooting and making more shots, it doesn't necessarily indicate that
             they are getting better and more efficient at shooting 3 pointers.")
      
    })
})
