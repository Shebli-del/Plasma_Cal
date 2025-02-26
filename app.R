#library(shiny)
library(shinythemes)
#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(theme = shinytheme("cerulean"),
                navbarPage(
                  "My first app",
                  tabPanel("MGUS calculator",
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("MGUS",
                        "M-spike (g/dL) in blood:",
                        min = 0,
                        max = 2.9,
                        value = 0,
                        step= 0.1),
            checkboxInput("IgG", "IgG", value = F),
            checkboxInput("KLratio", "K/L ratio is abnormal (<0.26-1.65>):",
                          value = F)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            tags$label(h3('Number of Risk factors:')), # title Text Box
           h1(textOutput("Risk")),
           tags$label(h3('Risk of progression to myeloma:')),
           h1(textOutput('Sum'))
        )
    ))    ,
    tabPanel("Smoldering Myeloma", "This panel is intentionally left blank"))
    )

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$Risk <- reactive({  
      First <- ifelse(input$MGUS>=1.5,1,0)
      Second <- ifelse(input$IgG==T,0,1)
      Third <- ifelse(input$KLratio==T,1,0)
      total <- First+Second+Third
    })
    output$Sum <- reactive ({
      First <- ifelse(input$MGUS>1.5,1,0)
      Second <- ifelse(input$IgG==T,0,1)
      Third <- ifelse(input$KLratio==T,1,0)
      total <- First+Second+Third
      Sum <- ifelse(
        total==0,
        "Risk of progression is 5% in 20 years",
        ifelse(total==1,
               "Risk of progression is 21% in 20 years",
               ifelse (total==2,
                       "Risk of progression is 35% in 20 years",
                       ifelse(total==3,
                              "Risk of progression is 58% in 20 years",))))
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
