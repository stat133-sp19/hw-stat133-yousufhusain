#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(reshape2)
library(rsconnect)

ui <- fluidPage(
  
  titlePanel("Saving-Investing Modalities"),
  
  fluidRow(
    
    column(4,
           sliderInput("amount",
                       "Initial Amount",
                       pre = "$",
                       min = 1,
                       max = 100000,
                       value = 1000,
                       step = 500)),
    
    column(4,
           sliderInput("rate",
                       "Return Rate (in %)",
                       min = 0,
                       max = 20,
                       value = 5,
                       step = 0.1)),
    
    column(4,
           sliderInput("years",
                       "Years",
                       min = 0,
                       max = 50,
                       value = 10,
                       step = 1)),
    
    column(4,
           sliderInput("contribution",
                       "Annual Contribution",
                       pre = "$",
                       min = 0,
                       max = 50000,
                       value = 2000,
                       step = 500)),
    
    column(4,
           sliderInput("growth",
                       "Growth Rate (in %)",
                       min = 0,
                       max = 20,
                       value = 2,
                       step = 0.1)),
    
    column(4,
           selectInput("facet", "Facet?",
                       choices = c("No", "Yes")))),
  
  mainPanel(
    h4("Timelines"),
    plotOutput("Timelines", width = "160%"),
    h4("Balances"),
    verbatimTextOutput("Balances"))) 

server <- function(input, output) {
  
  data <- reactive({
    
    future_value <- function(amount, rate, years) {
      fv <- amount * (1 + rate)^years
      return(fv)}
    
    annuity <- function(contrib, rate, years) {
      a <- contrib * (((1 + rate)^years - 1)/(rate))
      return(a)}
  
    growing_annuity <- function(contrib, rate, growth, years) {
      ga <- contrib * (((1 + rate)^years - (1 + growth)^years)/(rate - growth))
      return(ga)}
    
    year <- c(0:input$years)
    length <- length(year)
    no_contrib = rep(0, length)
    fixed_contrib = rep(0, length)
    growing_contrib = rep(0, length)
    
    for(y in 1:length){
      no_contrib[y] = future_value(input$amount, (input$rate/100), year[y])
      fixed_contrib[y] = no_contrib[y] + annuity(input$contribution, (input$rate/100), year[y])
      growing_contrib[y] = no_contrib[y] + growing_annuity(input$contribution, (input$rate/100), (input$growth/100), year[y])}
    
    data <- data.frame(year, no_contrib, fixed_contrib, growing_contrib)
    
    return(data)})
  
  output$Timelines <- renderPlot({
    if (input$facet == "Yes") {
      year <- data()$year
      no_contrib <- data()$no_contrib
      fixed_contrib <- data()$fixed_contrib
      growing_contrib <- data()$growing_contrib
      facet_modalities <- data.frame(variables = factor(rep(c("no_contrib", "fixed_contrib", "growing_contrib"), each = input$years + 1), levels = c("no_contrib", "fixed_contrib", "growing_contrib")), year = rep(year, 3), value = c(no_contrib, fixed_contrib, growing_contrib))
      ggplot(data = facet_modalities, aes(x = year, y = value, colour = variables, fill = variables)) + facet_grid(.~variables) + geom_line() + labs(title = "Three modes of investing") + scale_colour_brewer(palette = "Set1", name = "variable") + scale_fill_brewer(palette = "Set1", name = "variable") + geom_area(alpha = 0.6) + geom_point() + theme_bw()}
    else {
      ggplot(data = data()) + geom_line(aes(x = year, y = no_contrib, color = "no_contrib")) + geom_line(aes(x = year, y = fixed_contrib, color = "fixed_contrib")) + geom_line(aes(x = year, y = growing_contrib, color = "growing_contrib")) + geom_point(aes(x = year, y = no_contrib, color = "no_contrib"), size = 0.8) + geom_point(aes(x = year, y = fixed_contrib, color = "fixed_contrib"), size = 0.8) + geom_point(aes(x = year, y = growing_contrib, color = "growing_contrib"), size = 0.8) + labs(x = "year", y = "value", title = "Three modes of investing") + scale_colour_manual(values = c("no_contrib" = "red1", "fixed_contrib" = "green1", "growing_contrib" = "blue1"), name = "variable", breaks = c("no_contrib", "fixed_contrib", "growing_contrib"))}})

output$Balances <- renderPrint({
  data()})}

shinyApp(ui = ui, server = server)
