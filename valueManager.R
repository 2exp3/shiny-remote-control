# Create a process-level (i.e. in global scope) reactive-value manager.
ValueManager <- R6::R6Class(
  classname = "ValueManager",
  public = list(
    initialize = function() {
      private$reactive_bins <- reactiveVal(30)
      private$reactive_col <- reactiveVal("white")
      private$reactive_names <- reactiveVal(c())
    },
    set_bins_value = function(value) {
      private$reactive_bins(value)
    },
    set_col_value = function(value) {
      private$reactive_col(value)
    },
    add_name = function(name) {
      private$reactive_names(c(private$reactive_names(), name))
    },
    set_target = function(name) {
      private$target <- name
    },
    get_bins_value = function() {
      private$reactive_bins()
    },
    get_col_value = function() {
      private$reactive_col()
    },
    get_names = function() {
      private$reactive_names()
    },
    get_target = function() {
      private$target
    }
  ),
  private = list(
    reactive_bins = NULL,
    reactive_col = NULL,
    reactive_names = NULL,
    target = ""
  )
)
