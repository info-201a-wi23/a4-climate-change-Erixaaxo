library("ggplot2")
library("plotly")
library("dplyr")
library("bslib")
library("markdown")

CO2_df <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv", stringsAsFactors =  FALSE)

server <- function(input, output) {
  output$lineplot <- renderPlotly({
    CO2_df <- CO2_df %>% filter(country %in% input$cat_user)
    CO2_df <- CO2_df %>% filter( year >= input$scale[1])
    CO2_df <- CO2_df %>% filter(year <= input$scale[2])
  lineplot <- ggplot(data = CO2_df) +
    geom_line(mapping = aes(x = year, y= cumulative_co2, color = country)) +
    
    labs(
      title = "Countries with cumlative CO2 usage throughout the years",
      x = "Year",
      y = "Cumlative Usage")
    
  })
}
# which country has the highest and lowest CO2 cumulative

least_CO2 <- CO2_df %>% group_by(country) %>% summarise("totalCO" = sum(cumulative_co2)) %>%top_n(-1) %>% pull(country)
most_CO2 <- CO2_df %>% group_by(country) %>% summarise("totalCO" = sum(cumulative_co2)) %>% top_n(1) %>% pull(country)

# average CO2
average_co2 <- CO2_df %>% group_by(country) %>% summarise("average" = mean(total_co2)) %>% pull(average)


