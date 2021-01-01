#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
data(mtcars)
mtcars$cyl <- as.factor(mtcars$cyl)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    output$range <- renderPrint({ input$slider1 })

    filtered.mtcars <- reactive({
        min <- input$slider1[1]
        max <- input$slider1[2]
        mtcars[mtcars$wt >= min & mtcars$wt <= max, ]
    })
    
    output$mydate <- renderText({format(Sys.time(), "%a %b %d %X %Y") })
    
    output$mpgPlot <- renderPlot({
        p <- ggplot(data=filtered.mtcars(), aes(x=wt, y=mpg, color=cyl)) + geom_point() + geom_smooth(method="auto", se=TRUE, fullrange=FALSE, level=0.9)
        p <- p + title(xlab="Weight(tons)", ylab="MPG")
        p
    })

})
