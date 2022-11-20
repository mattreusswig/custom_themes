# If fonts are shown as missing, may need to do the folowing
# library(extrafont)
# font_import()
# loadfonts(device = "win")

theme_base <- function(base_size = 12, 
                       dark_text = "#1A242F",
                       facet_color = "lightblue") {
  
  mid_text <-  monochromeR::generate_palette(dark_text, "go_lighter", n_colours = 5)[2]
  light_text <-  monochromeR::generate_palette(dark_text, "go_lighter", n_colours = 5)[3]
  
  t <- theme_minimal(base_size = base_size) +
    theme(text = element_text(colour = mid_text, family = "", lineheight = 1.1),
          # plot.title = element_text(colour = dark_text, family = "", 
          #                           size = rel(1.6), margin = margin(12, 0, 8, 0)),
          # plot.subtitle = element_text(size = rel(1.1), margin = margin(4, 0, 0, 0)),
          axis.text.y = element_text(colour = mid_text, size = rel(0.8)),
          axis.title.y = element_text(size = 12, margin = margin(0, 4, 0, 0)),
          axis.text.x = element_text(colour = mid_text, size = rel(0.8),
                                     angle = 45, hjust =  1, vjust = 1),
          axis.title.x = element_blank(),
          legend.position = "bottom",
          legend.justification = 1,
          panel.grid = element_line(colour = "#F3F4F5"),
          plot.caption = element_text(color = light_text, 
                                      size = rel(0.8), margin = margin(8, 0, 0, 0)),
          plot.margin = margin(0.25, 0.25, 0.25, 0.25,"cm"),
          strip.background = element_rect(fill = facet_color))
  
  return(t)
  
}

