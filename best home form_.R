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
#how does Arsenal broadly fare
ars_h <- filter(e18, HomeTeam=="Arsenal") 
ars_a <- filter(e18, AwayTeam=="Arsenal") 
#how many more goals to arsenal score than their opposition at home
sum (ars_h$FTHG - ars_h$FTAG) #26 more
  #and away?
sum (ars_a$FTAG - ars_a$FTHG) #4 less

#select non-gambling columns
e18_no_g <- select(e18, Div:AR)

#only home variables
e18_h <- select(e18, starts_with('H'), -HTAG, Referee, FTR)
colnames(e18_h)
