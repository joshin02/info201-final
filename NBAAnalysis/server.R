library(shiny)
library(tidyverse)

data <- read.csv("../nba-data/2000-20.csv")

shinyServer(function(input, output) {
    output$bargraph <- renderPlot({
    })
})
