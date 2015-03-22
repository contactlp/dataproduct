library(shiny)

# Define the overall UI
shinyUI(
    
    # Use a fluid Bootstrap layout
    fluidPage(
        
        # Give the page a title
        titlePanel("Find car with Your Specification with mpg "),
        
        # Generate a row with a sidebar
        sidebarLayout(
            
            # Define the sidebar with one input
            sidebarPanel(
                selectInput("cylinder", "Number of Cylinder:",
                            choices=c(3, 4, 5, 6,8)),
                numericInput(inputId="horsepower", label="HorsePower:",value=100, min = 46,max = 230),
                numericInput(inputId="weight", label="Weight:", value=4000, min=1600, max = 5140),
                selectInput("year", "Model Year:", choices=c(70,71,72,73,74,75,76,77,78
                                                             ,79,80,81)),
                hr(),               
                helpText("Auto-MPG data is collected from ics.uci.edu website")),
            
            # Create a spot for the barplot
            mainPanel(
               
                h5("You want following number of cylinder"),
                verbatimTextOutput("selection1"),
                h5("You want following number of horsepower"),
                verbatimTextOutput("selection2"),
                h5("You want weight of your car to following"),
                verbatimTextOutput("selection3"),
                h5("Car model you want is following"),
                verbatimTextOutput("selection4"),
                h4("Predicted Car MPG"),
                verbatimTextOutput("Prediction"),
                h5("My suggestion base upon linear model "),
                verbatimTextOutput("suggestion")
                )
            )
        )
    )
