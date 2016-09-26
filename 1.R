library("dplyr")
year_country_gdp <- select(gapminder,year,country,gdpPercap)

lifeExp_country_year_africa <- gapminder %>%
  filter(continent == "Africa") %>%
  select(lifeExp, country, year)
lifeExp_country_year_africa


lifeExp_bycountry <- gapminder %>%
  group_by(country) %>%
  summarise(mean_lifeExp = mean(lifeExp))


lifeExp_bycountry[which.min(lifeExp_bycountry$mean_lifeExp), ]
lifeExp_bycountry[which.max(lifeExp_bycountry$mean_lifeExp), ]
lifeExp_bycountry %>% filter(mean_lifeExp %in% range(mean_lifeExp))

lifeExp_2002 <- gapminder %>%
  filter(year == "2002") %>%
  group_by(continent) %>%
  sample_n(2) %>%
  summarize(mean_lifeExp = mean(lifeExp))
  
lifeExp_2002
