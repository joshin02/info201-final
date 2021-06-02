library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    # title
    titlePanel("3 Point Attempts/Percentage Through the Years"),

    # widgets
    tabsetPanel(
        tabPanel("1", fluid = T,
                 sidebarLayout(
                     sidebarPanel(
                         selectInput("yVar", label = "Type of Data",
                                     choices = list("Average 3 point made" = "avgMade",
                                                    "Average 3 point attempts" = "avgAttempt",
                                                    "Average 3 point percentage" = "avgPercent"),
                                     selected = "Average 3 point attempts"),
                         
                     ),
                     # show plot
                     mainPanel(
                         plotOutput("bargraph")
                     )  
                 )
        ),
        
        tabPanel("2", fluid = T)
        
    ),
    
   
))
