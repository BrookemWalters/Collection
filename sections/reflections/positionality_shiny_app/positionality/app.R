library(shiny)
library(plotly)
library(dplyr)


ui <- fluidPage(
    titlePanel("Interactive Timeline"),
    mainPanel(
        plotlyOutput("timelinePlot")
    )
)


server <- function(input, output) {
    
    output$timelinePlot <- renderPlotly({
        
        # the data
        timeline_data <- data.frame(
            id = 1:4,
            positionality = c("Parental Socioeconomic Status", "Spirituality", "Nationality", "Race"),
            year = as.Date(c("1985-01-01", "2004-01-01", "2014-01-01", "2023-01-01")),
            description = c(
                "'I don’t want to see you, and I don’t want to hear you.'
                These were my father's nightly words for the summers devoid of mandated bedtimes. 
                In those moments, I discovered a world of books, solitude, and one-thousand-piece jig-saw puzzles.
                Being born to young parents instilled in me a spirit of self-reliance, yet also nurtured a hint of survivorship bias.
                The days of food and housing insecurity now reside as nebulous memories, occasionally nudging me to dismiss the struggles faced by others.
                I firmly believe in the importance of seeking out experiences that reconnect me with the shared humanity of others. 
                Through art, literature, and the simple act of attentive listening, I regain empathy. 
                Suffering is not a competition; the intensity of an individual's pain is their valid reality.",       
                
                "'You are an expression of the Universe.' 
                As a born-again evangelical Christian turned atheist, I perceive the world as it is,
                deriving purpose and meaning from the ordinary intricacies of everyday existence. 
                That is what I appreciate about science—the constant evolution of our understanding as new information emerges,
                allowing our perceptions of the world to shift and expand.",
                

                "'This water is potable,' a phrase I diligently practiced in Dari, preparing myself for my deployment to Kabul in 2013. 
                I’ll never forget the moment the armored vehicle doors opened and I saw my first country outside of North America.
                Rubble, garbage, unpaved roads, dirt. 
                I spent my time in Afghanistan visiting local police stations and leading first aid classes. 
                I recall one of my 'students' guiding my hand to the indentation on the back of his head. 
                He bore the scars of an encounter with the Taliban's improvised explosive device (IED), the shrapnel having impaled him and leaving a bit of his skull missing.
                Remarkably, he had packed his own wound and traversed over an hour to reach the sole hospital, where he underwent life-saving surgery provided by a NATO medical unit. 
                After this amazing story, I remarked that he should be leading the class, he joked that I should be his third wife. 
                As an American, the probability of finding myself in a series of circumstances similar the police officer's is rather slim.",
                
                
                "'Let me give you a tip. You wanna make some money here? Use your white voice.' 
                Boots Riley’s 2018 film 'Sorry to Bother You' is the perfect expression of my experience as a black individual new to the middle class. 
                If you do not have the stomach for R-rated movies or approximately 1 hour and 52 minutes to spare, here’s my racial positionality attempt:
                
                It’s the early nineties, I’m at the golden arches with my best friend, and her mom is ordering us Happy Meals with a Barbie prize. 
                Hell yeah, life’s amazing. 
                I look over at my friend and she is visibly upset, tears rolling down her chin.
                'Brooke, they gave you the wrong meal,' 
                The mom tries to take my toy in exchange for the black Barbie doll that was meant for me. 
                I refused and ruined the outing. 
                I don’t blame a six-year-old for being disappointed, but that experience was one of many that ingrained in me the false notion that white was the ideal.
                It's more vivid than any of the racially explicit derogatory terms thrown at me by strangers. 
                Trying to unlearn that mentality was a journey. 
                Now that critical race theory has gone corporate, and I often find myself the only brown person in the room, 
                I wonder just how honest I can be and keep my paycheck." 
            ),

            pos_palette = c("#CBD1C9", "#F3938F", "#FCD470", "#CCAE8E")
        )
        
        # the plot
        pos_plot <- timeline_data %>%
            plot_ly(
                x = ~year,
                y = ~positionality,
                text = ~description,
                type = "scatter",
                mode = "markers",
                marker = list(color = ~pos_palette , size = 45)
            ) %>%
            layout(
                title = "Hover To Read Positionality Statements",
                xaxis = list(
                    title = "Year",
                    tickvals = as.Date(c("1985-01-01", "2004-01-01", "2014-01-01", "2023-01-01")),
                    ticktext = c("1985", "2004", "2014", "2023")
                ),
                yaxis = list(title = "positionality"),
                hovermode = "closest",
                hoverlabel = list(bordercolor = "black")
            )
        
        return(pos_plot)
        
    })
}


shinyApp(ui = ui, server = server)