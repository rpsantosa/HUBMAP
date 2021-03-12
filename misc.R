file <- system.file('extdata/parrots.png',package='imager')
parrots <- load.image(file)
#The file format is defined by the extension. Here we save as JPEG

i=2560
 j=12288
 SPLIT = 512
dest<- paste0(SPLIT,"x",SPLIT, "+",i, "+", j)
a<- image_crop(im,dest) %>% .[[1]] %>% as.numeric %>% aperm(perm = c(2,1,3)) %>% array(dim=c (SPLIT,SPLIT,1,3)) %>% as.cimg

imager::save.image(parrots,"/tmp/parrots.jpeg")


imgradient(a %>% grayscale,"xy") %>% enorm %>% plot(main="Gradient magnitude (again)")

blobs <- isoblur(a,1)
Hdet <- with(imhessian(blobs),(xx*yy - xy^2))
plot(Hdet,main="Determinant of Hessian")

threshold(Hdet,"90%") %>% plot(main="Determinant: 1% highest values")


library(magick)
library(imager)


file <- system.file('extdata/parrots.png',package='imager')
parrots <- load.image(file)
#The file format is defined by the extension. Here we save as JPEG

i=10752
j=5632

ffnames<-list.files(BASET, full.names = F,pattern = "*.tiff") %>% gsub(pattern = ".tiff",replacement =  "")

k=6
impath<-file.path(BASET,paste0(ffnames[k],".tiff") )
im<-image_read(impath)

dest<- paste0(SPLIT,"x",SPLIT, "+",i, "+", j)
a<- image_crop(im,dest) %>% .[[1]] %>% as.numeric %>% aperm(perm = c(2,1,3)) %>% array(dim=c (SPLIT,SPLIT,1,3)) %>% as.cimg

imager::save.image(parrots,"/tmp/parrots.jpeg")


imgradient(a %>% grayscale,"xy") %>% enorm %>% plot(main="Gradient magnitude (again)")

blobs <- isoblur(a,5)
Hdet <- with(imhessian(blobs),(xx*yy - xy^2))
plot(Hdet,main="Determinant of Hessian")

threshold(Hdet,"90%") %>% plot(main="Determinant: 1% highest values")




# library(tfdatasets)
library(tidyverse)
library(dplyr)
# library(rsample)
# library(reticulate)
library(jsonlite)
library(magick)
# library(cowplot)
# library(raster)
library(imager)
library(utils)

library(data.table)
a<- file.path("c:/kaggletemp/HuBMAP/train/")
b<-file.path("E:/kaggletemp/HuBMAP/train/")

started.at=proc.time()
am<- image_read(file.path(a,"095bf7a1f.tiff"))  
cat("Finished in",timetaken(started.at),"\n")





started.at=proc.time()
bm<- image_read(file.path(b,"0486052bb.tiff"))  
cat("Finished in",timetaken(started.at),"\n")
