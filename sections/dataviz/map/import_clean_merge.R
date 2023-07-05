# load packages

# First, check if pacman is installed and load it, or install it
if (!require("pacman")) {
  install.packages("pacman")
  library("pacman")
}

# Use p_load() to install (if necessary) and load  packages
pacman::p_load(tidyverse,
               tidymodels,
               RSQLite,
               DBI,
               tigris,
               sf,
               ggmap,
               osmdata,
               mapview,
               scales,
               furrr)


#load data from SQLite
connection <-  dbConnect(
  drv = SQLite(),
  dbname = "~/gvsu/summer 23/stat 631/portfolio/database/City_Data.db"
)

#fetch the walkability table info for michigan
tbl(connection, "walkable_2021") %>% 
  collect() -> wlk_mi 

#filter for michigan
wlk_mi <- wlk_mi %>% 
  filter(STATEFP == 26) %>% 
  select(TRACTCE, COUNTYFP, BLKGRPCE, NatWalkInd, CBSA_Name) %>% 
  mutate(CTRACT = paste0(COUNTYFP, TRACTCE))

# disconnect from SQL
dbDisconnect(connection)

#import spacial data from Tigris
options(tigris_class = "sf")
mi_sp <- tigris::block_groups(state = "26", year = 2019)

# format geocodes with leading zeros so they can pair up
wlk_mi$TRACTCE <- sprintf("%06d", wlk_mi$TRACTCE)
wlk_mi$COUNTYFP <- sprintf("%03d", wlk_mi$COUNTYFP)

mi_sp$TRACTCE <- as.character(mi_sp$TRACTCE)
mi_sp$COUNTYFP <- as.character(mi_sp$COUNTYFP)
mi_sp$BLKGRPCE <- as.character(mi_sp$BLKGRPCE)

wlk_mi$TRACTCE <- as.character(wlk_mi$TRACTCE)
wlk_mi$COUNTYFP <- as.character(wlk_mi$COUNTYFP)
wlk_mi$BLKGRPCE <- as.character(wlk_mi$BLKGRPCE)

# Join the datasets
wlk_mi <- mi_sp %>%
  left_join(wlk_mi, by = c("TRACTCE", "COUNTYFP", "BLKGRPCE"))

#https://medium.com/@nick-kobel/how-to-make-a-social-vulnerability-web-map-part-2-54295ff7e0d

#map boudaries



