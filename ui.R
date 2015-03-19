shinyUI(pageWithSidebar(
  
  headerPanel("Shiny Application: Body Mass Index calculator"),
  
  sidebarPanel(
    sliderInput('height', 'Enter your Height [cm]',value = 170, min = 30, max = 230, step = 1,),
    sliderInput('weight', 'Enter your Weight [kg]',value = 70, min = 30, max = 180, step = 1,),
    actionButton("goButton","Calculate")

  ),
  
  mainPanel(
    h5('Your Height [cm]'),
    verbatimTextOutput("oheight"),
    h5('Your Weight [kg]'),
    verbatimTextOutput("oweight"),
    h5('BMI'),
    verbatimTextOutput("oBMI"),
    h5('Diagnose:'),
    verbatimTextOutput("oPara"),
    plotOutput("distPlot")
   
  )
))
