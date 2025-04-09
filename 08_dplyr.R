library(dplyr)

df_primary <- tribble(
  ~ID, ~y,
  "A", 1,
  "B", 3,
  "C", 2,
  "D", 0,
  "F", 3
)

df_secondary <- tribble(
  ~ID, ~z,
  "A", 2,
  "B", 1,
  "C", 3,
  "D", 4,
  "E", 1
)

# join

# primary에 존재하는 id만
left_join(df_primary, df_secondary, by="ID")

# secondary에 존재하는 id만
right_join(df_primary, df_secondary, by="ID")

# 공통으로 존재하는 id만
inner_join(df_primary, df_secondary, by="ID")

# 모든 id
full_join(df_primary, df_secondary, by="ID")

# key pair
df_primary <- tribble(
  ~ID, ~year, ~items,
  "A", 2015, 3,
  "A", 2016, 7,
  "A", 2017, 6,
  "B", 2015, 4,
  "B", 2016, 8,
  "B", 2017, 7,
  "C", 2015, 4,
  "C", 2016, 6,
  "C", 2017, 6
)

df_secondary <- tribble(
  ~ID, ~year, ~prices,
  "A", 2015, 9,
  "A", 2016, 8,
  "A", 2017, 12,
  "B", 2015, 13,
  "B", 2016, 14,
  "B", 2017, 6,
  "C", 2015, 15,
  "C", 2016, 15,
  "C", 2017, 13
)

left_join(df_primary, df_secondary, by = c('ID', 'year'))
