library(shiny)

# simple shiny projectile game
shinyUI(fluidPage(
  targetdist = 250, 
 
  # Application title
  titlePanel("Hit the Target!"),

  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("angle",
                  "Cannon Angle:",
                  min = 0,  
                  max = 90,
                  value = 0),
 	    sliderInput("speed",
                  "Speed:",
                  min = 0,
                  max = 100,
                  value = 0)
   
    ),
  #),
    # Show a plot result
    mainPanel(
      h3(textOutput("result")),
      plotOutput("trajPlot")
  
    )
)
))
