rm(list=ls())
install.packages('gapminder')
library(gapminder)

# Get the latest year in the dataset
latest_year <- max(gapminder$year)

# Box plots (grouped by continent) for GDP per capita and life expectancy
boxplot(gdpPercap = continent, data = subset(gapminder, year == latest_year), main = "GDP per capita by continent (latest year)")
boxplot(lifeExp = continent, data = subset(gapminder, year == latest_year), main = "Life expectancy by continent (latest year)")

# Time series of mean GDP per capita and life expectancy by continent
plot(tapply(gapminder$gdpPercap, list(gapminder$year, gapminder$continent), mean), xlab = "Year", ylab = "Mean GDP per capita", main = "Mean GDP per capita over time by continent", type = "l")
legend("topleft", legend = levels(gapminder$continent), lty = 1)

plot(tapply(gapminder$lifeExp, list(gapminder$year, gapminder$continent), mean), xlab = "Year", ylab = "Mean life expectancy", main = "Mean life expectancy over time by continent", type = "l")
legend("bottomright", legend = levels(gapminder$continent), lty = 1)

# Scatterplots of life expectancy vs GDP per capita, colored by continent
plot(gapminder$gdpPercap, gapminder$lifeExp, main = "Life expectancy vs GDP per capita", xlab = "GDP per capita", ylab = "Life expectancy", pch = 16, cex = gapminder$pop / 1e6)
legend("bottomright", legend = levels(gapminder$continent), pch = 16)

# Scatterplots with logarithmic transformations
plot(log(gapminder$gdpPercap), gapminder$lifeExp, main = "Life expectancy vs log(GDP per capita)", xlab = "log(GDP per capita)", ylab = "Life expectancy", pch = 16, cex = gapminder$pop / 1e6)
legend("bottomright", legend = levels(gapminder$continent), pch = 16)

plot(gapminder$gdpPercap, log(gapminder$lifeExp), main = "log(Life expectancy) vs GDP per capita", xlab = "GDP per capita", ylab = "log(Life expectancy)", pch = 16, cex = gapminder$pop / 1e6)
legend("bottomright", legend = levels(gapminder$continent), pch = 16)

