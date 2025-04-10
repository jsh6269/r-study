library(ggplot2)

ggplot(mtcars, aes(x = drat, y = mpg)) +
  geom_point(aes(color = factor(gear)))

graph <- ggplot(mtcars, aes(x = log(mpg), y = log(drat))) +
  geom_point(aes(color = factor(gear))) +
  stat_smooth(method = "lm", col = "#c42126", se=FALSE, size=0.5)

graph

graph <- graph + labs(
  x = "log(mile/hour)",
  y = "drat",
  color = "Gear",
  title = "mile/h and drat, in log",
  subtitle = paste("avg:", mean(mtcars$mpg)),
  caption = "@jsh6269"
); graph

graph <- graph +
  scale_x_continuous(breaks = seq(1, 3.6, by = 0.2)) +
  scale_y_continuous(breaks = seq(1, 1.6, by = 0.1))

graph <- graph +
  theme_light()

graph

ggsave("plot/scatter-plot.png", plot = graph, width = 10, height = 10, units = "cm")
