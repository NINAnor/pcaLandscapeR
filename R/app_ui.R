#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinydashboard
#' @import shinydashboardPlus
#' @import sf
#' @import leaflet
#' @import mapview
#' @import visNetwork
#' @import stringi
#' @import shinyFiles
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    dashboardPage(
      header =  dashboardHeader(title = div(img(src="www/pareus_logo.PNG", width ='120'), "")),
      sidebar = dashboardSidebar(minified = F, disable = T),
      body = dashboardBody(
        fluidRow(
          box(title = "PAREUS description",
              htmlOutput("stud_descr"),
              status = "primary",
              solidHeader = TRUE,
              collapsible = TRUE,
              width = 12),
          box(title = "Study sites",
              status = "primary",
              solidHeader = TRUE,
              collapsible = TRUE,
              mod_case_studies_ui("case_studies"),
              collapsed = TRUE,
              width = 12)
          ),
        fluidRow(box(title = "PAREUS Activities",
                     solidHeader = TRUE,
                     collapsible = TRUE,
                     box(
                       title = "WP1 Co-creating transformative PCA landscapes",
                       htmlOutput("wp1_descr"),
                       status = "success",
                       solidHeader = TRUE,
                       collapsible = TRUE,
                       collapsed = TRUE,
                       width = 12
                     ),
                     width = 12,
                     box(
                       title = "WP2 Mapping and accounting of socio-ecological PCA landscapes",
                       htmlOutput("wp2_descr"),
                       status = "success",
                       solidHeader = TRUE,
                       collapsible = TRUE,
                       collapsed = TRUE,
                       width = 12
                     ),
                     box(
                       title = "WP3 Policy coherence",
                       htmlOutput("wp3_descr"),
                       status = "success",
                       solidHeader = TRUE,
                       collapsible = TRUE,
                       collapsed = FALSE,
                       width = 12,
                       visNetworkOutput("mynetworkid")
                     ),
                     box(
                       title = "WP4 Developing teh geoprospective PCA landscape tool",
                       htmlOutput("wp4_descr"),
                       status = "success",
                       solidHeader = TRUE,
                       collapsible = TRUE,
                       collapsed = TRUE,
                       width = 12
                     ))),
        fluidRow(
          box(
            title = "The PAREUS workflow - toolbox",
            status = "primary",
            solidHeader = TRUE,
            collapsible = TRUE,
            tabsetPanel(
            # The id lets us use input$tabset1 on the server to find the current tab
            id = "tabset1",
            type = "pills",

            tabPanel("1. Define and modify your case study area",
                     "First you need to define a case study area. You can do this in the Geoprospective tool. In addition, this tool must be used to modify the status of the participatory mapping of landscape values.",
                     mod_def_case_ui("case_studies"),
                     actionButton("up_data","open tool")),
            tabPanel("2. Map socio-ecological landscape values",
                     "For your study area you can do an environment accounting",
                     actionButton("env_acc","Env. accounting"),
                     br(),
                     "In addition you can enter the Geoprospective tool to map ecosystem services in a participatory manner.",
                     actionButton("geopros","open Geoprospective")),
            tabPanel("3. Upload policy coherence",
                     "Upload your policy coherence matrix for your study area",
                     actionButton("up_policy","open tool")),
            tabPanel("4. Optimal siting of PA / OECM",
                     "Calculate an optimal siting of PA / OECM to reach the 30x30 target. To perform this task, you need to generate all the input data for your study area.",
                     actionButton("go_siting","open tool"))
          ),
          width = 12)
        )
      ),
      controlbar = dashboardControlbar(),
      # title = "PCA landscape toolbox"
    )

  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "pcaLandscapeR"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
