library(wordcloud2)

load("Data/titles_2003.RData")

wordcloud2(data, figPath = "Data/carMask.png", size=1.5)
