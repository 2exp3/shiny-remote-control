library(R6)

# Create a process-level (i.e. in global scope) reactive-value manager.
ValueManager <- R6::R6Class(
  classname = "ValueManager",
  public = list(
    initialize = function() {
      private$reactive_inner_counter <- reactiveVal(30)
    },
    set_value = function(value) {
      private$reactive_inner_counter(value)
    },
    get_value = function() {
      private$reactive_inner_counter()
    }
  ),
  private = list(
    reactive_inner_counter = NULL
  )
)
