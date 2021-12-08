
library(tidyverse)
library(googlesheets4)

set.seed(12345)

final_exam <- read_sheet("https://docs.google.com/spreadsheets/d/1HBadBvtzAya8sUZAJoFxf_b-rTnLo--YQzhTmz_Vk6E/edit?usp=sharing") %>% 
  rename(Wednesday = 'Wednesday, December 8', 
         Friday = 'Friday, December 10')

wednesday <- final_exam %>% 
  select(Wednesday) %>% 
  filter(Wednesday != "NULL", 
         Wednesday != "EITHER SECTION", 
         Wednesday != "ONLY 9:00 SECTION")

friday <- final_exam %>% 
  select(Friday) %>% 
  filter(Friday != "NULL", 
         Friday != "EITHER SECTION", 
         Friday != "ONLY 8:00 SECTION")

exam_questions <- function(x, bank){
  q <- rdunif(1, a = 1, b = bank)
  return(q)
}


wednesday_exams <- wednesday %>% 
  mutate(q1 = map_dbl(Wednesday, exam_questions, bank = 5), 
         q2 = map_dbl(Wednesday, exam_questions, bank = 5)
  )

friday_exams <- friday %>% 
  mutate(q1 = map_dbl(Friday, exam_questions, bank = 5), 
         q2 = map_dbl(Friday, exam_questions, bank = 5)
  )


