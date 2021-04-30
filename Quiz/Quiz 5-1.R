fg = round(runif(50)*50)
fm = round(runif(50)*50)
frame_1 = data.frame(cbind(fg,fm))

fa = fg + fm
frame_2 = data.frame(cbind(fg,fm,fa))

fa_p = mapply(function(fg,fm) fg/(fg+fm), fg=fg, fm=fm)

frame_3 = data.frame(cbind(fg,fm,fa,fa_p))

View(frame_3)
