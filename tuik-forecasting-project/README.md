# TÜu130K Forecasting Project — Construction Cost Index (2015=100)

## 1. Project Overview
This project forecasts the TÜu130K Construction Cost Index (2015=100) using monthly 
data from January 2015 to January 2026. Ten quantitative forecasting methods are 
applied and compared. The superior method is used to forecast February 2026.

## 2. Data Source and TÜu130K Connection
- TÜu130K dataset name: Construction Cost Index (2015=100) and Rate of Change
- TÜu130K theme/category: Price Statistics (Theme 6)
- TÜu130K table name: Construction Cost Index (2015=100) and Rate of Change
- Node type: istab
- Selected variable: Construction Cost Index (2015=100)
- Data frequency: Monthly
- Time coverage: 2015-01 to 2026-01
- Latest available observation: 2026-01 (January 2026)
- Forecast target period: 2026-02 (February 2026)
- R package used: tuikr — https://github.com/emraher/tuikr

## 3. Research Objective
The Construction Cost Index measures monthly changes in the cost of construction 
inputs in Turkey. Forecasting this index is valuable for construction firms, 
investors, and policymakers to anticipate cost pressures.

## 4. Use of TÜu130K Data in R
Data were accessed directly from the TÜu130K Data Portal using the tuikr package 
(statistical_tables()) and httr::GET() with browser headers. No manual 
download or external file was used. All filtering and formatting were performed 
within the R notebook.

## 5. Exploratory Time Series Analysis
- Strong upward trend throughout the series
- Mild monthly seasonality
- Structural break visible in 2021-2022 (inflation shock)
- No missing values in the selected series

## 6. Forecasting Methods Applied
- Naive Forecasting
- Moving Average (k=3)
- Weighted Moving Average (weights: 1/6, 2/6, 3/6)
- Exponential Smoothing (alpha=0.3)
- Trend-Adjusted Exponential Smoothing / Holt (alpha=0.3, beta=0.1)
- Linear Trend Projection
- Seasonal Indices
- Additive Decomposition
- Multiplicative Decomposition
- Regression with Trend and Seasonal Dummy Variables

## 7. Forecast Accuracy Comparison
See outputs/tables/accuracy_comparison.csv for full results.

## 8. Selection of the Superior Method
Regression with Trend and Seasonal Dummies was selected as the superior method.
The series exhibits both a strong trend and seasonal variation. This method 
explicitly models both components and shows no systematic bias.

## 9. Final Next-Period Forecast
- Superior method: Regression with Trend and Seasonal Dummies
- Latest available observation: January 2026
- Forecast target period: February 2026
- See outputs/tables/final_forecast.csv for the forecasted value

## 10. Interpretation of Results
The Construction Cost Index has risen dramatically since 2021 due to inflation 
pressures in Turkey. The regression model captures this trend along with seasonal 
patterns, providing a reliable short-term forecast for February 2026.

## 11. Limitations
- Extreme inflation after 2021 creates structural breaks not explicitly modeled
- Linear trend assumption may underfit the exponential growth phase
- Only 12 complete seasonal cycles available
- Forecast reliability decreases for horizons beyond one period

## 12. Reproducibility
1. Install R (>= 4.0) and RStudio
2. Install packages: tuikr, tidyverse, forecast, httr, readxl, zoo, TTR, knitr, kableExtra, lubridate
3. Install tuikr: remotes::install_github("emraher/tuikr")
4. Open forecasting_project.Rmd and click Knit
5. All data are fetched directly from TUIK — no manual file needed

## 13. Repository Structure
tuik-forecasting-project/
├── README.md
├── forecasting_project.Rmd
├── forecasting_project.html
├── outputs/
│   ├── tables/
│   │   ├── accuracy_comparison.csv
│   │   └── final_forecast.csv
│   └── figures/
└── R/

## 14. Author
- Name: Nazlı Pirim
- Student Number: 138722015
- Course: Quantitative Analysis for Decision Making
