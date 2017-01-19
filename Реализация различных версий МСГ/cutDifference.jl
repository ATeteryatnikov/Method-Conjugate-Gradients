# программа cutDifference.jl предназначена для удаления пути к каталогу result в текстовом файле "compare maxDifference.txt" и для приведения всех строк файла к единому виду

file = open("compare\ maxDifference.txt", "r")
strs = readlines(file)

for i in 1:1:length(strs)
if ((num = search(strs[i],"dim")) != 0:-1)
strs[i] = strs[i][num[1]:end-1]
end
end
close(file)
file = open("compare\ maxDifference.txt", "w")
writedlm(file,strs)
close(file)