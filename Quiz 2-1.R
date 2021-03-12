icy = matrix(1:9, nrow = 3)
print(icy)

get = icy %% 2 == 0
icy = icy[get]
print(icy)
