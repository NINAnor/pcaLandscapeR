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
  # output$stud_descr<-renderText(stri_rand_lipsum(3))
  output$stud_descr<-renderText({

    paste0("<b>Providing Adaptive knowledge for Ratcheting up the EU Biodiversity strategy for Sustainable landscapes and protected areas","</b><br>",
           "<li>Many places, anthropogenic land‐use changes have caused declines in biodiversity, ecosystems and their services. Current networks of legally protected areas is not sufficiently large to safeguard biodiversity</li>",
           "<li>The 30x30 target of the EU Biodiversity Strategy for 2030 is a commitment to protect at least 30% of land and sea for nature by 2030.</li>",
           "<li>This requires transformative change in the use of land, and upscaling of ecosystem restoration, to combat land degradation, protect biodiversity and ecosystem services, and ensure human well‐being.</li>",
           "<li>These outcomes are unlikely to be achieved effectively within protected area networks alone, but need regime shifts in the social and policy context of landscape management.</li>",
           "<li>A coherent network of protected areas needs to be complemented with Other Effective area-based Conservation Measures (OECMs) to ensure that biodiversity goals are aligned with local values, needs and governance, including sustainable value creation and business development.</li>",
           "<li>Biodiversity-negative outcomes can only be mitigated through synergistic ‘land sparing’ surrounded by favourable ‘land sharing’ approaches.</li>",
           "<b>Main objectives","</b><br>",
           "The overarching aim of PAREUS is to perform a spatially explicit cross-country assessment of existing land-use planning and conservation practices for identifying improvements needed for reaching the EU BDS2030 targets. Specifically, PAREUS will apply an innovative landscape approach to integrate policy and practice for multiple land uses to ensure equitable and sustainable use of land within a spatially explicit framework and in close collaboration with stakeholders from multiple sectors to ensure the co-creation of knowledge.")
  })

  output$wp1_descr<-renderText({
    "Co-creating transformative PCA landscapes"
  })

  output$wp2_descr<-renderText({
    "Map and account the social-ecological landscape to evaluate the current state of the PA network in the study areas"
  })

  output$wp3_descr<-renderText({
    "Assess the policy landscape to identify opportunities and hindrances of existing legislative and policy documents for PA in the study areas"
  })

  output$wp4_descr<-renderText({
    "Develop an inclusive and integrated geoprospective tool to adaptively visualize and design coherent networks of PA and OECM"
  })




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
