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
}