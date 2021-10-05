library(palmerpenguins)
library(tidyverse)

## HISTOGRAM

penguins %>%
  ggplot(aes(x = bill_length_mm)) + 
  geom_histogram(bins = 20)


## DOTPLOT

penguins %>% 
  ggplot(aes(x = bill_length_mm)) + 
  geom_dotplot(dotsize = 0.5)


## BOXPLOT

penguins %>% 
  ggplot(aes(x = bill_length_mm)) + 
  geom_boxplot()


## DENSITY PLOT

penguins %>% 
  ggplot(aes(x = bill_length_mm)) + 
  geom_density()
