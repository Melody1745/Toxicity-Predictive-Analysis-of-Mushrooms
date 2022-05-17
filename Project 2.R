mushroom <- read.csv("data/agaricus-lepiota.data", header=FALSE)

# Library packages
library(sna)
library(psych)
library(corrplot)
library(corrgram)
library(factoextra)
library(rgl)
library(tidyverse)
library(class)
library(gmodels)
library(caret)

## Part1
# assign names to variables
mushroom.names = c("class", "cshape", "csurface", "ccolor", "bruises", "odor", "gattachment", "gspacing", "gsize", "gcolor", "sshape", "sroot", "ssar", "ssbr", "scar", "scbr", "vtype", "vcolor", "rnumber", "rtype", "spc", "population", "habitat")
names(mushroom) = mushroom.names

#Drop NAs, view the structure
mushroom <- replace(mushroom,mushroom == '?',NA)
mushroom <- na.omit(mushroom)


# plot the data
plot(mushroom)

# 2D relationship plot
ggplot(data = mushroom) + aes(y = `ssar`, x = `ssbr`) + geom_jitter()

#3D relationship plot
cshape_num = unclass(as.factor(mushroom$`cshape`))
ccolor_num = unclass(as.factor(mushroom$`cshape`))
csurface_num = unclass(as.factor(mushroom$`csurface`))
plot3d( 
  x=cshape_num, y=ccolor_num, z=csurface_num,
  type = 's', 
  radius = .1,
  xlab="cap shape", ylab="cap color", zlab="cap surface")

## Part 2
# convert character to number
mushroom.nc = mushroom[,-1]
convert_cshape= function(x) {
  A = factor(x, levels=c('x','b','s','f','k','c'))
  values = c(seq(10,150,10))
  values[A]
}
mushroom.nc['cshape'] = lapply(mushroom.nc['cshape'], convert_cshape)
convert_csurface= function(x) {
  A = factor(x, levels=c('s','y','f','g'))
  values = c(seq(10,150,10))
  values[A]
}
mushroom.nc['csurface'] = lapply(mushroom.nc['csurface'], convert_csurface)
convert_ccolor= function(x) {
  A = factor(x, levels=c('n','y','w','g','e','p','b','u','c','r'))
  values = c(seq(10,150,10))
  values[A]
}
mushroom.nc['ccolor'] = lapply(mushroom.nc['ccolor'], convert_ccolor)
convert_odor= function(x) {
  A = factor(x, levels=c('p','a','l','n','f','c','y','s','m'))
  values = c(seq(10,150,10))
  values[A]
}
mushroom.nc['odor'] = lapply(mushroom.nc['odor'], convert_odor)
convert_bruises= function(x) {
  A = factor(x, levels=c('t','f'))
  values = c(seq(10,150,10))
  values[A]
}
mushroom.nc['bruises'] = lapply(mushroom.nc['bruises'], convert_bruises)
convert_gattachment= function(x) {
  A = factor(x, levels=c('f','a'))
  values = c(seq(10,150,10))
  values[A]
}
mushroom.nc['gattachment'] = lapply(mushroom.nc['gattachment'], convert_gattachment)
convert_gspacing= function(x) {
  A = factor(x, levels=c('c','w'))
  values = c(seq(10,150,10))
  values[A]
}
mushroom.nc['gspacing'] = lapply(mushroom.nc['gspacing'], convert_gspacing)
convert_gsize= function(x) {
  A = factor(x, levels=c('n','b'))
  values = c(seq(10,150,10))
  values[A]
}
mushroom.nc['gsize'] = lapply(mushroom.nc['gsize'], convert_gsize)
convert_gcolor= function(x) {
  A = factor(x, levels=c('k','n','g','p','w','h','u','e','b','r','y','o'))
  values = c(seq(10,150,10))
  values[A]
}
mushroom.nc['gcolor'] = lapply(mushroom.nc['gcolor'], convert_gcolor)
convert_sshape= function(x) {
  A = factor(x, levels=c('e','t'))
  values = c(seq(10,150,10))
  values[A]
}
mushroom.nc['sshape'] = lapply(mushroom.nc['sshape'], convert_sshape)
convert_sroot= function(x) {
  A = factor(x, levels=c('e','c','b','r','?'))
  values = c(seq(10,150,10))
  values[A]
}
mushroom.nc['sroot'] = lapply(mushroom.nc['sroot'], convert_sroot)
convert_ssar= function(x) {
  A = factor(x, levels=c('s','f','k','y'))
  values = c(seq(10,150,10))
  values[A]
}
mushroom.nc['ssar'] = lapply(mushroom.nc['ssar'], convert_ssar)
convert_ssbr= function(x) {
  A = factor(x, levels=c('s','f','k','y'))
  values = c(seq(10,150,10))
  values[A]
}
mushroom.nc['ssbr'] = lapply(mushroom.nc['ssbr'], convert_ssbr)
convert_scar= function(x) {
  A = factor(x, levels=c('w','g','p','n','b','e','o','c','y'))
  values = c(seq(10,150,10))
  values[A]
}
mushroom.nc['scar'] = lapply(mushroom.nc['scar'], convert_scar)
convert_scbr= function(x) {
  A = factor(x, levels=c('w','p','g','b','n','e','y','o','c'))
  values = c(seq(10,150,10))
  values[A]
}
mushroom.nc['scbr'] = lapply(mushroom.nc['scbr'], convert_scbr)
convert_vtype= function(x) {
  A = factor(x, levels=c('p','u'))
  values = c(seq(10,150,10))
  values[A]
}
mushroom.nc['vtype'] = lapply(mushroom.nc['vtype'], convert_vtype)
convert_vcolor= function(x) {
  A = factor(x, levels=c('w','n','o','y'))
  values = c(seq(10,150,10))
  values[A]
}
mushroom.nc['vcolor'] = lapply(mushroom.nc['vcolor'], convert_vcolor)
convert_rnumber= function(x) {
  A = factor(x, levels=c('o','t','n'))
  values = c(seq(10,150,10))
  values[A]
}
mushroom.nc['rnumber'] = lapply(mushroom.nc['rnumber'], convert_rnumber)
convert_rtype= function(x) {
  A = factor(x, levels=c('p','e','l','f','n'))
  values = c(seq(10,150,10))
  values[A]
}
mushroom.nc['rtype'] = lapply(mushroom.nc['rtype'], convert_rtype)
convert_spc= function(x) {
  A = factor(x, levels=c('k','n','u','h','w','r','o','y','b'))
  values = c(seq(10,150,10))
  values[A]
}
mushroom.nc['spc'] = lapply(mushroom.nc['spc'], convert_spc)
convert_population= function(x) {
  A = factor(x, levels=c('s','n','a','v','y','c'))
  values = c(seq(10,150,10))
  values[A]
}
mushroom.nc['population'] = lapply(mushroom.nc['population'], convert_population)
convert_habitat= function(x) {
  A = factor(x, levels=c('u','g','m','d','p','w','l'))
  values = c(seq(10,150,10))
  values[A]
}
mushroom.nc['habitat'] = lapply(mushroom.nc['habitat'], convert_habitat)

# basic statistics
summary(mushroom.nc)
describe(mushroom.nc)

# eliminate 'vtype' and other 9 attributes
mushroom.nc.21 = subset(mushroom.nc, select = -c(vtype))
plot(mushroom.nc.21)
mushroom.nc.12 = subset(mushroom.nc.21, select = -c(cshape, csurface, bruises, gattachment, gspacing, gsize, sshape, vcolor, rnumber))

# normalize dataset
# Min Max normalization
normalize <- function(x) {((x-min(x))/(max(x)-min(x)))}
normalize

mush.norm = as.data.frame(lapply(mushroom.nc.12, normalize))
mush.norm

# if we need to get the original values back
habitat_min = min(mushroom.nc.12$habitat)
habitat_max = max(mushroom.nc.12$habitat)

habitat_test = mush.norm$habitat[1]*(habitat_max-habitat_min)+habitat_min
habitat_test
#zscore normalization
zscore <- function(x){(x-mean(x))/sd(x)}
zscore(c(10,20,30,40,50))

mush.nc.12 = as.data.frame(lapply(mushroom.nc.12, zscore))

# draw correlation plot
corr_mush = cor(mush.nc.12)
corrplot(corr_mush, tl.col = "brown", tl.srt = 30, bg = "white", method = c('circle'), title = "\n\n Correlation Plot of Mushroom Data", type = "full")
mush.nc.11 = subset(mush.nc.12, select = -c(ccolor))

# split the original data set
mush.nc.11$class = c(mushroom$class)
mush.nc.11$class[mush.nc.11$class == "e"] = "edible"
mush.nc.11$class[mush.nc.11$class == "p"] = "poisonous"

#70/30 split
sample_size = floor(0.7 * nrow(mush.nc.11))
train_index = sample(seq_len(nrow(mush.nc.11)),size = sample_size)

mush.train = mush.nc.11[train_index,]
mush.test = mush.nc.11[-train_index,]

#60/40 split
sample_size = floor(0.6 * nrow(mush.nc.11))

train_index = sample(seq_len(nrow(mush.nc.11)),size = sample_size)

mush.train.2 = mush.nc.11[train_index,]
mush.test.2 = mush.nc.11[-train_index,]

#50/50 split
sample_size = floor(0.5 * nrow(mush.nc.11))

train_index = sample(seq_len(nrow(mush.nc.11)),size = sample_size)

mush.train.3 = mush.nc.11[train_index,]
mush.test.3 = mush.nc.11[-train_index,]

#remove testing labels
mush.test.classes = mush.test[11] 
mush.test.classes.2 = mush.test.2[11] 
mush.test.classes.3 = mush.test.3[11]

mush.test <- subset(mush.test, select = -c(class))
mush.test.2 <- subset(mush.test.2, select = -c(class))
mush.test.3 <- subset(mush.test.3, select = -c(class))

#### Part3
# normalize dataset (we had done this before, so no need to do it again)
mush.nc.norm = mush.nc.11[1:11]

### clustering
## k=2
mush.nc.norm.k2 = kmeans(mush.nc.norm, center=2)
fviz_cluster(mush.nc.norm.k2, mush.nc.norm, labelsize=7, pointsize=1, main='Kmeans Clustering - 2')

#relabel the points
point_labels  = as.numeric(rownames(mush.nc.norm))
point_labels_3 = list()
for (x in point_labels){
  if (x%%3 == 0){
    point_labels_3 = append(point_labels_3,x)
  }
}
point_colors = mush.nc.norm.k2$cluster
point_colors_3 = as.character(point_colors[c(as.character(point_labels_3))])
factoextra::fviz_cluster(mush.nc.norm.k2, mush.nc.norm, main = 'Kmeans Clustering - 2', geom = "point") +
  geom_text(aes(label = point_labels_3, colour = point_colors_3), data = . %>% filter(row_number() %% 3 == 0))

mush.nc.norm.k2
# k=3
mush.nc.norm.k3 = kmeans(mush.nc.norm, center=3)
point_colors = mush.nc.norm.k3$cluster
point_colors_3 = as.character(point_colors[c(as.character(point_labels_3))])
factoextra::fviz_cluster(mush.nc.norm.k3, mush.nc.norm, main = 'Kmeans Clustering - 3', geom = "point") +
  geom_text(aes(label = point_labels_3, colour = point_colors_3), data = . %>% filter(row_number() %% 3 == 0))

mush.nc.norm.k3
# k=4
mush.nc.norm.k4 = kmeans(mush.nc.norm, center=4)
point_colors = mush.nc.norm.k4$cluster
point_colors_3 = as.character(point_colors[c(as.character(point_labels_3))])
factoextra::fviz_cluster(mush.nc.norm.k4, mush.nc.norm, main = 'Kmeans Clustering - 4', geom = "point") +
  geom_text(aes(label = point_labels_3, colour = point_colors_3), data = . %>% filter(row_number() %% 3 == 0))

mush.nc.norm.k4
# k=5
mush.nc.norm.k5 = kmeans(mush.nc.norm, center=5)
point_colors = mush.nc.norm.k5$cluster
point_colors_3 = as.character(point_colors[c(as.character(point_labels_3))])
factoextra::fviz_cluster(mush.nc.norm.k5, mush.nc.norm, main = 'Kmeans Clustering - 5', geom = "point") +
  geom_text(aes(label = point_labels_3, colour = point_colors_3), data = . %>% filter(row_number() %% 3 == 0))

mush.nc.norm.k5
# k=6
mush.nc.norm.k6 = kmeans(mush.nc.norm, center=6)
point_colors = mush.nc.norm.k6$cluster
point_colors_3 = as.character(point_colors[c(as.character(point_labels_3))])
factoextra::fviz_cluster(mush.nc.norm.k6, mush.nc.norm, main = 'Kmeans Clustering - 6', geom = "point") +
  geom_text(aes(label = point_labels_3, colour = point_colors_3), data = . %>% filter(row_number() %% 3 == 0))

mush.nc.norm.k6
# k=7
mush.nc.norm.k7 = kmeans(mush.nc.norm, center=7)
point_colors = mush.nc.norm.k7$cluster
point_colors_3 = as.character(point_colors[c(as.character(point_labels_3))])
factoextra::fviz_cluster(mush.nc.norm.k7, mush.nc.norm, main = 'Kmeans Clustering - 7', geom = "point") +
  geom_text(aes(label = point_labels_3, colour = point_colors_3), data = . %>% filter(row_number() %% 3 == 0))

mush.nc.norm.k7
# select points to determine criterion for classification
mushroom.nc.11 = subset(mushroom.nc.12, select = -c(ccolor))
mushroom.nc.11[5436,]
mushroom.nc.11[5142,]

### Part4
## create training labels for KNN by Kmeans
mushroom.nc.11 = subset(mushroom.nc.12, select=-c(ccolor))
factoextra::fviz_nbclust(mushroom.nc.11, FUNcluster = kmeans, method = 'wss', k.max = 10, verbose = TRUE)
mush.train.nc = subset(mush.train, select=-c(class))

# k=3
mush.train.k3 = kmeans(mush.train.nc, centers=3)
mush.test.k3 = knn(mush.train.nc, mush.test, mush.train.k3$cluster, k=3)
mush.test.kmeans.k3 = kmeans(mush.test, center=3)
mush.test.k3.labels = mush.test.kmeans.k3$cluster
mush.test.k3
mush.test.k3.labels


# k=5
mush.train.k5 = kmeans(mush.train.nc, centers=5)
mush.test.k5 = knn(mush.train.nc, mush.test, mush.train.k5$cluster, k=5)
mush.test.kmeans.k5 = kmeans(mush.test, center=5)
mush.test.k5.labels = mush.test.kmeans.k5$cluster

# k=7
mush.train.k7 = kmeans(mush.train.nc, centers=7)
mush.test.k7 = knn(mush.train.nc, mush.test, mush.train.k7$cluster, k=7)
mush.test.kmeans.k7 = kmeans(mush.test, center=7)
mush.test.k7.labels = mush.test.kmeans.k7$cluster

# k=9
mush.train.k9 = kmeans(mush.train.nc, centers=9)
mush.test.k9 = knn(mush.train.nc, mush.test, mush.train.k9$cluster, k=9)
mush.test.kmeans.k9 = kmeans(mush.test, center=9)
mush.test.k9.labels = mush.test.kmeans.k9$cluster

## linear regression
mush.train$class[mush.train$class == "edible"] = 0
mush.train$class[mush.train$class == "poisonous"] = 1
mush.train$class = as.numeric(mush.train$class)
mush.train.glm = glm(mush.train$class ~ ., data=mush.train, family="gaussian")
summary(mush.train.glm)
mush.train.glm.step = step(object=mush.train.glm, trace=0)
summary(mush.train.glm.step)

## anova analysis and residual plot
anova(object = mush.train.glm.step, test='Chisq')
plot(mush.train.glm.step)

## make the prediction
mush.test.pred = predict(mush.train.glm.step, newdata=mush.test)
summary(mush.test.pred)

## label the predicted data with kmeans clustering method
mush.test.pred.k3 = kmeans(mush.test.pred, centers=3)
mush.test.pred.k5 = kmeans(mush.test.pred, centers=5)
mush.test.pred.k7 = kmeans(mush.test.pred, centers=7)
mush.test.pred.k9 = kmeans(mush.test.pred, centers=9)

## compare the tested and predicted result
mush.test.ct.k3 = CrossTable(mush.test.pred.k3$cluster, mush.test.k3.labels, prop.chisq = TRUE)
mush.test.ct.k5 = CrossTable(mush.test.pred.k5$cluster, mush.test.k5.labels, prop.chisq = TRUE)
mush.test.ct.k7 = CrossTable(mush.test.pred.k7$cluster, mush.test.k7.labels, prop.chisq = TRUE)
mush.test.ct.k9 = CrossTable(mush.test.pred.k9$cluster, mush.test.k9.labels, prop.chisq = TRUE)

#cluster counts
mush.k3.counts = mush.test.pred.k3$size
mush.k3.counts = as.data.frame(mush.k3.counts)

target.counts.k3 = as.data.frame(table(mush.test.k3.labels))
mush.k3.counts$true_labels = target.counts.k3$Freq
mush.k3.counts

mush.k5.counts = mush.test.pred.k5$size
mush.k5.counts = as.data.frame(mush.k5.counts)

target.counts.k5 = as.data.frame(table(mush.test.k5.labels))
mush.k5.counts$true_labels = target.counts.k5$Freq
mush.k5.counts

mush.k7.counts = mush.test.pred.k7$size
mush.k7.counts = as.data.frame(mush.k7.counts)

target.counts.k7 = as.data.frame(table(mush.test.k7.labels))
mush.k7.counts$true_labels = target.counts.k7$Freq
mush.k7.counts

mush.k9.counts = mush.test.pred.k9$size
mush.k9.counts = as.data.frame(mush.k9.counts)

target.counts.k9 = as.data.frame(table(mush.test.k9.labels))
mush.k9.counts$true_labels = target.counts.k9$Freq
mush.k9.counts


confusionMatrix(as.factor(mush.test.pred.k3$cluster),as.factor(mush.test.k3.labels))
confusionMatrix(as.factor(mush.test.pred.k5$cluster),as.factor(mush.test.k5.labels))
confusionMatrix(as.factor(mush.test.pred.k7$cluster),as.factor(mush.test.k7.labels))
confusionMatrix(as.factor(mush.test.pred.k9$cluster),as.factor(mush.test.k9.labels))
