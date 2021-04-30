poker_num = 1:13
poker_num[1] = "A"
poker_num[11] = "J"
poker_num[12] = "Q"
poker_num[13] = "K"
poker_symbol = c("♠","♣","♥","♦")
poker = paste(poker_symbol, rep(poker_num, times=4))
random = round(runif(1)*53) +1
sample(poker, random)
