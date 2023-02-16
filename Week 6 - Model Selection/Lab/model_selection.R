
library(tidyverse)
library(moderndive)

set.seed(1234)

evals <- evals |> 
  mutate(large_class = if_else(cls_students > 100, 
                               "large class", 
                               "regular class"), 
         eval_completion = cls_did_eval / cls_students 
  ) |> 
  select(-cls_did_eval, 
         -cls_students)


evals_train <- slice_sample(evals, prop = 0.8)
evals_test <- anti_join(evals, evals_train, by = "ID")

#### NO VARIABLES

one_mean <- lm(score ~ 1, data = evals_train)
get_regression_summaries(one_mean)

#### ONE VARIABLE

### Using map()
evals_train %>% 
  map(.f = ~lm(score ~ .x, data = evals_train)) %>% 
  map_df(.f = ~get_regression_summaries(.x)$adj_r_squared) %>% 
  select(-ID, -score) %>% 
  pivot_longer(cols = everything(), 
               names_to = "variable", 
               values_to = "adj_r_sq") %>% 
  slice_max(adj_r_sq)
  
  
### Student method
one_id <- lm(score ~ prof_ID, data = evals_train)
one_age <- lm(score ~ age, data = evals_train)
one_bty <- lm(score ~ bty_avg, data = evals_train)
one_gender <- lm(score ~ gender, data = evals_train)
one_ethnicity <- lm(score ~ ethnicity, data = evals_train)
one_language <- lm(score ~ language, data = evals_train)
one_rank <- lm(score ~ rank, data = evals_train)
one_outfit <- lm(score ~ pic_outfit, data = evals_train)
one_color <- lm(score ~ pic_color, data = evals_train)
one_completion <- lm(score ~ eval_completion, data = evals_train)
one_large <- lm(score ~ large_class, data = evals_train)

get_regression_summaries(one_id)
get_regression_summaries(one_age)
get_regression_summaries(one_bty)
get_regression_summaries(one_gender)
get_regression_summaries(one_ethnicity)
get_regression_summaries(one_language)
get_regression_summaries(one_rank)
get_regression_summaries(one_outfit)
get_regression_summaries(one_color)
get_regression_summaries(one_completion)
get_regression_summaries(one_large)

## 0.038 top adj R-sq: add eval completion

## TWO VARIABLES

### Using map()
evals_train %>% 
  map(.f = ~lm(score ~ .x + eval_completion, data = evals_train)) %>% 
  map_df(.f = ~get_regression_summaries(.x)$adj_r_squared) %>% 
  select(-ID, -score, -eval_completion) %>% 
  pivot_longer(cols = everything(), 
               names_to = "variable", 
               values_to = "adj_r_sq") %>% 
  slice_max(adj_r_sq)

## 0.066 top adj R-sq: add pic color

### Student method
two_complete_id <- lm(score ~ eval_completion + prof_ID, data = evals_train)
two_complete_age <- lm(score ~ eval_completion + age, data = evals_train)
two_complete_bty <- lm(score ~ eval_completion + bty_avg, data = evals_train)
two_complete_gender <- lm(score ~ eval_completion + gender, data = evals_train)
two_complete_ethnicity <- lm(score ~ eval_completion + ethnicity, data = evals_train)
two_complete_language <- lm(score ~ eval_completion + language, data = evals_train)
two_complete_rank <- lm(score ~ eval_completion + rank, data = evals_train)
two_complete_outfit <- lm(score ~ eval_completion + pic_outfit, data = evals_train)
two_complete_color <- lm(score ~ eval_completion + pic_color, data = evals_train)
two_complete_large <- lm(score ~ eval_completion + large_class, data = evals_train)


get_regression_summaries(two_complete_id)
get_regression_summaries(two_complete_age)
get_regression_summaries(two_complete_bty)
get_regression_summaries(two_complete_gender)
get_regression_summaries(two_complete_ethnicity)
get_regression_summaries(two_complete_language)
get_regression_summaries(two_complete_rank)
get_regression_summaries(two_complete_outfit)
get_regression_summaries(two_complete_color)
get_regression_summaries(two_complete_large)

## THREE VARIABLES

evals_train %>% 
  map(.f = ~lm(score ~ .x + eval_completion + pic_color, data = evals_train)) %>% 
  map_df(.f = ~get_regression_summaries(.x)$adj_r_squared) %>% 
  select(-ID, -score, -eval_completion, -pic_color) %>% 
  pivot_longer(cols = everything(), 
               names_to = "variable", 
               values_to = "adj_r_sq") %>% 
  slice_max(adj_r_sq)

## 0.098 top adj R-sq: add gender

## THREE VARIABLES

evals_train %>% 
  map(.f = ~lm(score ~ .x + eval_completion + pic_color + gender, data = evals_train)) %>% 
  map_df(.f = ~get_regression_summaries(.x)$adj_r_squared) %>% 
  select(-ID, -score, -eval_completion, -pic_color, -gender) %>% 
  pivot_longer(cols = everything(), 
               names_to = "variable", 
               values_to = "adj_r_sq") %>% 
  slice_max(adj_r_sq)

## 0.112 for both age and bty_avg

## FOUR VARIABLES -- CHOOSING AGE

evals_train %>% 
  map(.f = ~lm(score ~ .x + eval_completion + pic_color + gender + age, data = evals_train)) %>% 
  map_df(.f = ~get_regression_summaries(.x)$adj_r_squared) %>% 
  select(-ID, -score, -eval_completion, -pic_color, -gender, -age) %>% 
  pivot_longer(cols = everything(), 
               names_to = "variable", 
               values_to = "adj_r_sq") %>% 
  slice_max(adj_r_sq)

## 0.131 for rank

## FIVE VARIABLES

evals_train %>% 
  map(.f = ~lm(score ~ .x + eval_completion + pic_color + gender + rank, data = evals_train)) %>% 
  map_df(.f = ~get_regression_summaries(.x)$adj_r_squared) %>% 
  select(-ID, -score, -eval_completion, -pic_color, -gender, -rank) %>% 
  pivot_longer(cols = everything(), 
               names_to = "variable", 
               values_to = "adj_r_sq") %>% 
  slice_max(adj_r_sq)

## 0.131 for age -- DONE!


## FOUR VARIABLES -- CHOOSING BEAUTY

evals_train %>% 
  map(.f = ~lm(score ~ .x + eval_completion + pic_color + gender + bty_avg, data = evals_train)) %>% 
  map_df(.f = ~get_regression_summaries(.x)$adj_r_squared) %>% 
  select(-ID, -score, -eval_completion, -pic_color, -gender, -bty_avg) %>% 
  pivot_longer(cols = everything(), 
               names_to = "variable", 
               values_to = "adj_r_sq") %>% 
  slice_max(adj_r_sq)

## 0.121 for ethnicity and language
## Needs to be 0.132 


### FINAL MODEL 

top_model <- lm(score ~ eval_completion + pic_color + gender + age + rank, data = evals_train)

evals_test %>% 
  mutate(predictions = predict(top_model, newdata = evals_test), 
         residuals = score - predictions) %>%
  summarize(RMSE = sd(residuals))
