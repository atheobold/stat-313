library(tidyverse)
set.seed(1234)

exam_function <- function(x, a = 1, end){
  n = length(x)
  q1 <- rdunif(length(x), a = a, b = end)
  q2 <- rdunif(length(x), a = a, b = end)
  
  tibble(students = x,
         question1 = q1, 
         question2 = q2)  
}

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

wednesday_students <- c("Mackenzie", "Emily", "Shannon", 
                        "Matthew", "Emma", "Abby", "Kevin", 
                        "Jana", "Wiyi")

wednesday <- exam_function(wednesday_students, end = 6)


thursday_students <- c("Johnathan", "Erika", "Sarah", 
                       "Izzy", "Charlie", "Gwyneth", 
                       "Taylor", "Nick", "Ruby", 
                       "Caroline", "Owen", "Catherine", 
                       "Jess", "Jacqueline", "Shad", 
                       "Shannon", "Jenny", "Lauren", 
                       "Dylan", "Grant", "Brittani", 
                       "Catie", "Paige")

thursday <- exam_function(thursday_students, end = 6)  
  

