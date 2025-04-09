df <- read.csv('mtcars.csv', header=TRUE, sep=',')
head(df)
length(df)

class(df$X)

# install.packages("readxl")
library(readxl)
readxl_example()

path <- readxl_example("deaths.xls")
df <- read_excel(path)
head(df)

data <- readxl_example("datasets.xlsx")
excel_sheets(data)

quake <- read_excel(data, sheet="quakes")
head(quake)
