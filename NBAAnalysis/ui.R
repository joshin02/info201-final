library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    # title
    titlePanel("3 Point Attempts/Percentage Through the Years"),

    # widgets
    sidebarLayout(
        sidebarPanel(
            
        ),
        # show plot
        mainPanel(
            plotOutput("bargraph")
        )
    )
))
