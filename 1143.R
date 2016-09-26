install.packages("tidyr")
install.packages("dplyr")
install.packages("GGally")
library(tidyr)
library(dplyr)
library(GGally)
library(ggplot2)


gapminder <- read.csv("data/gapminder-FiveYearData.csv")
str(gapminder)


ggpairs(gapminder,
        columns = c(3, 5, 6),
        colour= "continent")

gap_wide <- read.csv("http://bit.ly/gap_wide", stringsAsFactors = FALSE)

str(gap_wide)
View(gap_wide)

gap_long <- gap_wide %>%
  gather(obstype_year,obs_values, starts_with('pop'), starts_with('lifeExp'), starts_with('gdpPercap'))
str(gap_long)

gap_long <- gap_wide %>% gather(obstype_year,obs_values,-continent,-country)
str(gap_long)

gap_long <- gap_long %>% 
  separate(obstype_year, into = c('obs_type','year'), sep = "_")
gap_long$year <- as.integer(gap_long$year)

gap_long_bycontinents <- gap_long %>%
  group_by(continent, obs_type) %>%
  summarize(mean_obs = mean(obs_values))
View(gap_long_bycontinents)

gap_aov <- gap_long %>%
  group_by(obs_type) %>%
  do(aov = aov(obs_values~continent, data = . ))
gap_aov_plyr <- dlply(gap_long, .(obs_type), 
          function(x)
          aov(obs_value ~ continent * year, data = x))

gap_ridiculamente_ancho <- gap_long %>% 
  unite(var_names, country, obs_type, year, sep="_") %>% 
  spread(var_names,obs_values)
View(gap_ridiculamente_ancho)


