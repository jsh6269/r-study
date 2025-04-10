library(ggplot2)

ggplot(mtcars, aes(x = factor(cyl))) +
  geom_bar(fill = "coral", alpha = 0.5) +
  theme_classic()

ggplot(mtcars, aes(x = factor(cyl), fill = factor(cyl))) +
  geom_bar(alpha = 0.5, width = 0.75) +
  theme_classic()

data_histogram <- mtcars %>%
  mutate(cyl = factor(cyl)) %>%
  group_by(cyl) %>%
  summarise(mean_mpg = round(mean(mpg), 2))

histo <- ggplot(data_histogram, aes(x = cyl, y = mean_mpg, fill = cyl)) +
  geom_bar(stat = "identity", width = 0.6) +
  coord_flip() +
  geom_text(
    aes(label = mean_mpg),
    hjust = 1.5,
    color = "white",
    size = 4
  ) +
  labs(title = "average mpg for each cyl") +
  theme_classic()

ggsave("plot/bar-plot.png", plot = histo, width = 10, height = 10, units = "cm")
