
library(tidyverse)
library(googlesheets4)

set.seed(1234)

final_exam <- read_sheet("https://docs.google.com/spreadsheets/d/1a9Hl7gT38i8Wk0hwFHcaQ9Ne4_NmhcoOoWfP1c-pm4I/edit#gid=0")

monday <- final_exam %>% 
  select(Monday) %>% 
  filter(Monday != "NULL")

tuesday <- final_exam %>% 
  select(Tuesday) %>% 
  filter(Tuesday != "NULL")

wednesday <- final_exam %>% 
  select(Wednesday) %>% 
  filter(Wednesday != "NULL")

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

wednesday_exams <- wednesday %>% 
  mutate(q1 = map_dbl(Wednesday, exam_questions, bank = 5), 
         q2 = map_dbl(Wednesday, exam_questions, bank = 5)
  )
