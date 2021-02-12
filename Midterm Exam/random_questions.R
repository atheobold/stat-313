library(tidyverse)
library(googlesheets4)

set.seed(1234)

exams <- read_sheet("https://docs.google.com/spreadsheets/d/1J0T2UOAPta5huJ-qYCYyN28M9Fr7zcD1IcNLy6mFxrA/edit#gid=0")

exam_function <- function(x, a = 1, end){
  n = length(x)
  q1 <- rdunif(length(x), a = a, b = end)
  q2 <- rdunif(length(x), a = a, b = end)
  
  tibble(students = x,
         question1 = q1, 
         question2 = q2)  
}

#### MONDAY

monday_students <- exams %>% 
  select(Monday) %>% 
  filter(Monday != "NULL", 
         nchar(Monday) > 1) %>% 
  mutate(student_name = word(Monday, 1)) %>% 
  select(student_name)

monday <- exam_function(monday_students, end = 6)  

#### TUESDAY 

tuesday_students <- exams %>% 
  select(Tuesday) %>% 
  filter(Tuesday != "NULL", 
         nchar(Tuesday) > 1) %>% 
  mutate(student_name = word(Tuesday, 1)) %>% 
  select(student_name)

tuesday <- tibble(students = tuesday_students, question1 = tuesday_q1, 
                 question2 = tuesday_q2)  

#### WEDNESDAY 
wednesday_students <- exams %>% 
  select(Wednesday) %>% 
  filter(Wednesday != "NULL", 
         nchar(Wednesday) > 1) %>% 
  mutate(student_name = word(Wednesday, 1)) %>% 
  select(student_name)

wednesday <- exam_function(wednesday_students, end = 6)


#### THURSDAY
thursday_students <- exams %>% 
  select(Thursday) %>% 
  filter(Thursday != "NULL", 
         nchar(Thursday) > 1) %>% 
  mutate(student_name = word(Thursday, 1)) %>% 
  select(student_name)

thursday <- exam_function(thursday_students, end = 6)  
  
#### FRIDAY
friday_students <- exams %>% 
  select(Friday) %>% 
  filter(Friday != "NULL", 
         nchar(Friday) > 1) %>% 
  mutate(student_name = word(Friday, 1)) %>% 
  select(student_name)

friday <- exam_function(friday_students, end = 6)

