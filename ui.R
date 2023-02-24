ui <- fluidPage(
  shinyjs::useShinyjs(),
  shinybrowser::detect(),
  tags$link(rel = "stylesheet", type = "text/css", href = "style.css"),
  titlePanel("Shiny Remote Control"),
  sidebarLayout(
    div(
      id = "slider",
      class = "hidden",
      sidebarPanel(
        sliderInput(
          "bins",
          "Number of bins:",
          min = 1,
          max = 50,
          value = 30
        )
      )
    ),
    div(
      id = "plot",
      mainPanel(
        plotOutput("distPlot")
      )
    )
  )
)
