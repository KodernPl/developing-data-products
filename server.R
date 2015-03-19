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
    output$distPlot <- renderPlot({
    height <- seq(100,230, length.out=100)
    weight <- seq(40,150, length.out=100)
    wtht <- expand.grid(x=height, y=weight)
  
    bmiwtht <- matrix(calcBMI(wtht$x,wtht$y),length(height),length(weight))
    
    
    contour(height,weight,bmiwtht,levels = c(18.5,25), drawlabels=FALSE,
            xlab="Height (cm)",ylab="Weight (kg)",
            main="BMI categories by height and weight")
    
    text(175,95,"Overweight",cex=2,srt=40)
    text(185,75,"Normal",cex=2,srt=35)
    text(195,55,"Underweight",cex=2,srt=38)
    text(input$height,input$weight,"YOU",cex=1,srt=35,col="Red")
})
    })