#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Shiny project with mtcars dataset"),
    
    p(textOutput("mydate")),

    sliderInput("slider1", label = h3("Weight(tons) Range"), min = 1, 
                        max = 6, step=0.25, width='60%', value = c(1, 6)),
    hr(),
    
    verbatimTextOutput("range"),
    
    # Show a plot of the generated distribution
    mainPanel(
        plotOutput("mpgPlot")
    )
    )
)
