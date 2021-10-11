
library(tidyverse)
library(readxl)

survey <- read_xlsx("survey.xlsx")

survey <- survey %>%
  rename(first = 'Your first name', 
         last = 'Your last name', 
         course = 'What time is your course?', 
         want = 'What do you look for in group members? (select all that apply)', 
         extra = 'If you selected "Other" above, please elaborate on your selection!',
         days = 'What days would you prefer to work on Stat 313? (select all that apply)', 
         times = 'What times of the day do you prefer to work? (select all that apply)', 
         additions = 'Do you have any additional considerations you would like for me to know while I am forming teams?'
         ) %>% 
  mutate(monday = str_detect(days, pattern = "Monday"), 
         tuesday = str_detect(days, pattern = "Tuesday"),
         wednesday = str_detect(days, pattern = "Wednesday"),
         thursday = str_detect(days, pattern = "Thursday"),
         friday = str_detect(days, pattern = "Friday"),
         saturday = str_detect(days, pattern = "Saturday"),
         sunday = str_detect(days, pattern = "Sunday"), 
         morning = str_detect(times, "Mornings"), 
         afternoon = str_detect(times, "Afternoons"), 
         evening = str_detect(times, "Evenings")
  ) %>% 
  select(-days, -times) 

# SECTION 01 -- 8:00

section_01 <- survey %>% 
  filter(course == "8:00am")

morning01 <- section_01 %>% 
  filter(morning)

afternoon01 <- section_01 %>% 
  filter(afternoon)

evening01 <- section_01 %>% 
  filter(evening)

# SECTION 02 -- 9:00

section_02 <- survey %>% 
  filter(course == "9:00am")

morning02 <- section_02 %>% 
  filter(morning)

afternoon02 <- section_02 %>% 
  filter(afternoon)

evening02 <- section_02 %>% 
  filter(evening)

