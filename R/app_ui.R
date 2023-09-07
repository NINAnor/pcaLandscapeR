#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinydashboard
#' @import shinydashboardPlus
#' @import sf
#' @import leaflet
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    dashboardPage(
      header = dashboardHeader(title = "PCA landscape toolbox"),
      sidebar = dashboardSidebar(disable = TRUE),
      body = dashboardBody(
        fluidRow(
          box(title = "Study description",
              status = "primary",
              solidHeader = TRUE,
              collapsible = TRUE,
              width = 12)),
        fluidRow(
          box(title = "Toolbox",
              status = "primary",
              solidHeader = TRUE,
              collapsible = TRUE),
          box(title = "Study sites",
              status = "primary",
              solidHeader = TRUE,
              collapsible = TRUE,
                mod_case_studies_ui("case_studies"))
        ),
        fluidRow(box(title = "Results",
                     status = "success",
                     solidHeader = TRUE,
                     collapsible = TRUE,
                     width = 12)),
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
