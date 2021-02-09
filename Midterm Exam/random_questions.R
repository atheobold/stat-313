library(tidyverse)
set.seed(1234)

monday_students <- c("Ryan", "Alex", "Reed", "Amrit", "Mia", "Thomas B.", 
                     "Katarina")

monday_q1 <- rdunif(length(monday_students), a = 1, b = 6)
monday_q2 <- rdunif(length(monday_students), a = 1, b = 6)

monday <- tibble(students = monday_students, question1 = monday_q1, 
                 question2 = monday_q2)  


tuesday_students <- c("Thomas S.", "Jade", "Rachel K.", "Emma", 
                      "Sam C.", "Sam W.")

tuesday_q1 <- rdunif(length(tuesday_students), a = 1, b = 6)
tuesday_q2 <- rdunif(length(tuesday_students), a = 1, b = 6)

tuesday <- tibble(students = tuesday_students, question1 = tuesday_q1, 
                 question2 = tuesday_q2)  

