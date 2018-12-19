
# Load pkgs and custom functions
library("here")
library("tidyverse")
library("stringr")
library("devtools")
devtools::source_gist("https://gist.github.com/ajpelu/cba6f5abf862d93faf4cf671a6910159", filename = "digiereClima.R")


# List all files
w_files <- list.files(here::here('data_raw/prec_diaria_wimmed/'), pattern = "*.txt")

# Apply the function over the list of files 
p <- here::here("data_raw/prec_diaria_wimmed/")

out <- w_files %>% 
  map(function(x) digestWimmedPrec(path = p, name_f = x)) %>% 
  transpose()

stations <- out$station_md %>% 
  reduce(rbind) %>% 
  as.data.frame() %>% 
  mutate_at(vars(ends_with("date")), .funs = funs(as.Date(., format = "%Y-%m-%d"))) %>% 
  mutate_at(.vars=("variable"), .funs = funs(as.character(.)))

wim <- out$valores %>% 
  reduce(rbind) %>% 
  mutate(prec = case_when(
    prec == -9999 ~ NA_real_, 
    TRUE ~ prec
  ))


# Export data 
write.csv(stations, file = here::here("/data/prec/wimmed2015", "prec_wimmed_stations.csv"), row.names = FALSE)

write.csv(wim, file = here::here("/data/prec/wimmed2015", "prec_wimmed_data.csv"), row.names = FALSE)

# Test nodata
# nodata <- wim %>% filter(is.na(prec))







table(stations$variable)

