
library(shiny)

# 
shinyServer(function(input, output) {
  outputResult=""
  
  targetdist=250
  x = c()
  y = c()
  output$trajPlot <- renderPlot({
     # draw the target
     plot(c(targetdist,targetdist), c(0,10), pch=20, col="black", ylim=c(0,600), xlim=c(0,300), xlab="", ylab="", type='o')
     x[1] = y[1] = 0
     vx = input$speed * cos(input$angle/57.295)
     vyi = input$speed * sin(input$angle/57.295)
       win = 0
       for (i in 1:300) {
      
        y[i + 1] = vyi * i  -  ( 9.8 /2 )* (i^2)
       x[i  + 1] = vx *i
       
       if (abs(y[i+1]) < 10 &&  abs((x[i + 1] - targetdist)) < 10) win = 1
       if (input$speed == 0) { x[i+1] = y[i+1] = 0}
       if(input$speed != 0) output$result <- renderText(outputResult)
       
       }
     outputResult = "Missed"
     if (win == 1) outputResult = "You Win!"
    
     if(input$speed != 0) output$result <- renderText(outputResult)
     
     
     lines(x,y, col="red", type='l')
   
  })
})
