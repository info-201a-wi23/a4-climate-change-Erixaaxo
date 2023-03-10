library(shiny)
install.packages("bslib") 
source("ui.R")
source("server.R")
library(rsconnect)
library("bslib")
library("markdown")

shinyApp(ui = ui, server = server)
