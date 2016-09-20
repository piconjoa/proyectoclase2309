mi_suma <- function(a, b) {
  suma <- a + b
  return(suma)
}

kelvin_a_fahr <- function(temp) {
  fahr <- (temp - 273.15) * (9/5) + 32
  return(fahr)
}
kelvin_a_fahr(300)

celsius_a_kelvin <- function(temp) {
  kelvin <- (temp + 273.15)
   return(kelvin)
}

celsius_a_fahr <- function(temp) {
  temp <- celsius_a_kelvin(temp)
  fahr <- kelvin_a_fahr(temp)
  return(fahr)
}

# Toma el set de datos y multiplica la columna 
# población por PBI per capita
calcPBI <- function(dat) {
  pbi <- dat$pop * dat$gdpPercap
  pbi
}
gapminder <- read.csv("E:/Curso R/Proyecto clase 1/data/gapminder-FiveYearData.csv")

# Toma el set de datos y multiplica la columna 
# población por PBI per capita

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

head(calcPBI(gapminder, year = 2007))

head(calcPBI(gapminder, country = "Argentina"))


mejores_practicas <- c("Escribe", "programas", "para", "personas", 
                       "no", "para", "computadoras")
paste(mejores_practicas, collapse = " ")
envoltura < ("***")
#' Title
#'
#' @param texto 
#' @param envoltura 
#'
#' @return
#' @export
#'
#' @examples
vallar <- function(texto = mejores_practicas, envoltura = "***") {
  paste(envoltura, mejores_practicas, envoltura, collapse = " ")
}
  

vallar(mejores_practicas,"***")


vallar <- function(texto = mejores_practicas, envoltura = "***") {
  paste0(envoltura, texto, envoltura)
}
vallar(mejores_practicas,"+++")


library(ggplot2)
pdf("Life_Exp_vs_time.pdf", width=12, height=4)
ggplot (data = gapminder, aes(x = year, y = lifeExp, colour = country)) +
  geom_line ()

# ¡Acordarse de apagar el dispositivo!

dev.off()
