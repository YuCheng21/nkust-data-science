check.prime = function(num){
  is.prime = FALSE
  
  if(num == 2){
    is.prime = TRUE
  } else if(num > 2){
    is.prime = TRUE
    for (i in 2:(num-1)) {
      if((num %% i) == 0){
        is.prime = FALSE
        break
      }
    }
  }
  
  if(is.prime){
    return (TRUE)
  } else{
    return (FALSE)
  }
}

prime = function(num){
  little = num - 1
  while(check.prime(little) != TRUE){
    if(little > 2){
      little = little - 1
    } else {
      little = NA
      break
    }
  }
  big = num + 1
  while(check.prime(big) != TRUE){
    big = big + 1
  }
  cat(little, ",",big)
}

a = 100
prime(a)
