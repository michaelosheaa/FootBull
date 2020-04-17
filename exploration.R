
#begin
#what does it look like?
summary(e18)
head(e18)
#how does Arsenal broadly fare
ars_h <- filter(e18, HomeTeam=="Arsenal") 
ars_a <- filter(e18, AwayTeam=="Arsenal") 
#how many more goals do arsenal score than their opposition at home
sum(ars_h$FTHG - ars_h$FTAG) #26 more
  #and away?
sum(ars_a$FTAG - ars_a$FTHG) #4 less

#select non-gambling columns
e18_no_g <- select(e18, Div:AR)

#only home variables
e18_h <- select(e18, starts_with('H'), -HTAG, Referee, FTR)
colnames(e18_h)

unique(e18$Referee)

e18 %>%
  group_by(Referee, HomeTeam) %>% 
  summarise(Freq=n()) %>% 
  arrange(desc(Freq)) 

p <- e18 %>%
  ggplot(aes(x = HomeTeam, ..count..)) + 
  geom_bar(aes(fill = Referee))
p
#refs seem fairly distributed across teams

#shouldve done this immediately:
e18 <- e18 %>%
  clean_names()

#referee and cards
  #home team
e18 %>%
  group_by(referee) %>% 
  summarise(hf = mean(hf), 
            af = mean(af)) %>%
  ungroup() %>%
  mutate(home_pref = af-hf) %>%
  select(referee, hf, af, home_pref) %>%
  arrange(desc(home_pref))
# while East generally preferences the away team, Coote shows a home bias
    # how to investigate this further...

e18 %>%
  filter(referee == "D Coote") %>%
  select(home_team, hf, away_team, af)
