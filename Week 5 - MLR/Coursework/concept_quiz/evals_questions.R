
library(tidyverse)
library(moderndive)

evals %>% 
  ggplot(mapping = aes(x = age, y = score, color = ethnicity)) +
  geom_jitter(width = 0.2, height = 0.2, alpha = 0.75) + 
  geom_smooth(method = "lm", se = FALSE) + 
  labs(x = "Age of Professor", 
       y = "Evaluation Score", 
       color = "Ethnicity") + 
  theme_bw()


minority_lm <- lm(score ~ age * ethnicity, data = evals)

get_regression_table(minority_lm)

bty_lm <- lm(score ~ age + bty_avg, data = evals)

get_regression_table(bty_lm)

