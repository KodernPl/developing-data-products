library(shiny)
calcBMI <-function(height,weight) weight/((height/100)*(height/100))

shinyServer(
  
  function(input, output) {
    
    output$oheight <- renderPrint({input$height})
    output$oweight <- renderPrint({input$weight})
  
    output$oBMI <- renderText({input$goButton 
                               isolate( calcBMI(input$height,input$weight))
                               })
   
    output$oPara <- renderText({
      if( input$weight/((input$height/100)*(input$height/100))<18.5) 
      {
      "Underweight"
      } 
      
      else if( input$weight/((input$height/100)*(input$height/100))>=18.5 && input$weight/((input$height/100)*(input$height/100))<25) 
      {
        "Normal weight"
      }
      
      else if( input$weight/((input$height/100)*(input$height/100))>=25) 
      {
        "Overweight"
      } 
    
        })
    })