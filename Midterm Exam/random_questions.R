library(tidyverse)
set.seed(1234)

monday_students <- c("Ryan", "Alex", "Reed", "Amrit", "Mia", "Thomas", 
                     "Katarina")

monday_q1 <- rdunif(length(monday_students), a = 1, b = 6)
monday_q2 <- rdunif(length(monday_students), a = 1, b = 6)

monday <- tibble(students = monday_students, question1 = monday_q1, 
                 question2 = monday_q2)  

