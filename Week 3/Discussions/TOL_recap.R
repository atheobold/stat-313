
library(tidyverse)
library(gapminder)

gapminder %>% 
  group_by(continent) %>% 
  summarize(mean_lifeExp = mean(lifeExp))
