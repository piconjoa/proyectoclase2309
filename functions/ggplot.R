library(ggplot2)
pdf ("Life_Exp_vs_time.pdf", width=12, height=12, onefile = TRUE)
for(continent in levels(gapminder$continent)){
  print(ggplot (data = gapminder[gapminder$continent == continent, ], aes(x = year, y = lifeExp, colour = country)) +
          geom_line () + facet_grid(continent~ . ) +
        theme(legend.position = "bottom"))
}

# ¡Acordarse de apagar el dispositivo
dev.off()


aust_subset <- gapminder[gapminder$country == "Australia", ]
write.table(aust_subset, file="cleaned-data/gapminder-aus.csv", sep=",", row.names = FALSE,  quote = FALSE)

post90_subset <- gapminder[gapminder$year >= 1990, ]
write.table(post90_subset, file="cleaned-data/gapminder-post90.csv", sep=",", row.names = FALSE,  quote = FALSE)

pdf ("Life_Exp_vs_time.pdf", width=12, height=12, onefile = TRUE)
for(continent in levels(post90_subset$continent)){
  print(ggplot (data = post90_subset[post90_subset$continent == continent, ], aes(x = year, y = lifeExp, colour = country)) +
          geom_line () + facet_grid(continent~ . ) +
          theme(legend.position = "bottom"))
}

# ¡Acordarse de apagar el dispositivo
dev.off()
