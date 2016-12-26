file = open("max\ Deviation.txt", "r")     
strs = readlines(file)
set_bigfloat_precision(1000)
number=0
mantissa = fill(0,length(strs))
norm_residual = fill(0,length(strs))
dimension = fill(0,length(strs))
maxDeviation = fill(big(0e0),length(strs))

str = 0
k=1
for i in 1:1:length(strs)
  str = split(strs[i],"=")
  dimension[k] = parse(Int,split(str[2]," ")[1])
  norm_residual[k] = parse(Int,split(split(str[3]," ")[1],"-")[2])
  mantissa[k] = parse(Int,split(str[4],"/")[1])
  maxDeviation[k] = parse(BigFloat,split(str[5]," ")[1][1:end-1])
  if (maxDeviation[k] != 0 && maxDeviation[k] < 50)
    k = k+1
  end
end
close(file)

k=1

maxDeviation = maxDeviation[1:countnz(maxDeviation)]
mantissa = mantissa[1:countnz(mantissa)]
dimension = dimension[1:countnz(dimension)]
norm_residual = norm_residual[1:countnz(norm_residual)]

maxDeviation = convert(Array{Float64},maxDeviation)
maxDeviation = -log10(maxDeviation)

xmantissa = fill(1.0,1)
ydimension = fill(1.0,1)
zmaxDeviation = fill(1.0,1)
for i in 1:1:length(maxDeviation)
  if (norm_residual[i]==150 )
    xmantissa = push!(xmantissa,mantissa[i])
    ydimension = push!(ydimension,dimension[i])
    zmaxDeviation = push!(zmaxDeviation, maxDeviation[i])
  end
end
xmantissa = xmantissa[2:end]
ydimension = ydimension[2:end]
zmaxDeviation = zmaxDeviation[2:end]

A = fill(0.0,100,10)
for i in 1:1:length(ydimension)
  A[xmantissa[i]/10,ydimension[i]/10] = zmaxDeviation[i]
end

#for i in 1:1:length(A[:,1])

using Gadfly
plot(z = A, Geom.contour(levels=30))