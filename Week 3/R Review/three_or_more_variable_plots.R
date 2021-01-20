## SCATTERPLOTS WITH COLORS 

penguins %>% 
  ggplot(aes(y = bill_length_mm, x = bill_depth_mm, color = body_mass_g)) + 
  geom_point()


## RIDGE PLOTS WITH COLORS 

penguins %>% 
  ggplot(aes(x = bill_length_mm, y = species, fill = sex)) + 
  geom_density_ridges(alpha = 0.3)


## SCATTERPLOTS WITH FACETS

penguins %>% 
  ggplot(aes(y = bill_length_mm, x = bill_depth_mm, color = species)) + 
  geom_point() + 
  facet_grid(vars(sex), vars(island))


## RIDGE PLOTS WITH FACETS

penguins %>% 
  ggplot(aes(x = bill_length_mm, y = species)) + 
  geom_density_ridges(alpha = 0.3) + 
  facet_wrap(vars(sex))
