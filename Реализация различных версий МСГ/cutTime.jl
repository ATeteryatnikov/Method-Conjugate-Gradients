# программа cutTime.jl предназначена для удаления пути к каталогу result в текстовом файле "compare time.txt" и для приведения всех строк файла к единому виду

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