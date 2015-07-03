
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
source("./R/f_cluster_Cart.R")
df_cart <- f_cluster_Cart("06.2015")
shinyUI(pageWithSidebar(
    headerPanel('Análise de cluster de carteira de cartões'),
    sidebarPanel(
        selectInput('xcol', 'Variável X', names(df_cart),
                    selected=names(df_cart)[[2]]),
        selectInput('ycol', 'Variável Y', names(df_cart),
                    selected=names(df_cart)[[4]]),
        numericInput('clusters', 'Contagem de Agrupamentos', 3,
                     min = 1, max = 9)
    ),
    mainPanel(
        plotOutput('plot1')
    )
))