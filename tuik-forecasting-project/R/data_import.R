# data_import.R
# TÜ\u130K Construction Cost Index verisini tuikr ile çeker

library(tuikr)
library(httr)
library(readxl)
library(tidyverse)
library(lubridate)

get_cci_data <- function() {
  tables  <- statistical_tables(theme = 6)
  cci_url <- tables$table_url[
    grepl("Construction Cost Index.*2015.*Rate", tables$table_name, ignore.case = TRUE)
  ][1]
  
  response <- GET(
    cci_url,
    add_headers(
      "User-Agent" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36",
      "Referer"    = "https://veriportali.tuik.gov.tr/",
      "Accept"     = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    ),
    write_disk("cci_raw.xls", overwrite = TRUE)
  )
  
  df_raw   <- read_xls("cci_raw.xls", col_names = FALSE)
  row_2015 <- which(df_raw[[1]] == "2015")[1]
  row_2026 <- which(df_raw[[1]] == "2026")[1]
  
  df_index <- df_raw[row_2015:row_2026, 1:13]
  colnames(df_index) <- c("year","Jan","Feb","Mar","Apr","May","Jun",
                           "Jul","Aug","Sep","Oct","Nov","Dec")
  
  df_long <- df_index %>%
    mutate(year = as.integer(year)) %>%
    pivot_longer(cols = Jan:Dec, names_to = "month", values_to = "cci") %>%
    mutate(
      month_num = match(month, c("Jan","Feb","Mar","Apr","May","Jun",
                                  "Jul","Aug","Sep","Oct","Nov","Dec")),
      period    = ym(paste(year, month_num, sep = "-")),
      cci       = as.numeric(cci)
    ) %>%
    filter(!is.na(cci)) %>%
    arrange(period) %>%
    select(period, cci)
  
  return(df_long)
}
