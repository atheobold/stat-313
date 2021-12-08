
library(tidyverse)
library(googlesheets4)

set.seed(1234)

midterm_exam <- read_sheet("https://docs.google.com/spreadsheets/d/1qka9tHiyiHTWMt_CpkySIaYZXXfKj0ZYN-8BoiKrSps/edit?usp=sharing") %>% 
  rename(Monday = 'Monday, October 25', 
         Tuesday = 'Tuesday, October 26')

monday <- midterm_exam %>% 
  select(Monday) %>% 
  filter(Monday != "NULL")

tuesday <- midterm_exam %>% 
  select(Tuesday) %>% 
  filter(Tuesday != "NULL")

exam_questions <- function(x, bank){
  q <- rdunif(1, a = 1, b = bank)
  return(q)
}


monday_exams <- monday %>% 
  mutate(q1 = map_dbl(Monday, exam_questions, bank = 5), 
         q2 = map_dbl(Monday, exam_questions, bank = 5)
         )

tuesday_exams <- tuesday %>% 
  mutate(q1 = map_dbl(Tuesday, exam_questions, bank = 5), 
         q2 = map_dbl(Tuesday, exam_questions, bank = 5)
  )
