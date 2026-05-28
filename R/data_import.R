# Data import script
library(tuikr)
library(httr)
library(readxl)

tables_price <- statistical_tables(theme = '6')
url_cci <- tables_price$table_url[tables_price$table_name == 'Construction Cost Index (2015=100) and Rate of Change ']
response_cci <- GET(url_cci, add_headers('User-Agent' = 'Mozilla/5.0', 'Referer' = 'https://veriportali.tuik.gov.tr/'))
raw_cci <- content(response_cci, as = 'raw')
tmp_cci <- tempfile(fileext = '.xls')
writeBin(raw_cci, tmp_cci)
df_cci <- read_excel(tmp_cci)
