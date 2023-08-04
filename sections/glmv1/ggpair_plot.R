sai %>%
  select(week, month, lag1, lag2, rolling_4wk_avg, best_seller, sold) %>%
  ggpairs(
    upper = list(continuous = "cor"),
    lower = list(continuous = "points"),
    diag = list(continuous = "densityDiag")
  ) +
  theme_art_nouveau()  