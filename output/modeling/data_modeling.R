# Data Modeling

# Packages and Seed -------------------------------------------------------

# library(tidyverse)
# library(tidymodels)
# 
# set.seed(7985)
# 
# load("data/processed/seoul_bike_data.rda")


# Data Splitting ----------------------------------------------------------

# bike_split <- initial_split(bike, prop = 0.7, strata = rented_bike_count)
# bike_train <- training(bike_split)
# bike_test <- testing(bike_split)


# Data Folds --------------------------------------------------------------

# bike_folds <- vfold_cv(bike_train, v = 10, repeats = 5)


# Data Recipe -------------------------------------------------------------

# bike_recipe_non_hot <- recipe(rented_bike_count ~ ., bike_train) %>%
#   step_dummy(all_nominal()) %>%
#   step_normalize(all_predictors())
# 
# bike_recipe <- recipe(rented_bike_count ~ ., bike_train) %>%
#   step_dummy(all_nominal(), one_hot = T) %>%
#   step_normalize(all_predictors())


# Models ------------------------------------------------------------------

# lm_model <- linear_reg() %>%
#   set_engine("lm")
# 
# ridge_model <- linear_reg(penalty = tune(),
#                           mixture = 0) %>%
#   set_engine("glmnet")
# 
# lasso_model <- linear_reg(penalty = tune(),
#                           mixture = 1) %>%
#   set_engine("glmnet")
# 
# elastic_model <- linear_reg(penalty = tune(),
#                             mixture = tune()) %>%
#   set_engine("glmnet")
# 
# rf_model <- rand_forest(mode = "regression",
#                         min_n = tune(),
#                         mtry = tune()) %>% 
#   set_engine("ranger")
# 
# bt_model <- boost_tree(mode = "regression",
#                        mtry = tune(),
#                        min_n = tune(),
#                        learn_rate = tune()) %>%
#   set_engine("xgboost")
# 
# nn_model <- nearest_neighbor(mode = "regression",
#                              neighbors = tune()) %>%
#   set_engine("kknn")


# Parameters --------------------------------------------------------------

# ridge_params <- parameters(ridge_model) %>%
#   update(penalty = penalty(range = c(-5, 2)))
# ridge_grid <- grid_regular(ridge_params, levels = 50)
# 
# lasso_params <- parameters(lasso_model) %>%
#   update(penalty = penalty(range = c(-5, 2)))
# lasso_grid <- grid_regular(lasso_params, levels = 50)
# 
# elastic_params <- parameters(elastic_model) %>%
#   update(penalty = penalty(range = c(-5, 2)),
#          mixture = mixture(range = c(0, 1)))
# elastic_grid <- grid_regular(elastic_params, levels = 50)
# 
# rf_params <- parameters(rf_model) %>%
#   update(mtry = mtry(range = c(2, 9)))
# rf_grid <- grid_regular(rf_params, levels = 5)
# 
# bt_params <- parameters(bt_model) %>%
#   update(mtry = mtry(range = c(2, 9)),
#          learn_rate = learn_rate(range = c(-1, -0.1)))
# bt_grid <- grid_regular(bt_params, levels = 5)
# 
# nn_params <- parameters(nn_model)
# nn_grid <- grid_regular(nn_params, levels = 5)


# Workflows ---------------------------------------------------------------

# lm_workflow <- workflow() %>%
#   add_recipe(bike_recipe_non_hot) %>%
#   add_model(lm_model)
# 
# ridge_workflow <- workflow() %>%
#   add_recipe(bike_recipe_non_hot) %>%
#   add_model(ridge_model)
# 
# lasso_workflow <- workflow() %>%
#   add_recipe(bike_recipe_non_hot) %>%
#   add_model(lasso_model)
# 
# elastic_workflow <- workflow() %>%
#   add_recipe(bike_recipe_non_hot) %>%
#   add_model(elastic_model)
# 
# rf_workflow <- workflow() %>%
#   add_recipe(bike_recipe) %>%
#   add_model(rf_model)
# 
# bt_workflow <- workflow() %>%
#   add_model(bt_model) %>%
#   add_recipe(bike_recipe)
# 
# nn_workflow <- workflow() %>%
#   add_model(nn_model) %>%
#   add_recipe(bike_recipe)


# Tuning ------------------------------------------------------------------

# lm_fit <- fit_resamples(lm_workflow, bike_folds)
# write_rds(lm_fit, "lm_fit.Rds")
# 
# ridge_tuned <- ridge_workflow %>%
#   tune_grid(bike_folds, grid = ridge_grid)
# write_rds(ridge_tuned, "ridge_tuned.Rds")
# 
# lasso_tuned <- lasso_workflow %>%
#   tune_grid(bike_folds, grid = lasso_grid)
# write_rds(lasso_tuned, "lasso_tuned.Rds")
# 
# elastic_tuned <- elastic_workflow %>%
#   tune_grid(bike_folds, grid = elastic_grid)
# write_rds(elastic_tuned, "elastic_tuned.Rds")
# 
# rf_tuned <- rf_workflow %>%
#   tune_grid(bike_folds, grid = rf_grid)
# write_rds(rf_tuned, "rf_tuned.Rds")
# 
# bt_tuned <- bt_workflow %>% 
#   tune_grid(bike_folds, grid = bt_grid)
# write_rds(bt_tuned, "bt_tuned.Rds")
# 
# nn_tuned <- nn_workflow %>%
#   tune_grid(bike_folds, grid = nn_grid)
# write_rds(nn_tuned, "nn_tuned.Rds")
