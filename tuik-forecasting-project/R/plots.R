# plots.R
# Gercek vs tahmin grafikleri olusturur

library(ggplot2)

plot_forecast <- function(df, forecast_col, method_name, color, filename) {
  p <- ggplot(df, aes(x=period)) +
    geom_line(aes(y=cci,          color="Actual"),      linewidth=0.8) +
    geom_line(aes(y=.data[[forecast_col]], color=method_name), 
              linewidth=0.8, linetype="dashed") +
    scale_color_manual(values=c("Actual"="#2C3E50", setNames(color, method_name))) +
    labs(title=paste(method_name, "vs Actual"),
         x="Period", y="Index (2015=100)", color="") +
    theme_minimal()
  
  ggsave(paste0("outputs/figures/", filename), p, width=10, height=5)
  return(p)
}
