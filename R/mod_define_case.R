#' case_studies UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_def_case_ui <- function(id){
  ns <- NS(id)
  tagList(
    h4("1. Project setup"),
    br(),
    h5("Here you can define a project for the PAREUS workflow. This will establish a folder structure for the files produced through the workflow."),
    br(),
    textInput(ns("proj_name"),"Enter a project name without whitespace"),
    actionButton(ns("create_folder"),"create")
    # verbatimTextOutput("status"),
    # fluidRow(column(6, offset = 3,
    #                 fileInput("shp", label = "Input Shapfile (.shp,.dbf,.sbn,.sbx,.shx,.prj)",
    #                           width = "100%",
    #                           accept = c(".shp",".dbf",".sbn",".sbx",".shx",".prj"), multiple=TRUE))),
    #
    # br(),
    # fluidRow(column(8, offset = 2,
    #                 p("input$shp$datapath" , style = "font-weight: bold"),
    #                 verbatimTextOutput("shp_location", placeholder = T))),
    #
    # br(),
    # fluidRow(column(8, offset = 2,
    #                 p("input$shp$name" , style = "font-weight: bold"),
    #                 verbatimTextOutput("shp_name", placeholder = T)))
  )
}

#' case_studies Server Functions
#'
#' @noRd
mod_def_case_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    observeEvent(input$create_folder,{
      if(!is.null(input$proj_name)){
        dir.create(paste0("C:/Users/reto.spielhofer/OneDrive - NINA/Documents/Projects/PAREUS/project_folder_shiny/",input$proj_name,"_",Sys.Date()))
      }
    })


    # either upload shp

    # Read-in shapefile function
    # Read_Shapefile <- function(shp_path) {
    #   infiles <- shp_path$datapath # get the location of files
    #   dir <- unique(dirname(infiles)) # get the directory
    #   outfiles <- file.path(dir, shp_path$name) # create new path name
    #   name <- strsplit(shp_path$name[1], "\\.")[[1]][1] # strip name
    #   purrr::walk2(infiles, outfiles, ~file.rename(.x, .y)) # rename files
    #   x <- read_sf(file.path(dir, paste0(name, ".shp"))) # read-in shapefile
    #   return(x)
    # }

    # Read-shapefile once user submits files
    # observeEvent(input$shp, {
    #   user_shp <- Read_Shapefile(input$shp)
    #   plot(user_shp) # plot to R console
    #
    #
    #   # Print original file path location and file name to UI
    #   output$shp_location <- renderPrint({
    #     full_path <- strsplit(input$shp$datapath," ")
    #     purrr::walk(full_path, ~cat(.x, "\n"))
    #   })
    #
    #   output$shp_name <- renderPrint({
    #     name_split <- strsplit(input$shp$name," ")
    #     purrr::walk(name_split, ~cat(.x, "\n"))
    #   })
    # })

    # or selection on map



  })
}

## To be copied in the UI
# mod_case_studies_ui("case_studies_1")

## To be copied in the server
# mod_case_studies_server("case_studies_1")
