strikeouts <- read.csv("/Users/flannanbrody/github/dataviz-home/line-chart/strikeouts.csv")

head(strikeouts)

unique(strikeouts$g)

strikeouts$kpg <- strikeouts$so / strikeouts$g

subset(strikeouts, kpg == max(strikeouts$kpg))

oakland <- subset(strikeouts, franchise == "OAK")

oakland <- oakland[order(oakland$kpg, decreasing=T),]

plot(oakland$year, oakland$kpg)

plot(oakland$year, oakland$kpg, pch=16, col="red", main="Strikeouts per game: A's",
     xlab="Year", ylab="Ks per game", ylim=c(0, max(oakland$kpg)))

plot(oakland$year, oakland$kpg, pch=16, col="red", main="Strikeouts per game: A's",
     xlab="Year", ylab="Ks per game", type="l", lwd=2)

min <- subset(strikeouts, franchise == "MIN")

plot(min$year, min$kpg, pch=16, col="blue", main="Strikeouts per game: Minnesota", 
     xlab="Year", ylab="Ks per game", ylim=c(0, max(min$kpg)))







#first, the oakland scatterplot (with a new title)
plot(oakland$year, oakland$kpg, pch=16, col="red", main="Oakland vs Minnesota",
     xlab="Year", ylab="Ks per game", ylim=c(0, max(oakland$kpg)))

# now add the minnesota scatterplot.
# note the considerably fewer arguments
points(min$year, min$kpg, pch=16, col="blue")






#which is bigger, oakland or Minnesota's max KPG?
max_kpg <- max(c(max(oakland$kpg), min$kpg))

#oakland line chart
plot(oakland$year, oakland$kpg, col="red", main="Oakland vs Minnesota",
     xlab="Year", ylab="Ks per game", ylim=c(0, max_kpg), type="l", lwd=2)

# minnesota line.
lines(min$year, min$kpg, col="blue", lwd=2)





?aggregate

league_average <- aggregate(strikeouts$kpg, list(strikeouts$year), mean)

names(league_average) <- c("year", "meankpg")

plot(league_average$year, league_average$meankpg, col="orange", main="MLB mean strikeouts per game",
     xlab="Year", ylab="Ks per game", type="l", lwd=2)








plot(league_average$year, league_average$meankpg, col="grey", main="Oakland vs league average",
     xlab="Year", ylab="Ks per game", type="l", lwd=2, ylim=c(0, max(oakland$kpg)))

lines(oakland$year, oakland$kpg, col="red", lwd=2)

