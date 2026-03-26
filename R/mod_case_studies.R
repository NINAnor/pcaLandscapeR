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

    case_study<-sf::st_read("R/base_nuts/NUTS_RG_20M_2021_4326.shp")%>%dplyr::filter(NUTS_ID == "NO060" | NUTS_ID =="FRL" | NUTS_ID=="SK021")%>%select(NUTS_NAME)

    # map_caseStud<-leaflet(case_study)%>%
    #   addPolygons(color = "orange", weight = 3, smoothFactor = 0.5,
    #              opacity = 1.0, fillOpacity = .4)%>%
    #   addProviderTiles(providers$CartoDB.Positron)
    #
    # output$case_stud_map<-renderLeaflet(map_caseStud)
    output$case_stud_map<-renderLeaflet(mapview(case_study,legend = TRUE,
                                                layer.name = 'study areas')@map)

  })
}

## To be copied in the UI
# mod_case_studies_ui("case_studies_1")

## To be copied in the server
# mod_case_studies_server("case_studies_1")
