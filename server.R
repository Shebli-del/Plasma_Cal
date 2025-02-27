library(shinythemes)

server <- function(input, output) {
  
  output$Risk <- reactive({  
    First <- ifelse(input$MGUS>=1.5,1,0)
    Second <- ifelse(input$IgG==T,0,1)
    Third <- ifelse(input$KLratio==T,1,0)
    Risk <- First+Second+Third
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
  
  output$Risk2 <- reactive({  
    First <- ifelse(input$M_spike>2,1,0)
    Second <- ifelse(input$BMx>20,1,0)
    Third <- ifelse(input$KLBlood>20,1,0)
    Risk2 <- First+Second+Third
  })
  
  output$Sum2 <- reactive ({
    First <- ifelse(input$M_spike>2,1,0)
    Second <- ifelse(input$BMx>20,1,0)
    Third <- ifelse(input$KLBlood>20,1,0)
    total <- First+Second+Third
    Sum <- ifelse(
      total==0,
      "Time to progression is 110 months per revised Mayo criteria",
      ifelse(total==1,
             "Time to progression is 68 months per revised Mayo criteria",
             ifelse (total==2,
                     "Time to progression is 29 months per revised Mayo criteria",
                     ifelse(total==3,
                            "Time to progression is 29 months per revised Mayo criteria",))))
  })
}