

# inspired by: "How to create your own custom ggplot2 theme (CC152)", Oct 7, 2021
# Riffomonas Project
# https://www.youtube.com/watch?v=tplhrRNXx8Q

library(showtext)
font_add_google("EB Garamond") # add in my art nouveau font
windows()
showtext_auto()


# Brooke's Art Nouveau Theme 
theme_art_nouveau <- function(){
  # using minimal theme as a base
  theme_minimal() +
    theme(
      text = element_text(family = 'EB Garamond'),
      axis.text = element_text(color = "black", size = 16),
      axis.title = element_text(color = "black", size = 18, face = "bold"),
      plot.title = element_text(color = "black", size = 30, face = "bold"),
      plot.caption = element_text(color = "black", size = 20),
      panel.grid = element_blank(),
       panel.border = element_blank(),
      panel.background = element_rect(fill = "#FEE8E1", color = "#DF5875"),
      panel.grid.major = element_line(color = "#DF5875", linetype = "dotted", linewidth = 0.5), 
      panel.grid.minor = element_blank(),
      axis.line = element_line(color = "#DF5875", linewidth = 1),  
      legend.position = "bottom",
      legend.key = element_blank(),
      legend.title = element_text(color = "#DF5875", size = 12, face = "bold"),
      legend.text = element_text(color = "#DF5875", size = 14),
      strip.background = element_rect(fill = "#FEE8E1", color = "#DF5875"),
      strip.text = element_text(color = "#DF5875", size = 12, family = "EB Garamond", face = "bold"))
}
