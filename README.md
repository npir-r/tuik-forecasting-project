# T<U+00DC><U+0130>K Forecasting Project

## 1. Project Overview

This project forecasts the Construction Cost Index (2015=100) published by TurkStat (T<U+00DC><U+0130>K) using monthly time series data accessed directly through the tuikr R package.

## 2. Data Source and T<U+00DC><U+0130>K Connection

- T<U+00DC><U+0130>K data set name: Construction Cost Index
- T<U+00DC><U+0130>K theme/category: Price Statistics (Theme 6)
- T<U+00DC><U+0130>K table name: Construction Cost Index (2015=100) and Rate of Change
- tuikr Dataflow ID: NA - istab table accessed via tuikr::statistical_tables(), Theme 6
- Selected variable: Construction Cost Index (2015=100)
- Data frequency: Monthly
- Time coverage: 2015-01 / 2026-01
- Latest available observation: January 2026
- Forecast target period: February 2026
- Date of data access: 2026-05-28
- R package used for data access: tuikr
- Package source: https://github.com/emraher/tuikr

## 3. Research Objective

This project forecasts the monthly Construction Cost Index for Turkey. The CCI measures changes in construction input costs and is a key indicator of building sector inflation.

## 4. Use of T<U+00DC><U+0130>K Data in R

Data was accessed directly from T<U+00DC><U+0130>K via tuikr::statistical_tables(theme = '6'). No manually prepared data was used. The statistical_data() function returns HTTP 401; therefore the istab table URL was retrieved and data fetched via httr::GET() as approved by the instructor.

## 5. Exploratory Time Series Analysis

- Strong upward trend, especially from 2021 onward
- Weak seasonality relative to dominant trend
- No missing values
- Structural acceleration due to Turkish inflation

## 6. Forecasting Methods Applied

- Naive Forecasting
- Moving Average (3-month window)
- Weighted Moving Average (weights: 0.1, 0.3, 0.6)
- Exponential Smoothing (alpha=0.9)
- Trend-Adjusted Exponential Smoothing / Holt (alpha=0.9, beta=0.3)
- Linear Trend Projection
- Seasonal Indices (applied; weak seasonality noted)
- Additive Decomposition
- Multiplicative Decomposition
- Regression with Trend and Seasonal Dummy Variables

## 7. Forecast Accuracy Comparison

See outputs/tables/accuracy_comparison.csv for full table.

## 8. Selection of the Superior Method

Selected method: Trend-Adjusted Exponential Smoothing (Holts Method)

The series has a dominant upward trend with accelerating growth. Holts method explicitly models both level and trend, making it well-suited for this data. Alpha=0.9 gives high weight to recent observations, appropriate for rapidly changing inflation-driven index values.

## 9. Final Next-Period Forecast

- Superior method: Trend-Adjusted Exponential Smoothing (Holts)
- Data access date: 2026-05-28
- Latest available observation: January 2026 (Index: 2210.24)
- Forecast target period: February 2026
- Forecasted value: 2267.56

## 10. Interpretation

The CCI is forecast to reach approximately 2267.56 in February 2026, continuing the upward trend driven by inflation and rising construction material costs in Turkey.

## 11. Limitations

- Structural break around 2021-2022 due to high inflation
- Only 133 monthly observations available
- Seasonal patterns are weak
- External shocks cannot be captured by time series methods

## 12. Reproducibility

1. Install R 4.6.0 and RStudio
2. Install tuikr: pak::pak('emraher/tuikr')
3. Install packages: install.packages(c('httr','readxl','dplyr','tidyr','ggplot2','scales','forecast'))
4. Open forecasting_project.Rmd and click Knit

## 13. Repository Structure

tuik-forecasting-project/
<U+251C><U+2500><U+2500> README.md
<U+251C><U+2500><U+2500> forecasting_project.Rmd
<U+251C><U+2500><U+2500> forecasting_project.html
<U+251C><U+2500><U+2500> outputs/tables/ (accuracy_comparison.csv, final_forecast.csv)
<U+2514><U+2500><U+2500> outputs/figures/ (11 plot files)

## 14. Author

- Student name: Adiniz Soyadiniz
- Student number: Ogrenci Numaraniz
- Course name: Forecasting Methods
