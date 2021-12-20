library("psych")# описательные статистики

library("lmtest") # тестирование гипотез в линейных моделях

library("ggplot2")# графики

library("dplyr") # манипуляции с данными

library ("MASS") # подгонка распределений

data("longley")
d<-longley
qplot(data = d, Unemployed, xlab="Количество безработных людей", ylab="Число",main="Данные о ВНП")
qplot(data = d, Armed.Forces, xlab="Количество людей в вооруженных силах", ylab="Число",main="Данные о ВНП")
qplot(data = d, Population, xlab="«Неинституционализированное» население старше 14 лет.", ylab="Число",main="Данные о ВНП")

ggplot() + geom_point(aes(x=d$Unemployed, y=d$Armed.Forces), size = 2) + theme_bw(base_size = 18) + xlab("Количество безработных людей") + ylab("Количество людей в вооруженных силах") + labs(title = "Корреляционное поле") 

ggplot() + geom_point(aes(x=d$Unemployed, y=d$Population), size = 2) + theme_bw(base_size =+ 18) + xlab("Количество безработных людей") + ylab("«Неинституционализированное» население старше 14 лет") + labs(title = "Корреляционное поле") 

ggplot() + geom_point(aes(x=d$Armed.Forces, y=d$Population), size = 2) + theme_bw(base_size =+ 18) + xlab("Количество людей в вооруженных силах") + ylab("«Неинституционализированное» население старше 14 лет") + labs(title = "Корреляционное поле") 

model <- lm(data=d, Unemployed~Armed.Forces)
model$coefficients

model2 <- lm(data=d, Unemployed~Population)
model2$coefficients

model3 <- lm(data=d, Armed.Forces~Population)
model3$coefficients


qplot(data = d, Unemployed, Armed.Forces) + stat_smooth(method="lm", level = 0.95) + theme_bw(base_size = 18)
`geom_smooth()` using formula 'y ~ x'
qplot(data = d, Unemployed, Population) + stat_smooth(method="lm", level = 0.95) + theme_bw(base_size = 18)
`geom_smooth()` using formula 'y ~ x'
qplot(data = d, Armed.Forces, Population) + stat_smooth(method="lm", level = 0.95) + theme_bw(base_size = 18)
`geom_smooth()` using formula 'y ~ x'

RSS <- deviance(model)
RSS2 <- deviance(model2)
RSS3 <- deviance(model3)

TSS <- sum((stack.loss-mean(stack.loss))^2)

predict(model,nd)
predict(model2,nd2)
predict(model3,nd3)

pairs(d , panel =  panel.smooth)
cor(d)

model11 <- lm(data=d, Unemployed~Armed.Forces+Population)

ggpairs(model11 , panel =  panel.smooth)

summary(model11)


nd11 <- data.frame(Unemployed=221,Armed.Forces =180, Population=125)
predict(model11,nd11)
