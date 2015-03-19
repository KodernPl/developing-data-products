library(shiny)

shinyServer(
  function(input, output) {
    
    output$oheight <- renderPrint({input$height})
    output$oweight <- renderPrint({input$weight})
    output$oBMI <- renderPrint({input$weight/((input$height/100)*(input$height/100))})
    
   # if(renderText({input$weight/((input$height/100)*(input$height/100))})>0)
  #  {
  #    output$oparametr <- renderText({ "foo" })
      
  #  }
    #output$oparametr <- renderText({ "foo" })
    #output$oparametr <- renderText({ "foo" })
    
    
      })
  

  