
library(tidyverse)
library(openintro)
library(modelr)
library(broom)

evals_new <- evals %>% 
  group_by(prof_id) %>% 
  sample_n(size = 1, replace = FALSE) %>% 
  mutate(attr_cat = case_when(bty_avg < 4 ~ "low", 
                              bty_avg >= 4 & bty_avg <= 7 ~ "medium", 
                              bty_avg > 7 ~ "high")
  )

null_data <- permute(evals_new, 
                     n = 10, 
                     columns = score)

models <- map(null_data$perm, ~ lm(score ~ attr_cat * gender, data = .))

get_interaction <- function(x){
  int_p_value <- anova(x) %>%
    tidy() %>%
    filter(term == "attr_cat:gender") %>%
    select(p.value)
  
  return(int_p_value)
}

anova <- map_df(models, get_interaction, .id = "id")




