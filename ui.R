library(shiny)

shinyUI(fluidPage(
  # Title Panel

  titlePanel(title = h2("Iris Dataset", align="center")),
  sidebarLayout(position = "right",
    # Sidebar panel with displaying the data, selecting bins for histogram and color changing
    sidebarPanel(
      # Widget 1: Checkbox Group 
      checkboxGroupInput("iris_LW",
                         label = "1. Select the variable(s) to display data", 
                         choices =c("Sepal.Length" = 1, 
                                    "Sepal.Width" = 2, 
                                    "Petal.Length" = 3, 
                                    "Petal.Width" = 4), 
                          selected = 1),
      br(),
      # Widget 2: Select the number of bins to display histogram
      sliderInput("bins", 
                  label = "Number of bins in histogram (approximate):", 
                  min = 5, max = 25, value = 15),
      br(), 
      # Widget 3: Changing colors 
      radioButtons("colors", 
                  label =  "3. Select the color of histogram", 
                  choices =c("Red", "Purple", "Yellow", "Grey"),
                  selected = "Red")

      ),
    # Main Panel
    mainPanel(
      code("For data, select as many variables you like and for plot, please select only one variable to display.", style = "color: gray"),
      br(),
      # Panel Tabset
      tabsetPanel(type="tab", 
                  tabPanel("Data", tableOutput("data")),
                  tabPanel("Plot", plotOutput("histogram"))

      )
      
    )
    
  
  ) 
)
)

