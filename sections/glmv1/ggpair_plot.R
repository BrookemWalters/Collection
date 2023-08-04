theme_art_nov_minimal <- function() {
  theme(
    text = element_text(family = 'EB Garamond'),
    panel.grid = element_blank(),
    panel.border = element_blank(),
    panel.background = element_rect(fill = "#FEE8E1", color = "#DF5875"),
    panel.grid.major = element_line(color = "#DF5875", linetype = "dotted", linewidth = 0.5),
    panel.grid.minor = element_blank(),
    axis.line = element_line(color = "#DF5875", linewidth = 1),
    legend.position = "bottom"
  )
}

# +
#   theme_classic()  # Replace with your preferred theme

  
sai %>%
  select(week, month, lag1, lag2, rolling_4wk_avg, best_seller, sold) %>%
  ggpairs(
    upper = list(continuous = "cor"),
    lower = list(continuous = "points"),
    diag = list(continuous = "densityDiag")
  ) +
  theme_art_nov_minimal()