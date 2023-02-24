server <- function(input, output, session) {
  device_type <- reactiveVal()
  observe({
    device_type(shinybrowser::get_device())
    if (device_type() == "Mobile") {
      shinyjs::addClass("plot", "hidden")
      shinyjs::removeClass("slider", "hidden")
    }
  })
  
  observeEvent(input$bins, {
    value_manager$set_value(input$bins)
  }, ignoreInit = TRUE)
  
  output$distPlot <- renderPlot({
    req(device_type())
    current_slider_value <- value_manager$get_value()
    hist(rnorm(1000), current_slider_value)
  })
}
