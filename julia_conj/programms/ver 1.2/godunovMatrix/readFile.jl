file = open(string(path, "/config.txt"),"r") # открытие файла config.txt

strMas = readlines(file)    # в strMas записывается всё содержимое файла 
                            # config.txt
global norm_residual
global limit
global Godunov_matrix_dim
global mantissa
global mantissa_out
global pathResult

for i in 1:1:length(strMas)   # считывается значение переменной limit
  if search(strMas[i], "limit")!=0:-1 # Если подстрока “limit” найдена
    limit = split(strMas[i],"= ")[2] # строка i разделяется на массив
                            # строк через символ “= ” и переменной limit 
                            # присваивается только 2 элемент этого массива.
    limit = parse(Int64,limit) # Строка limit конвертируется в Int64.
    Break            # цикл for прерывается при нахождении ключевого слова.
  end
end

for i in 1:1:length(strMas)   # Считывается значение Godunov_matrix_dim
                              # Аналогично считыванию значения limit.
  if search(strMas[i], "Godunov_matrix_dim")!=0:-1
    Godunov_matrix_dim = split(strMas[i],"= ")[2]
    Godunov_matrix_dim = parse(Int64,Godunov_matrix_dim)
    break
  end
end

for i in 1:1:length(strMas)    # максимально допустимое отклонение нормы                     
                               # градиента.
                               # Аналогично считыванию значения limit.
  if search(strMas[i], "norm_residual")!=0:-1
    norm_residual = split(strMas[i],"= ")[2]
    norm_residual = parse(Float64,norm_residual)
    break
  end
end

for i in 1:1:length(strMas)     # Мантисса
                                # Аналогично считыванию значения limit.
  if search(strMas[i], "mantissa")!=0:-1
    mantissa = split(strMas[i],"= ")[2]
    mantissa = parse(Int64,mantissa)
    break
  end
end

for i in 1:1:length(strMas)     # Мантисса при записи в файлы
                                # Аналогично считыванию значения limit.
  if search(strMas[i], "mantissa_out")!=0:-1
    mantissa_out = split(strMas[i],"= ")[2]
    mantissa_out = parse(Int64,mantissa_out)
    break
  end
end

for i in 1:1:length(strMas)             #Путь к выводу
  if search(strMas[i], "pathResult")!=0:-1
    pathResult = split(strMas[i],"= ")[2]
    pathResult = split(pathResult, "\n")[1]  
    break
  end
end

close(file)  #закрытие файла config.txt