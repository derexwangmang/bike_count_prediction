# bike_count_prediction

Predicting the number of bikes rented in Seoul

## Purpose

The purpose of this project is to predict the number of bikes rented in Seoul. If Seoul Bike, the company behind Seoul's publicly rented bike system, can accurately forecast the demand, it can then better supply their customers.

## Dataset

The dataset comes from the University of California at Irvine’s Machine Learning Repository, found [here](https://archive.ics.uci.edu/ml/datasets/Seoul+Bike+Sharing+Demand).

## Methology

Steps for this data analysis project included the following:

1. Data Retrieval
2. Initial Data Processing
3. Exploratory Data Analysis with Secondary Data Processing
4. Data Modeling

## Findings

I trained and tuned the following models:

* Linear regression
* Elastic net
  * Ridge regression
  * Lasso regression
  * Generalized Elastic Net
* Random forest
* Boosted tree
* Nearest neighbor

Of these, random forest model and the boosted tree performed the best when assessed on the training dataset with k-fold repeated cross-validation. When evaluated on the testing dataset, the random forest model and the boosted tree had Root Mean Square Errors (RMSE) of 228 and 229. The full report can be found [here](https://github.com/derexwangmang/bike_count_prediction/tree/main/output/report/report.pdf).
