df <- read.csv("scores3.csv")
head(df)
df <- na.omit(df)
d <- df[1:ncol(df)-1]
ggpairs(d)
ggpairs(d, 
        upper = list(continuous = wrap("cor", size = 3)),
        lower = list(continuous = wrap("points", size = 0.3)))
cor(d, method = "spearman")
pca <- prcomp(d, center = TRUE, scale = TRUE)
pca
pca$sdev
pca$rotation
summary(pca)
plot(pca, type = "l")
