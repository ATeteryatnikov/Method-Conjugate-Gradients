file = open("compare\ time.txt", "r")
strs = readlines(file)
for i in 1:1:round(Int,length(strs)/2)
strs[i] = strs[i][103:end-1]
end
for i in round(Int,length(strs)/2):1:round(Int,length(strs))
strs[i] = strs[i][115:end-1]
end
close(file)
file = open("compare\ time.txt", "w")
writedlm(file,strs)
close(file)