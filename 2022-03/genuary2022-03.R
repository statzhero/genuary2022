#' Genuary 2022
#' Day 03
#' Author: Ulrich Atz
#' https://genuary.art/prompts
#' --------------------------------------------
#' Space.
#' --------------------------------------------
library(paletter)
library(aRtsy)
library(ggplot2)
library(magick)
library(cowplot)           

set.seed(22)

# https://unsplash.com/photos/Z4wF0h47fy8
alps_img <- "2022-03/marmolada.jpg"

alps <- create_palette(image_path = alps_img,
                       number_of_colors = 5, 
                       type_of_variable = 'categorical',
                       optimize_palette = FALSE)

# Need more DARKNESS
alps[[2]] <- alps[[1]]

(nebula <- canvas_nebula(alps, 60, 5000) + coord_fixed(ratio = 9/16))

ggdraw() +
  draw_plot(nebula) + 
  draw_image(image_border(image_read(alps_img), "gray95", "5x5"), 
             scale = 0.25, x = 0.94, y = 0.15, hjust = 1, halign = 1, valign = 0)

ggsave("2022-03/space.png", width = 8, height = 4.5)


