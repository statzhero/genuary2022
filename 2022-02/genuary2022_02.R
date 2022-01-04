#' Genuary 2022
#' Day 02
#' Author: Ulrich Atz
#' https://genuary.art/prompts
#' --------------------------------------------
#' Dithering.
#' --------------------------------------------

# Load packages
library(tidyverse)
library(magick)
library(ditherer)

mountains <- image_read("2022-01/10000-triangles.png")
image_info(mountains)

dither(mountains, target_palette = grey.colors(16))

ggsave("2022-02/dithering.png", width = 8, height = 4.5)

