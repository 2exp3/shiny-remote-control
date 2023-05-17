server <- function(input, output, session) {
  device_type <- reactiveVal()
  observe({
    device_type(shinybrowser::get_device())
    if (device_type() == "Mobile") {
      shinyjs::addClass("plot", "hidden")
      shinyjs::removeClass("slider", "hidden")
    }
  })

  # TV side ----
  observeEvent(input$setName, {
    req(input$plotName)
    value_manager$add_name(input$plotName)
    shinyjs::disable("setName")
  }, ignoreInit = TRUE)

  observeEvent(input$bins, {
    value_manager$set_bins_value(input$bins)
  }, ignoreInit = TRUE)

  observeEvent(input$cols, {
    value_manager$set_col_value(input$cols)
  }, ignoreInit = TRUE)

  hist_data <- rnorm(1000)
  output$distPlot <- renderPlot({
    req(device_type())
    current_slider_value <- value_manager$get_bins_value()
    current_color_value <- value_manager$get_col_value()

    if (!value_manager$get_target() == "") {
      req(input$plotName == value_manager$get_target(), cancelOutput = TRUE)
    }
    hist(hist_data, current_slider_value, col = current_color_value)
  })

  # Control side ----
  observe({
    req(device_type() == "Mobile")
    updateSelectizeInput(inputId = "target_name", choices = c("", value_manager$get_names()), selected = "")
  })

  observeEvent(input$target_name, {
    value_manager$set_target(input$target_name)
  }, ignoreInit = TRUE)
}
