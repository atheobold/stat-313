library(tidyverse)
library(ggridges)
library(palmerpenguins)

## FILTER 

penguins %>% 
  filter(species == "Adelie")

penguins %>% 
  filter(species != "Gentoo", 
         species != "Chinstrap")

penguins %>% 
  filter(sex %in% c("male", "female")
         )

penguins %>% 
  filter(sex == "male" | sex == "female")
  )

penguins %>% 
  filter(body_mass_g >= 3000)


## SELECT 

penguins %>% 
  select(species, island, sex, year)


penguins %>% 
  select(-bill_depth_mm, -bill_length_mm)


## MUTATE 

penguins <- penguins %>% 
  mutate(body_mass_kg = body_mass_g / 1000, 
         sex = if_else(is.na(sex) == TRUE, 
                       "unsexed",
                       sex))



## GROUP BY & SUMMARIZE

penguins %>% 
  group_by(sex) %>% 
  summarize(mean_mass = mean(body_mass_g), 
            mean_flipper = mean(flipper_length_mm), 
            sample_size = n()
  ) %>% 
  filter(is.na(sex) != TRUE)


## ARRANGE + PIPELINE

penguins %>%
  filter(sex == "male", year == 2007) %>%
  group_by(species) %>%
  summarize(mean_bill_length = mean(bill_length_mm),
            sd_bill_length = sd(bill_length_mm),
            obs = n()) %>%
  arrange(desc(obs))