rdu <- read.csv("rdu.july.csv")
oldpar  =  par(mar = c(5, 4, 4, 4) + 0.1)
plot(High ~ Day, ylim = range(c(High, Low)),
     xlim = c(1,31), data = rdu,
     axes = FALSE, type = "l", col = "red",
     xlab = "", ylab = "")
### draw a box
box()
axis(1, at = 1:31)
axis(2)
### and the title and axis labels
title(xlab = "Day")
title(ylab = expression(paste("Degrees Fahrenheit (",
                              phantom( )^{o},"F)"))) 
oldpar = par(mar = c(5, 4, 4, 4) + 0.1)
plot(High ~ Day, ylim = range(c(High, Low)),
     xlim = c(1,31), data = rdu,
     axes = FALSE, type = "l", col = "red",
     xlab = "", ylab = "")

lines(rdu$Day, rdu$Low, col = "blue")
degC.labels =
  pretty(range((c(rdu$High, rdu$Low) - 32)*5/9))
degC.tickpos = degC.labels*9/5 + 32
axis(4, at = degC.tickpos, labels = degC.labels)
mtext(expression(paste("Degrees centigrade (",
                       phantom( )^{o},"C)")), side = 4, line = 3)

temp.min = c(which.min(rdu$Low), min(rdu$Low))
year.min = rdu$Year[temp.min[1]]
temp.max = c(which.max(rdu$High), max(rdu$High))
year.max = rdu$Year[temp.max[1]]
text(temp.min[1], temp.min[2], year.min,
     col="blue", adj = c(1,1))
text(temp.max[1], temp.max[2], year.max,
     col="red", adj = c(0,0))
points(c(temp.min[1], temp.max[1]),
       c(temp.min[2], temp.max[2]),
       pch = 20, col = c("blue", "red"))
title(main =
        "Record high and low temperatures for RDU")

