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
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    dashboardPage(
      header =  dashboardHeader(title = "PCA landscape toolbox"),
      sidebar = dashboardSidebar(minified = F, disable = T),
      body = dashboardBody(
        fluidRow(
          box(title = "Study description",
              textOutput("stud_descr"),
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
        fluidRow(box(title = "PAREUS Results",
                     solidHeader = TRUE,
                     collapsible = TRUE,
                     box(
                       title = "WP1 Co-creating transformative PCA landscapes",
                       status = "success",
                       solidHeader = TRUE,
                       collapsible = TRUE,
                       collapsed = TRUE,
                       width = 12
                     ),
                     width = 12,
                     box(
                       title = "WP2 Mapping and accounting of socio-ecological PCA landscapes",
                       status = "success",
                       solidHeader = TRUE,
                       collapsible = TRUE,
                       collapsed = TRUE,
                       width = 12
                     ),
                     box(
                       title = "WP3 Policy coherence",
                       status = "success",
                       solidHeader = TRUE,
                       collapsible = TRUE,
                       collapsed = FALSE,
                       width = 12,
                       visNetworkOutput("mynetworkid")
                     ),
                     box(
                       title = "WP5 Synthesizing PCA landscapes for sustainability",
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

            tabPanel("1. Upload your study area",
                     "This tool allows you to provide your own region of interest",
                     mod_def_case_ui("case_studies"),
                     actionButton("up_data","open tool")),
            tabPanel("2. Map socio-ecological landscape values",
                     "Perform an environmental accounting and a mapping of landscape values",
                     actionButton("env_acc","open tool")),
            tabPanel("3. Upload policy coherence",
                     "Upload your policy coherence matrix for your study area",
                     actionButton("up_policy","open tool")),
            tabPanel("4. Optimal siting of PA / OECM",
                     "Where and how should the PA / OECM be sited to reach the 30x30 target?",
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
