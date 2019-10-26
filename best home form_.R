setwd("~/GitHub/FootBull")
#load epl 18/19 file
e18<- read.csv("epl_season_1819.csv")
#libraries
library(tidyverse)
library(magrittr)

#begin
#what does it look like?
summary(e18)
head(e18)
