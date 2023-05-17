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
        selectizeInput(
          "target_name",
          "Current names",
          choices = NULL
        ),
        sliderInput(
          "bins",
          "Number of bins:",
          min = 1,
          max = 50,
          value = 30
        ),
        selectizeInput(
          "cols",
          "Color:",
          choices = c("white", "black", "blue", "yellow", "red", "green", "pink")
        ),
      )
    ),
    div(
      id = "plot",
      mainPanel(
        div(
          style = "display: flex; gap: 10px; align-items: center;",
          textInput("plotName", label = "Write your name", value = ""),
          div(style = "margin-top: 10px;", actionButton("setName", label = "OK", icon = icon("check")))
        ),
        plotOutput("distPlot")
      )
    )
  )
)
