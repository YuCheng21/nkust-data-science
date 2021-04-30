ds <- iris 
str(ds)
getSpecies <- ds$Species #讀取類別
#依照類別給予顏色與型狀
ggplot(ds,aes(x=Petal.Length,y=Petal.Width,color =getSpecies,shape = Species))+
  geom_point()
