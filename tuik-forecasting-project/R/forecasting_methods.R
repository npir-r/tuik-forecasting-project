# forecasting_methods.R
# Tum tahmin yontemlerini uygular

library(forecast)
library(zoo)

apply_naive <- function(df) {
  fc <- c(NA, head(df$cci, -1))
  list(fitted = fc, next_val = tail(df$cci, 1))
}

apply_ma <- function(df, k=3) {
  ma  <- rollmean(df$cci, k=k, fill=NA, align="right")
  fc  <- c(NA, head(ma, -1))
  list(fitted = fc, next_val = mean(tail(df$cci, k)))
}

apply_wma <- function(df, w=c(1/6,2/6,3/6)) {
  n  <- nrow(df)
  fc <- rep(NA, n)
  for(i in 4:n) fc[i] <- sum(w * df$cci[(i-3):(i-1)])
  list(fitted = fc, next_val = sum(w * tail(df$cci, 3)))
}

apply_es <- function(ts_obj, alpha=0.3) {
  model <- ses(ts_obj, alpha=alpha, h=1)
  list(fitted   = as.numeric(fitted(model)),
       next_val = as.numeric(forecast(model)$mean[1]))
}

apply_holt <- function(ts_obj, alpha=0.3, beta=0.1) {
  model <- holt(ts_obj, alpha=alpha, beta=beta, h=1)
  list(fitted   = as.numeric(fitted(model)),
       next_val = as.numeric(forecast(model)$mean[1]))
}

apply_linear_trend <- function(df) {
  model <- lm(cci ~ t, data=df)
  list(fitted   = fitted(model),
       next_val = predict(model, newdata=data.frame(t=nrow(df)+1)))
}

apply_regression <- function(df) {
  df$month_f <- factor(month(df$period))
  model <- lm(cci ~ t + month_f, data=df)
  new   <- data.frame(t=nrow(df)+1, month_f=factor(2, levels=1:12))
  list(fitted   = fitted(model),
       next_val = predict(model, newdata=new))
}
