library(shiny)
library(R6)

source("valueManager.R")

# Instantiate the manager outside the server function.
value_manager <- ValueManager$new()
