rm(list=ls())
prime <- function(I)
{
  k <- I-1 #往下找
  a <- 1:k
  count <- 0
  while(1)
  {
    for(i in a)
    {
      if(k %% i == 0 )
      {
        count <- count+1
      }
    
    }
    if(count < 3)
    {
      break
    }
    count <- 0
    k <- k-1
    a <- 1:k
  }
  
  j <- I+1  #往上找
  a <- 1:j
  count <- 0
  while(1)
  {
    for(i in a)
    {
      if(j %% i == 0 )
      {
        count <- count+1
      }
      
    }
    if(count < 3)
    {
      break
    }
    count <- 0
    j <- j+1
    a <- 1:j
  }

  cat("output: ",k,",",j)
}


prime(93)
