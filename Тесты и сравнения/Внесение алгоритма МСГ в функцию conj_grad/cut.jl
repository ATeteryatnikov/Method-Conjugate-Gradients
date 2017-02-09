#cut.jl - программа на языке Julia, предназначена для обрезания в "compare time.txt" путей к каталогам с результатами.

file = open("compare\ time.txt", "r")
strs = readlines(file)

for i in 1:1:length(strs)
if ((num = search(strs[i],"dim")) != 0:-1)
strs[i] = strs[i][num[1]:end-1]
end
end
close(file)
file = open("compare\ time.txt", "w")
writedlm(file,strs)
close(file)
