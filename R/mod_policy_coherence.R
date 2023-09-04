#' policy_coherence UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_policy_coherence_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' policy_coherence Server Functions
#'
#' @noRd 
mod_policy_coherence_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_policy_coherence_ui("policy_coherence_1")
    
## To be copied in the server
# mod_policy_coherence_server("policy_coherence_1")
