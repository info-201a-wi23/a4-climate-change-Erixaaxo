library("shiny")
library("dplyr")
library("plotly")
library("bslib")

climate_df <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

intro_tab <- tabPanel(
  "Introduction",
  fluidPage(
    includeMarkdown("introduction.Rmd")
  )
)

concl_tab <- tabPanel(
  "Conclusion",
  fluidPage(
    includeMarkdown("conclusion.Rmd")
  )
)

