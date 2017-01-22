 #запуск таймера
####################################### работа с путями и параметрами

path = @__FILE__           # @__FILE__  - возвращает путь до исполняемого        
                           # файла .jl.
path = dirname(path)       # dirname() возвращает путь до дириктории в                  
                           # которой находится файл указываемый в path.
include(string(path,"/readFile.jl")) # Выполнение модуля readfile.jl.
set_bigfloat_precision(mantissa) # Установка величины мантиссы BigFloat.


#if (isdir(string(path,"/result")))        # Проверка на существование                                           # директории result.
#rm(string(path,"/result"),recursive=true) # Удаление каталога result 
                                          # в случае его существования.
#end

####################################### Функция подсчета нормы
function norma(x)              
  result = big(0.0)                       # Переменной result присваивается                      
                                          # тип BigFloat.
  x = x.^2         # Все элементы вектора возводятся в квадрат.              
  result = sum(x)  # Все элементы вектора суммируются.
  return result    # функция возвращает переменную result.
end
####################################### заполнение матрицы A и вектора B 
				      # (Матрица Годунова
function conj_grad(x,A,p,y,s,k)
    q = A*p
    a = y/norma(q)
    x = x + a*p
    s = s - a*A'*q
    y1 = norma(s)
    b = y1/y
    p = s + b*p
    k=k+1
    return x,A,p,y1,s,k
end

n = Godunov_matrix_dim			
A = fill(big(0e0),n,n)  # Матрица A размерности n*n типа BigFloat задается
                       # функцией fill() и заполняется нулевыми элементами.
B = Array(BigFloat, n) # Вектор B – массив размерности n типа BigFloat.

for i in 1:1:n
  A[i,i] = big"7.0"/5  # При заполнении элементов массива, необходимо сначала  
                   # преобразовать целое число в тип BigFloat, и только 
                   # после этого, делить его на другое число.  
end

for i in 1:1:(n-1)
 A[i,i+1] = big"11.0"/3
end

for i in 1:1:(n-2)   #Заполнение вектора B
 B[i] = (152*i+118)
 B[i] = B[i]/(15*(2*i+1)*(2*i+3))
end
B[n] = 7
B[n] = B[n]/(5*(2*n+1))
B[n-1] = (152*n-34)
B[n-1] = B[n-1]/(15*(2*n-1)*(2*n+1))

real_result = Array(BigFloat, n)    # Вектор, решение матрицы Годунова
for i in 1:1:(n-2)
  real_result[i] = big(1e0)/(2*i+1)
end
real_result[n-1] = big(1e0)/(2*n-1)
real_result[n] = big(1e0)/(2*n+1)

####################################### Начало МСГ
conj_grad(1,1,1,1,1,1)
tic() 
x = fill(big(0.0e),n)
p = A'*(B-A*x)
s=p
y=norma(s)

####################################### работа цикла МСГ
k = 0

while(y> norm_residual && k<limit)
  x,A,p,y,s,k = conj_grad(x,A,p,y,s,k)
end

timer = toc()
display(convert(Array{Float64},x)) # Отображение в консоли массива x в    
                                   #формате Float64

####################################### запись результатов в файлы

if !(isdir(pathResult))
mkpath(pathResult)         # Создание директории result в случае 
                                      # её отсутствия.
end

difference = x-real_result

set_bigfloat_precision(mantissa_out)
x=x+1-1
real_result = real_result+1-1
difference = difference+1-1

file = open(string(pathResult, "/resultX.txt"), "w")
writedlm(file, split(string(x)[10:end-1],","))
close(file)

file = open(string(pathResult, "/resultCompare.txt"), "w")
writedlm(file, [split(string(x)[10:end-1],",") split(string(real_result)[10:end-1],",")])   # Вектор x записывается в файл 
close(file)

file = open(string(pathResult, "/resultDifference.txt"), "w")
writedlm(file, split(string(difference)[10:end-1],","))
close(file)

# Запись параметров в файл log.txt
if (k>=limit)
file = open(string(pathResult, "/log.txt"), "w")
write(file, string("Программа завершила работу, сработало ограничение на количество итераций\n","Входные параметры:\n",
                   "norm_residual = ", norm_residual, "\n", "mantissa = ", mantissa, "\n", 
                   "Godunov_matrix_dim = ", Godunov_matrix_dim, "\n", "limit = ", limit ))
close(file)
else
file = open(string(pathResult, "/log.txt"), "w")
write(file, string("Программа завершила работу, отклонение нормы градиента в пределах допустимого значения\n","Входные параметры:\n",
                   "max_norm_residual = ", norm_residual, "\n", "mantissa = ", mantissa, "\n", 
                   "Godunov_matrix_dim = ", Godunov_matrix_dim, "\n", "limit = ", limit, "\n","\nна выходе:\n", "norm_residual = " , y))
close(file)
end

file = open(string(pathResult, "/resultTime.txt"),"w") 
			# Завершение работы таймера.
write(file, "timer: ")
writedlm(file ,timer)           # Запись времени работы программы в 
                               # секундах в файл resultTimer.txt.  
close(file)

