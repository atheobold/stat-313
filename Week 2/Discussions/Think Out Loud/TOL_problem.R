library(openintro)
library(tidyverse)

arbuthnot <- arbuthnot %>%
  mutate(total = boys + girls, 
         boy_ratio = boys / total)


arbuthnot %>%  
  ggplot(aes(x=year, y=boy_ratio)) +
  geom_point()
