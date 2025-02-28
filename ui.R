library(shinythemes)

ui <- fluidPage(theme = shinytheme("cerulean"),
                navbarPage(
                  "My first app",
                  
                  tabPanel("MGUS calculator",
                          " MGUS Mayo clinic PMID: 11856795, 15855274" ,
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
                               h1(textOutput('Sum')),
                             )
                           )
                          # below close tabpanel
                          )    ,
                  
                  
                  tabPanel("Smoldering Myeloma",
                           "Smoldering Myeloma Mayo clinic criteria 
                           (PMID 17942755 & 29895887)",
                           sidebarLayout(
                             sidebarPanel(
                               sliderInput("M_spike",
                                           "M-spike (g/dL) in blood:",
                                           min = 0,
                                           max = 6,
                                           value = 0,
                                           step= 0.1),
                               sliderInput("BMx",
                                           "Plasma cells percentage",
                                           min = 0,
                                           max = 100,
                                           value = 0,
                                           step= 1),
                               sliderInput("KLBlood",
                                           "Free light chain ratio K/L",
                                           min = 0,
                                           max = 100,
                                           value = 0,
                                           step= 1),
                               checkboxInput("del17p", "deletion 17p or trisomies", value = F),
                           ),
                           mainPanel(
                             tags$label(h3('Number of Risk factors:')), # title Text Box
                             h1(textOutput("Risk2")),
                             tags$head(tags$style("#Risk2{color: red;
                                 font-size: 40px;
                                 font-style: italic;
                                 }"))
                             tags$label(h3('Risk of progression to myeloma:')),
                             h1(textOutput('Sum2')),
                             tags$head(tags$style("#Sum2{color: red;
                                 font-size: 40px;
                                 font-style: italic;
                                 }")),
                             tags$label(h3('Risk of progression to myeloma counting for genetic mutations:')),
                             h1(textOutput('Sum3')),
                             tags$head(tags$style("#Sum3{color: red;
                                 font-size: 40px;
                                 font-style: italic;
                                 }"))
                           )
                  )
                  # below close tabpanel
                  )
                  
                  # below close nav panel
                )
                
# close fluid page
)