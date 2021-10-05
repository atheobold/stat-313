## SIDE-BY-SIDE BOXPLOTS

penguins %>% 
  ggplot(aes(x = bill_length_mm, y = species)) + 
  geom_boxplot()


## SIDE-BY-SIDE DENSITY PLOTS -- RIDGE PLOTS

library(ggridges)

penguins %>% 
  ggplot(aes(x = bill_length_mm, y = species)) + 
  geom_density_ridges(alpha = 0.5)


## SCATTERPLOTS

penguins %>% 
  ggplot(aes(y = bill_length_mm, x = bill_depth_mm)) + 
  geom_point()
