#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  ## trigger case study module
  mod_case_studies_server("case_studies")
  output$stud_descr<-renderText(stri_rand_lipsum(3))
}
