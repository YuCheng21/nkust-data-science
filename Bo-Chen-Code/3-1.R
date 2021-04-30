a <- 1:9 
b <- 1:9 

for(i in a){
  
  for(j in b){

    x <- sprintf("%d * %d = %d",i,j,i*j)
    print(x)
 
     }

  }

  