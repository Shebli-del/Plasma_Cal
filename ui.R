library(shinythemes)

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