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

  ###### display a network result
  output$mynetworkid <- renderVisNetwork({
    # minimal example
    nnodes <- 40
    nnedges <- 100

    nodes <- data.frame(id = 1:nnodes,
                        label = paste("Label", 1:nnodes),
                        group = sample(LETTERS[1:3], nnodes, replace = TRUE), value = 1:nnodes,
                        title = paste0("<p>", 1:nnodes,"<br>Tooltip !</p>"), stringsAsFactors = FALSE)

    edges <- data.frame(from = sample(1:nnodes, nnedges, replace = T),
                        to = sample(1:nnodes, nnedges, replace = T),
                        value = rnorm(nnedges, 10), label = paste("Edge", 1:nnedges),
                        title = paste0("<p>", 1:nnedges,"<br>Edge Tooltip !</p>"))

    visNetwork(nodes, edges)%>%
      visOptions(highlightNearest = TRUE) %>%
      visInteraction(dragNodes = T,
                     dragView = T,
                     zoomView = T) %>%
      visLayout(randomSeed = 123)
  })

}
