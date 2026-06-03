# accuracy_measures.R
# Tahmin dogruluk olcutlerini hesaplar

calc_accuracy <- function(actual, forecast) {
  errors <- actual - forecast
  bias   <- mean(errors,      na.rm = TRUE)
  mad    <- mean(abs(errors), na.rm = TRUE)
  mse    <- mean(errors^2,    na.rm = TRUE)
  mape   <- mean(abs(errors / actual) * 100, na.rm = TRUE)
  rsfe   <- sum(errors,       na.rm = TRUE)
  ts_val <- rsfe / mad
  list(Bias=round(bias,2), MAD=round(mad,2), MSE=round(mse,2),
       MAPE=round(mape,2), RSFE=round(rsfe,2), TS=round(ts_val,2))
}
