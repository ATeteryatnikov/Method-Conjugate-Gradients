
####################################### работа с путями и параметрами

path = @__FILE__           # @__FILE__  - возвращает путь до исполняемого        
                           # файла .jl.
path = dirname(path)       # dirname() возвращает путь до дириктории в                  
                           # которой находится файл указываемый в path.
include(string(path,"/readFile.jl")) # Выполнение модуля readfile.jl.


#if (isdir(string(path,"/result")))        # Проверка на существование                                           # директории result.
#rm(string(path,"/result"),recursive=true) # Удаление каталога result 
                                          # в случае его существования.
#end

####################################### Функция подсчета нормы
function norma(x)              
  result = 0.0                      # Переменной result присваивается                      
                                          # тип BigFloat.
   x = x.^2         # Все элементы вектора возводятся в квадрат.              
  result = sum(x)  # Все элементы вектора суммируются.
  return result   # функция возвращает переменную result.
end
####################################### заполнение матрицы A и вектора B 
				      # (Матрица Годунова)

n = Godunov_matrix_dim			
A = fill(0e0,n,n)  # Матрица A размерности n*n типа BigFloat задается
                       # функцией fill() и заполняется нулевыми элементами.
B = Array(Float64, n) # Вектор B – массив размерности n типа BigFloat.

for i in 1:1:n
  A[i,i] = 7/5  # При заполнении элементов массива, необходимо сначала  
                   # преобразовать целое число в тип BigFloat, и только 
                   # после этого, делить его на другое число.  
end

for i in 1:1:(n-1)
 A[i,i+1] = 11/3
end

for i in 1:1:(n-2)   #Заполнение вектора B
 B[i] = (152*i+118)
 B[i] = B[i]/(15*(2*i+1)*(2*i+3))
end
B[n] = 7
B[n] = B[n]/(5*(2*n+1))
B[n-1] = (152*n-34)
B[n-1] = B[n-1]/(15*(2*n-1)*(2*n+1))

real_result = Array(Float64, n)    # Вектор, решение матрицы Годунова
for i in 1:1:(n-2)
  real_result[i] = 1/(2*i+1)
end
real_result[n-1] = 1/(2*n-1)
real_result[n] = 1/(2*n+1)

####################################### Начало МСГ

x = fill(0.0,n)
tic()  #запуск таймера



B = A'*B
A = A'*A

d = B-A*x
r = d
#y = norma(r)
############################### работа цикла
k = 0
ratio = 0
rtio = 0.0
maxrtio = 10.0
while(maxrtio>1 && k<limit) #y> norm_residual && k<limit)
  Ad = A*d
  rr = r'*r
  a = (rr)[1]/(d'*Ad)[1]   # a - является матрицей из одного элемента.
  x = x + a[1]*d        # В julia при умножении, a*d воспринимается как матричное умноэение
			# поэтому, чтобы получить скаляр, необходимо взять только 
			# первый элемент матрицы a. 
  maxratio=0
  for i in 1:1:n
  rtio = abs(a*d[i])/norm_residual
  if(maxratio < rtio)
    maxratio = rtio
  end
  end
  if(ratio/maxratio<0.1)
    ratio=maxratio
  end
  r1 = r - a[1]*Ad
  b = (r1'*r1)/(rr)
  d = r1 + b[1]*d
  r=r1
  k=k+1
  #y = norma(r1)
end
display(x)
println("\n",k)
#display(convert(Array{Float64},x)) # Отображение в консоли массива x в    
                                   #формате Float64
timer = toc()			# Завершение работы таймера.
####################################### запись результатов в файлы

if !(isdir(pathResult))
mkpath(pathResult)         # Создание директории result в случае 
                                      # её отсутствия.
end

difference = x-real_result

file = open(string(pathResult, "/resultX.txt"), "w")
writedlm(file, x)
close(file)

file = open(string(pathResult, "/resultDifference.txt"), "w")
writedlm(file, difference)
close(file)

# Запись параметров в файл log.txt
if (k>=limit)
file = open(string(pathResult, "/log.txt"), "w")
write(file, string("Программа завершила работу, сработало ограничение на количество итераций\n","Входные параметры:\n",
                   "norm_residual = ", norm_residual, "\n", 
                   "Godunov_matrix_dim = ", Godunov_matrix_dim, "\n", "limit = ", limit ))
close(file)
else
file = open(string(pathResult, "/log.txt"), "w")
write(file, string("Программа завершила работу, отклонение нормы градиента в пределах допустимого значения\n","Входные параметры:\n",
                   "max_norm_residual = ", norm_residual, "\n", 
                   "Godunov_matrix_dim = ", Godunov_matrix_dim, "\n", "limit = ", limit, "\n","\nна выходе:\n", "norm_residual = " , maxrtio))
close(file)
end

file = open(string(pathResult, "/resultTime.txt"),"w") 

writedlm(file, timer)          # Запись времени работы программы в 
                               # секундах в файл resultTimer.txt.  
close(file)

