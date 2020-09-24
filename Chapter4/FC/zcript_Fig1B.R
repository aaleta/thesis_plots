library(wordcloud2)

load("Data/titles_2016.RData")

wordcloud2(data, figPath = "Data/roto2Mask.png", size=1)
