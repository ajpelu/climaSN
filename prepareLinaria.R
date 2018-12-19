# Prepare Precipitation Data


library("here")
library("tidyverse")


# Read data from Linaria
precLinaria <- read.csv(file = here::here("/data_raw/prec_linaria.csv"), header = TRUE, sep = ";")


# How many stations 
n_stations <- length(unique(precLinaria$estacion))
n_stations 

# 

