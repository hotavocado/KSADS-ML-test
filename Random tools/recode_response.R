#changing data dictionary to have only reponse types in mindlogger
library(tidyverse)

setwd("/Users/mike.xiao/KSADS-ML-test/")

datadic <- read_csv("KSADS_DataDictionary_nocond.csv")

table(datadic$`Field Type`)

datadic <- datadic %>% mutate(`Field Type` = recode(`Field Type`,
                                                     calc = 'text',
                                                     checkbox = 'multiple',
                                                     descriptive = 'text',
                                                     dropdown = 'multiple',
                                                     notes = "text"
                                                     ))

table(datadic$`Field Type`)


write_csv(datadic, "KSADS_DataDictionary_test.csv")
