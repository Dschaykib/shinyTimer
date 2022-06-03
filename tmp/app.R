#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyTimer)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            shiny::uiOutput("InputEasyTimer")
            #shinyTimer::countdownOutput("thisTimer", height = "30px"),
            #shinyTimer::countdownOutput("thisTimer2", height = "30px"),

        ),

        # Show a plot of the generated distribution
        mainPanel(
            shinyTimer::EasyTimerOutput("thisTimer3", height = "30px")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    # output$distPlot <- renderPlot({
    #     # generate bins based on input$bins from ui.R
    #     x    <- faithful[, 2]
    #     bins <- seq(min(x), max(x), length.out = input$bins + 1)
    #     # draw the histogram with the specified number of bins
    #     hist(x, breaks = bins, col = 'darkgray', border = 'white')
    # })

    output$InputEasyTimer <- shiny::renderUI({
        sliderInput("InputEasyTimer",
                    label = h3("seconds countdown"),
                    min = 0,
                    max = 100,
                    value = 50)
    })



    # output$thisTimer <- shinyTimer::renderCountdown({
    #     shinyTimer::countdown(15, format = "m")
    # })
    # output$thisTimer2 <- shinyTimer::renderCountdown({
    #     shinyTimer::countdown(30, format = "m")
    # })

    output$thisTimer3 <- shinyTimer::renderEasyTimer({
        shinyTimer::EasyTimer(seconds = input$InputEasyTimer)
    })
}

# Run the application
shinyApp(ui = ui, server = server)
