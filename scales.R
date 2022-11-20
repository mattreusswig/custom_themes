# Functions and Ito palettes pilfered from Claus Wilke.
# I built my own versions since his package isn't currently on CRAN
# https://github.com/clauswilke/colorblindr/ 

scale_color_base<- function(aesthetics = "color", ...) {
  scale_base(aesthetics, ...)
}

scale_fill_base <- function(aesthetics = "fill", ...) {
  scale_base(aesthetics, ...)
}

scale_color_OkabeIto <- function(aesthetics = "color", ...) {
  scale_OkabeIto(aesthetics, ...)
}

scale_fill_OkabeIto <- function(aesthetics = "fill", ...) {
  scale_OkabeIto(aesthetics, ...)
}

scale_OkabeIto <- function(aesthetics, use_black = FALSE, order = 1:8, ...) {
  
  if (use_black) {
    values <- palette_OkabeIto_black[order]
  }
  else {
    values <- palette_OkabeIto[order]
  }
  
  n <- length(values)
  
  pal <- function(n) {
    if (n > length(values)) {
      warning("Insufficient values in manual scale. ", n, " needed but only ",
              length(values), " provided.", call. = FALSE)
    }
    values
  }
  ggplot2::discrete_scale(aesthetics, "manual", pal, ...)
}

scale_base <- function(aesthetics, use_black = FALSE, order = 1:8, ...) {
  
  if (use_black) {
    values <- palette_OkabeIto_black[order]
  }
  else {
    values <- palette_base[order]
  }
  
  n <- length(values)
  
  pal <- function(n) {
    if (n > length(values)) {
      warning("Insufficient values in manual scale. ", n, " needed but only ",
              length(values), " provided.", call. = FALSE)
    }
    values
  }
  ggplot2::discrete_scale(aesthetics, "manual", pal, ...)
}
