# Full ebird data from gbif for Raleigh (up to 2023)

ebird <- read.csv('./data/0000672-241007104925546.csv', header = T, sep = '\t')

summary(ebird)

library(dplyr)

colnames(ebird)

ebird %>%
  distinct(locality)

ebird_short <- ebird %>%
  select(scientificName, locality, occurrenceStatus, individualCount, decimalLatitude, decimalLongitude, eventDate, day, month, year, identifiedBy)

ebird_short %>%
  filter(year == 2023) %>%
  group_by(locality) %>%
  summarise(N = sum(individualCount, na.rm = T), richness = n_distinct(scientificName)) %>%
  arrange(-richness) %>% 
  print(n = 100)

ebird_short %>%
  filter(locality == 'Lake Crabtree County Park') %>%
  head()

ebird %>%
  distinct(species)

head(ebird)

