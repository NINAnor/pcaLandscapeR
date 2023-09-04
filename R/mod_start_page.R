#' start_page UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_start_page_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' start_page Server Functions
#'
#' @noRd 
mod_start_page_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_start_page_ui("start_page_1")
    
## To be copied in the server
# mod_start_page_server("start_page_1")
