B <- 542351
a <- 1:B
count <- 0


for(i in a)
{
  if(B %% i == 0 )
  {
    print(i)
    count <- count+1

  }

}
if(count < 3)
{
  print("½è¼Æ")
}

