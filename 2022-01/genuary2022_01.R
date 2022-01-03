#' Genuary 2022
#' Author: Ulrich Atz
#' Date: 2022-01-03
#' https://genuary.art/prompts
#' --------------------------------------------
#' Draw 10,000 of something.
#' --------------------------------------------

# Load packages and helper scripts
library(tidyverse)
library(ggforce)
library(ambient)
library(camcorder)
gg_record(dir = 'png-tmp', dpi = 320, width = 8, height = 4.5)

# Attribution https://twitter.com/geokaramanis
set.seed(22)

tenk <- long_grid(seq(1, 10, length.out = 100), seq(1, 10, length.out = 100))
tenk$d <- gen_perlin(tenk$x, tenk$y, frequency = 0.5) 
tenk$r <- sample(seq(0.2, 1, length.out = 10000))

foreground <- tenk %>% as_tibble %>% slice_sample(n = 100)
background <- tenk %>% as_tibble %>% slice_sample(n = 9900)

ggplot() +
  geom_regon(data = foreground, 
             aes(x0 = x, y0 = y, 
                 r = r, fill = d, sides = 3, angle = 0),
             color = NA, alpha = 0.9) +
  geom_regon(data = background, 
             aes(x0 = (x - 1) * 1.2, y0 = (y - 0.75) * 1.2, 
                 r = r / 5, fill = d, sides = 3, angle = 0),
             color = NA, alpha = 0.4) +
  scale_fill_gradient() +
  theme_void() +
  theme(
    legend.position = "none",
    plot.background = element_rect(fill = "grey97", color = NA)
  )

ggsave("2022-01/10000-triangles.png", width = 8, height = 4.5)
