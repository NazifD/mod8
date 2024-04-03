rm(list=ls())
install.packages('gapminder')
library(gapminder)

latest_year <- max(gapminder$year)

#Box plots
boxplot(gdpPercap = continent, data = subset(gapminder, year == latest_year), main = "GDP per capita by continent (latest year)")
boxplot(lifeExp = continent, data = subset(gapminder, year == latest_year), main = "Life expectancy by continent (latest year)")

# Time series 
plot(tapply(gapminder$gdpPercap, list(gapminder$year, gapminder$continent), mean), xlab = "Year", ylab = "Mean GDP per capita", main = "Mean GDP per capita over time by continent", type = "l")
legend("topleft", legend = levels(gapminder$continent), lty = 1)

plot(tapply(gapminder$lifeExp, list(gapminder$year, gapminder$continent), mean), xlab = "Year", ylab = "Mean life expectancy", main = "Mean life expectancy over time by continent", type = "l")
legend("bottomright", legend = levels(gapminder$continent), lty = 1)

# Scatterplots of life expectancy vs GDP per capita
plot(gapminder$gdpPercap, gapminder$lifeExp, main = "Life expectancy vs GDP per capita", xlab = "GDP per capita", ylab = "Life expectancy", pch = 16, cex = gapminder$pop / 1e6)
legend("bottomright", legend = levels(gapminder$continent), pch = 16)

# Scatterplots with logarithmic transformations
plot(log(gapminder$gdpPercap), gapminder$lifeExp, main = "Life expectancy vs log(GDP per capita)", xlab = "log(GDP per capita)", ylab = "Life expectancy", pch = 16, cex = gapminder$pop / 1e6)
legend("bottomright", legend = levels(gapminder$continent), pch = 16)

plot(gapminder$gdpPercap, log(gapminder$lifeExp), main = "log(Life expectancy) vs GDP per capita", xlab = "GDP per capita", ylab = "log(Life expectancy)", pch = 16, cex = gapminder$pop / 1e6)
legend("bottomright", legend = levels(gapminder$continent), pch = 16)

ggsave("scatterplot_original.png", plot = p1, width = 10, height = 6)
ggsave("scatterplot_log.png", plot = p2, width = 10, height = 6)
png("boxplots.png", width = 800, height = 600)
png("time_series.png", width = 800, height = 600)

  
