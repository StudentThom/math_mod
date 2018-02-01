# qqplot

x <- rbeta(42000,0.89,2.59)
y <- rbeta(58000,2.32,1.16)

z <- c(x,y)

qqplot(allp$p4,z,xlab="P-waarden uit dataset4",ylab="Mengselverdeling",main="QQ plot")

