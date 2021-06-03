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

curry.effect <- data %>%
  group_by(year < 2009) %>% 
  mutate(shotsMade = sum(X3P)) %>% 
  mutate(shotsAttempted = sum(X3PA)) %>% 
  mutate(shotPercentage = shotsMade / shotsAttempted) %>% 
  ungroup() %>% 
  select(shotsMade, shotsAttempted, shotPercentage) %>% 
  unique() %>% 
  mutate(curry = c("before", "after"))

shinyServer(function(input, output) {
    output$linegraph <- renderPlot({
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
    
    filter <- reactive(
      curry.effect %>% 
        select(curry, input$type)
    )
    
    output$graphOne <- renderPlot({
      ggplot(filter(), aes_string(x = "curry", y = input$type)) +
        geom_bar(stat="identity", color = "#005459") +
        labs(x = "Before and After", y = "Made, Attempted, Percentage", title = "Before and After Stephen Curry joined the League")
    })
    
    output$graphTwoDesc <- renderText ({
      paste0("The bar graph attempts to show the effect Stephen Curry had on the evolution of the 3 point shot.
             Looking at the the total shots made and attempted, the data shows that once Steph joined the league,
             the amount of shots made and attempted almsot doubled. However, the shot percentage is very similar.
             Looking at the data, we can't safely assume/conclude that Steph Curry was the sole factor in why
             the usage of the 3 point shot has increased but it is a possibility. We can conclude that the shot 
             percentage has not drastically improved as some fans might have thought.")
    })
})
