# install.packages("tidyr")
library(tidyr)

# wider, longer
wide <- pivot_wider(df_primary, names_from=year, values_from=items); w
pivot_longer(wide, cols=-ID, names_to="year", values_to="items")

# unite
df_united <- unite(df_primary, col = "ID_year", ID, year, sep = "_"); df_united

# separate
df_separated <- separate(df_united, col = "ID_year", into = c("ID", "year"), sep = "_")
df_separated
