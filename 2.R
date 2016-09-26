
gapminder <- read.csv("data/gapminder-FiveYearData.csv")

calcPBI <- function(dat, year=NULL, country=NULL) {
if (!is.null(year)) {
dat <- dat[dat$year %in% year, ]
}
if (!is.null(country)) {
dat <- dat[dat$country %in% country,]
}
gdp <- dat$pop * dat$gdpPercap
new <- cbind(dat, gdp = gdp)
return(new)
}

conPBI <- calcPBI(gapminder)
ddply(.data = conPBI,
      .variables = "continent",
      .fun = function(dat) mean(dat$gdp))


conPBI <- calcPBI(gapminder)
daply(.data = conPBI,
      .variables = c("continent","year"),
      .fun = function(dat) mean(dat$gdp))

d_ply(
  .data = gapminder,
  .variables = "continent",
  .fun = function(x) {
    meanGDPperCap <- mean(x$gdpPercap)
    print(paste(
      "The mean GDP per capita for", unique(x$continent),
      "is", format(meanGDPperCap, big.mark = ",")
    ))
  }
)

lifeExp_continent_year <- ddply(
  .data = gapminder,
  .variables = c("continent", "year"),
  .fun = function(x) {
    meanlifeExp <- mean(x$lifeExp)
          }
)

lifeExp_continent_year[lifeExp_continent_year$year %in% c(1952, 2007), ]
lifeExp_continent_1952 <- lifeExp_continent_year[lifeExp_continent_year$year==1952, ]
lifeExp_continent_2007 <- lifeExp_continent_year[lifeExp_continent_year$year==2007, ]



ddply(lifeExp_continent_year, .(continent), function(x) x[x$year == 2007, "V1"] - x[x$year == 1952, "V1"])
