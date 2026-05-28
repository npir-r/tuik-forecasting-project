# Accuracy measures script
# Bias, MAD, MSE, MAPE, RSFE, Tracking Signal
calc_accuracy <- function(actual, fitted) {
  errors <- actual - fitted
  bias  <- mean(errors, na.rm = TRUE)
  mad   <- mean(abs(errors), na.rm = TRUE)
  mse   <- mean(errors^2, na.rm = TRUE)
  mape  <- mean(abs(errors / actual) * 100, na.rm = TRUE)
  rsfe  <- sum(errors, na.rm = TRUE)
  ts    <- rsfe / mad
  return(list(bias=bias, mad=mad, mse=mse, mape=mape, rsfe=rsfe, tracking_signal=ts))
}
