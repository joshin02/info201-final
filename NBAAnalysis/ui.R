library(shiny)
library(shinythemes)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    navbarPage("NBA 3-Point Analysis", collapsible = TRUE, inverse = TRUE, theme = shinytheme("cosmo"),
               tabPanel("Home",
                        includeHTML("../home.html"),
                        includeCSS("../home.css")
               ),
               tabPanel("Analysis",
                        # title
                        titlePanel("NBA 3-Point Success Throughout the Years"),
                        # widgets
                        tabsetPanel(
                            tabPanel("3PT Shot Average Stats", fluid = T,
                                     sidebarLayout(
                                         sidebarPanel(
                                             selectInput("yVar", label = "Type of Data",
                                                         choices = list("Average 3 point made" = "avgMade",
                                                                        "Average 3 point attempts" = "avgAttempt",
                                                                        "Average 3 point percentage" = "avgPercent"),
                                                         selected = "Average 3 point attempts")
                                         ),
                                         # show plot
                                         mainPanel(
                                             plotOutput("linegraph"),
                                             textOutput("sumGraph")
                                         )  
                                     )
                            ),
                            tabPanel("Bar Graph", fluid = T,
                                     sidebarLayout(
                                         sidebarPanel(
                                             radioButtons("type", label = "Select Stat", 
                                                          choices = list("Shots Made" = "shotsMade",
                                                                         "Shots Attempted" = "shotsAttempted",
                                                                         "Shot Percentage" = "shotPercentage"))
                                         ),
                                         mainPanel(
                                             plotOutput("graphOne"),
                                             textOutput("graphTwoDesc")
                                         )
                                     )
                            )
                        )
                )
    )
))
