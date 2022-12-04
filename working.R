library(readxl)
library(ggplot2)

readxl::excel_sheets("MS4_DMR Data_2022-06-21.xlsx")

d <- read_excel("MS4_DMR Data_2022-06-21.xlsx", sheet = "all_data_merged", col_types = c("text", "text", "text", "text", "text", "numeric", "text", "date", "numeric", "numeric", "text"))
d <- d[!is.na(d$Sample.Date), ]


dd <- d[which(d$Parameter %in% "Copper"), ]

# Change default point or line color
# update_geom_defaults("point",   list(colour = "#474F58"))
# update_geom_defaults("line",   list(colour = "#474F58"))

ggplot(dd) +
  geom_boxplot(aes(x = factor(lubridate::year(Sample.Date)), y = Result, fill = Permittee)) +
  scale_y_log10(breaks = scales::trans_breaks("log10", function(x) 10^x),
                labels = scales::trans_format("log10", scales::math_format(10^.x))) +
  facet_wrap(~Permittee, scales = "free_x") +
  scale_color_grad("fill") +
  # scale_color_base("fill") +
  labs(caption = "Copper") +
  theme_base(facet_color = "orange")
