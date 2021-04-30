rm(list=ls())
fast <- function(I)
{
  print("11111")
  k <- I-1
  a <- 1:k
  count <- 0
  
  while(count < 3)
  {
    print("2222")
    for(i in a)
    {
      if(k %% i == 0 )
      {
        print("3333")
        print(i)
        count <- count+1
      
      }
    
    }
      
    print("4444")
    k <- x-1
    a <- 1:k
  
  }
}


fast(5)
