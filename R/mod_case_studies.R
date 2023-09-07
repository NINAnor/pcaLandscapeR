#' case_studies UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_case_studies_ui <- function(id){
  ns <- NS(id)
  tagList(
    h4("PAREUS case study areas"),
    br(),
    leafletOutput(ns("case_stud_map"))
  )
}

#' case_studies Server Functions
#'
#' @noRd
mod_case_studies_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    case_study<-sf::st_read("R/base_nuts/case_stud.shp")%>%dplyr::filter(NUTS_ID == "NO060" | NUTS_ID =="FRI12" | NUTS_ID=="SK010")

    map_caseStud<-leaflet(case_study)%>%
      addPolygons(color = "orange", weight = 3, smoothFactor = 0.5,
                 opacity = 1.0, fillOpacity = .4)%>%
      addProviderTiles(providers$CartoDB.Positron)

    output$case_stud_map<-renderLeaflet(map_caseStud)

  })
}

## To be copied in the UI
# mod_case_studies_ui("case_studies_1")

## To be copied in the server
# mod_case_studies_server("case_studies_1")
