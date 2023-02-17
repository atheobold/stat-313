library(tidyverse)
library(infer)

coaches <- read_csv("data/cu_csu_coaches.csv")

sample <- coaches %>% 
  sample_n(size = 25, replace = FALSE)

boot <- sample %>% 
  specify(response = `Total Pay & Benefits`) %>% 
  generate(reps = 10000, type = "bootstrap") %>% 
  calculate(stat = "mean")

get_confidence_interval(boot, level = 0.95)
