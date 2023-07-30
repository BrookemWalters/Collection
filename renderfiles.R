library(quarto)


folder_path <- "~/gvsu/summer 23/stat 631/Collection"


# Get the list of .qmd files in the folder
qmd_files <- list.files(path = folder_path, pattern = "\\.qmd$", full.names = TRUE)

# Loop over each .qmd file and render it
for (file in qmd_files) {
  quarto_render(file)
}