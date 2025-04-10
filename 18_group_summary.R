library(dplyr)

data <- read.csv("lahman-batting.csv") %>%
select(c(playerID, yearID, AB, teamID, lgID, G, R, HR, SH)) %>%
arrange(playerID, teamID, yearID)

glimpse(data)

# summarise
summarise(data, mean_games = mean(G), mean_SH = mean(SH, na.rm = TRUE))

# group by
data %>%
  select(playerID, HR, G) %>%
  filter(HR > 0) %>%
  group_by(playerID) %>%
  arrange(HR, desc(G))

library(ggplot2)

# group summary
data %>%
  group_by(lgID) %>%
  summarise(mean_home_run=mean(HR))

# summary with plot
data %>%
  group_by(lgID) %>%
  summarise(mean_home_run=mean(HR)) %>%
  ggplot(aes(x=lgID, y=mean_home_run, fill=lgID)) +
     geom_bar(stat="identity") +
     theme_classic() +
     labs (
       x = "baseball league",
       y = "Average home run",
       title = paste(
         "League Summary"
       )
     )

# group summary
ext <- data %>%
  group_by(yearID) %>%
  summarise(mean_game_year=mean(G))

head(ext)

ggplot(ext, aes(x=yearID, y=mean_game_year)) +
  geom_line() +
  theme_classic() +
  labs(
    x="Year",
    y="Average games played",
    title = paste(
      "Average games played from 1871 to 2016"
    )
  )

# example
data %>%
  group_by(lgID) %>%
  summarise(meadian_AB_nonzero = median(AB[AB > 0]))

data %>%
  group_by(lgID) %>%
  summarise(sum_homerun=sum(HR), std_homerun=sd(HR))

data %>%
  group_by(playerID) %>%
  summarise(minG=min(G), maxG=max(G))

# first and last
data %>%
  group_by(playerID) %>%
  summarise(first_appearance = first(yearID),
      last_appearance = last(yearID))

# nth
data %>%
  group_by(teamID) %>%
  summarise(second_game = nth(yearID, 4)) %>%
  arrange(second_game)

# n(): count items
data %>%
  group_by(playerID) %>%
  summarise(number_year=n()) %>%
  arrange(desc(number_year))

# n_distinct(): unique count
data %>%
  group_by(teamID) %>%
  summarise(number_players=n_distinct(playerID)) %>%
  arrange(desc(number_players))

# multiple groups, filter
data %>%
  filter(yearID > 1900) %>%
  group_by(teamID, yearID) %>%
  summarise(number_player = n_distinct(playerID)) %>%
  arrange(teamID, yearID)

# ungroup
data %>%
  filter(HR > 0) %>%
  group_by(playerID) %>%
  summarise(average_HR_game = sum(HR) / sum(G)) %>%
  ungroup() %>%
  summarise(total_average_homerun = mean(average_HR_game))
