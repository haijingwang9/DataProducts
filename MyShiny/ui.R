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
    
    h4("This application will plot mpg~weight for data in mtcars dataset. 
      The scatter plot is colored by number of cylinders. 
      For cars in a cylinder group, a regression line with confidence interval is also plotted."),
      
      
    h4("User can select range of vehicle weight (in tons), by changing slider, 
      both scatter plot and regression line will re-render 
      based on filtered data."),

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
