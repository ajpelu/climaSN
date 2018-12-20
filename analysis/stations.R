# Get data from stations 


library("here")
library("devtools")
library("tidyverse")
library("lubridate")
library("ggrepel")
devtools::source_gist("https://gist.github.com/ajpelu/cba6f5abf862d93faf4cf671a6910159", filename = "digiereClima.R")



d <- digiereClima(xmlfile = here::here("data_raw/climateREDIAM_Dec2018.xml"))

stations <- d$station
stations

