
# instalar pacotes --------------------------------------------------------


#install.packages("imager")
#install.packages("ggplot2")


# carregar pacotes --------------------------------------------------------
chooseCRANmirror()
11

library(imager)
library(ggplot2)


# teste biblioteca imager -------------------------------------------------

chooseCRANmirror()
11

plot(boats)
x <- boats
plot(x)


# imagem internet ---------------------------------------------------------


#https://secondnature.org/planet-earth-1401465698wt7/
x <- load.image("planet-earth-1401465698wt7-300x300.jpg")
dim(x)
plot(x)

imagem <- array(x,dim= c(300*300,3))
colnames(imagem) <- c("Vermelho", "Verde", "Azul")
head(imagem)
dim(imagem)
################################ OBJETIVO ###################################
# Criar grupos de cores presentes na imagem.
#############################################################################

plot(imagem)

#Achar os centros depois de rodar o modelo de KMEANS
kMeans_Model <-  kmeans(imagem, centers = 2)
kMeans_Model$cluster

#Os centros de cada grupo é dado por
kMeans_Model$centers

#Agora, deve substituir os valores dos centros pelos grupos

for(i in 1:(300*300)){
  cl <- kMeans_Model$cluster[i]
  imagem[i,1] <-  kMeans_Model$centers[cl,1] #R
  imagem[i,2] <-  kMeans_Model$centers[cl,2] #G
  imagem[i,3] <-  kMeans_Model$centers[cl,3] #B
}

dim(imagem)

?array
?cimg

#300 linhas 300 colunas 1 brilho e 3 cores 
imagem_cl <-cimg(array(data=imagem, dim=c(300,300,1,3)))
dim (imagem_cl)

plot(imagem_cl)
