
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

one_id <- lm(score ~ prof_ID, data = evals_train)
one_age <- lm(score ~ age, data = evals_train)
one_bty <- lm(score ~ bty_avg, data = evals_train)
one_gender <- lm(score ~ gender, data = evals_train)
one_ethnicity <- lm(score ~ ethnicity, data = evals_train)
one_language <- lm(score ~ language, data = evals_train)
one_rank <- lm(score ~ language, data = evals_train)
one_outfit <- lm(score ~ language, data = evals_train)
one_color <- lm(score ~ language, data = evals_train)
one_completion <- lm(score ~ language, data = evals_train)
one_large <- lm(score ~ language, data = evals_train)

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

## 0.034 top adj R-sq: add bty

## TWo VARIABLES