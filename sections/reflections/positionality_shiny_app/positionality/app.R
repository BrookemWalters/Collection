library(shiny)
library(plotly)

positionality_data <- data.frame(
    aspect = c("Racial Identity", "Geographical Background", "Parental Socioeconomic Status", "Motherhood", "Veteran Status", "Atheism"),
    description = c(
        "racial identity.",
        "Born and raised in West Michigan.",
        "Child of lower-class parents.",
        "Experiences as a mother.",
        "Veteran status",
        "Atheism"
    )
)

ui <- fluidPage(
    includeCSS("custom.css"),
    titlePanel("Interactive Positionality Statement"),
    sidebarLayout(
        sidebarPanel(
            selectInput("aspect", "Select an aspect of positionality:", choices = positionality_data$aspect)
        ),
        mainPanel(
            plotlyOutput("positionality_plot")
        )
    )
)

server <- function(input, output) {
    output$positionality_plot <- renderPlotly({
        selected_aspect <- positionality_data[positionality_data$aspect == input$aspect, ]
        
        plot_ly(data = selected_aspect,
                type = "bar",
                x = ~aspect,
                y = 1,
                text = ~description,
                hoverinfo = "text",
                showlegend = FALSE) %>%
            layout(yaxis = list(title = "Positionality Aspect", showticklabels = FALSE))
    })
}

shinyApp(ui = ui, server = server)
