library("shiny")
library("dplyr")
library("plotly")
library("bslib")
library("markdown")
library("ggplot2")

CO2_df <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv", stringsAsFactors =  FALSE)

intro_tab <- tabPanel(
  "Introduction",
  fluidPage(
    includeMarkdown("introduction.Rmd")
  )
)

bar_plot <- sidebarPanel(
  selectInput(
    inputId = "cat_user",
    label = "Countries",
    choices = unique(CO2_df$country),
    selected = "World",
    multiple = TRUE),

  sliderInput("scale", label = "Years", min = min(CO2_df$year), max = max(CO2_df$year), value = c(1800, 2021), sep = "", step = 20)
)

lineplot_main <- mainPanel(
  plotlyOutput(outputId = "lineplot")
)

vis_tab <- tabPanel(
  "Visualization",
  sidebarLayout(
    bar_plot, 
    lineplot_main)
)

concl_tab <- tabPanel(
  "Conclusion",
  fluidPage(
    includeMarkdown("conclusion.Rmd")
  )
)

ui <- navbarPage(
  "CO2 Emissions",
  intro_tab,
  vis_tab, 
  concl_tab
)
