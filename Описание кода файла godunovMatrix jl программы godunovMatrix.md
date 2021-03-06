### Описание кода файла godunovMatrix.jl программы godunovMatrix

> В момент написания программы использовалась Julia версии 0.4.5.

В начале кода происходит запуск таймера, после чего программа определяет расположение каталога в котором программа была запущена
и подключается файл readFile.jl, в нем происходит считывание параметров программы из конфигурационного файла config.txt.
```
tic()                                   # запуск таймера.
path = @__FILE__                        # @__FILE__  - возвращает путь до исполняемого файла .jl.
path = dirname(path)                    # dirname() возвращает путь до дириктории в которой находится файл указываемый в path.
include(string(path,"/readFile.jl"))    # Выполнение модуля readfile.jl.
set_bigfloat_precision(mantissa)        # Установка величины мантиссы типа данных BigFloat.
```
На этом этапе имеем следующие переменные: path — путь до каталога с программой (тип String); norm_residual — максимально 
допустимое отклонение нормы градиента (тип Float64); limit — ограничение на количество итераций (Int64);
Godunov_matrix_dim — размерность матрицы Годунова (тип Int64);
mantissa — величина мантиссы BigFloat с которой происходят расчеты в программе (тип Int64);
mantissa_out — величина мантиссы BigFloat с которой происходит запись результатов в файлы (тип Int64);
pathResult — путь до каталога в который будут записаны результаты (тип String).

Вводится функция norma() для расчета квадрата нормы вектора. Функция norma() принимает вектор и возвращает число типа BigFloat.
```
function norma(x)              
  result = big(0.0)    # Переменной result присваивается тип BigFloat.
  x = x.^2             # Все элементы вектора возводятся в квадрат.              
  result = sum(x)      # Все элементы вектора суммируются.
  return result        # функция возвращает переменную result.
End
```
Создается матрица A размерностью n*n и вектор B размерностью n. Матрица A и вектор B заполняются числами типа BigFloat так,
что A является левой и B правой частью [системы линейных уравнений Годунова]
(https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/blob/master/%D0%A1%D0%9B%D0%90%D0%A3%20%D0%93%D0%BE%D0%B4%D1%83%D0%BD%D0%BE%D0%B2%D0%B0.md).   
>при преобразовании дробных чисел в BigFloat, следует сначала преобразовать числитель в BigFloat и только потом делить
на знаменатель. Пример: big(1)/3. Если преобразовать по другому big(1/3), то дробь 1/3 будет посчитана в формате Float64
с мантиссой 53 бита, и при конвертировании в BigFloat, с установленной мантиссой большей чем 53 бита, число будет представлено
некорректно.  

Создается вектор real_result размерностью n, и заполняется числами типа BigFloat по формулам для решения [системы Годунова]
(https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/blob/master/%D0%A1%D0%9B%D0%90%D0%A3%20%D0%93%D0%BE%D0%B4%D1%83%D0%BD%D0%BE%D0%B2%D0%B0.md).    
```
n = Godunov_matrix_dim	# переменной n приравнивается размерность СЛАУ Годунова указанная в config.txt		
A = fill(big(0e0),n,n)  # создается матрица A размерности n*n и заполняется нулевыми элементами типа BigFloat.
B = Array(BigFloat, n)  # Вектор B – массив размерности n типа BigFloat.
for i in 1:1:n
  A[i,i] = big"7.0"/5   # Заполняется матрица A
                       
                       # При заполнении элементов массива, необходимо сначала  
                       # преобразовать целое число в тип BigFloat, и только 
                       # после этого, делить его на другое число.  
end
for i in 1:1:(n-1)
 A[i,i+1] = big"11.0"/3
end
for i in 1:1:(n-2)     # Заполнение вектора B
 B[i] = (152*i+118)
 B[i] = B[i]/(15*(2*i+1)*(2*i+3))
end
B[n] = 7
B[n] = B[n]/(5*(2*n+1))
B[n-1] = (152*n-34)
B[n-1] = B[n-1]/(15*(2*n-1)*(2*n+1))
real_result = Array(BigFloat, n)    # заполняется вектор, решение СЛАУ Годунова real_result
for i in 1:1:(n-2)
  real_result[i] = big(1e0)/(2*i+1)
end
real_result[n-1] = big(1e0)/(2*n-1)
real_result[n] = big(1e0)/(2*n+1)
```

Далее реализован алгоритм МСГ из источника: Киреев И.В. «Метод сопряженных градиентов» - Красноярск, 2011, 16 слайд.
```
x = fill(big(0.0e),n)
p = A'*(B-A*x)
s=p
y=norma(s)

k = 0
while(y> norm_residual && k<limit)
  q = A*p
  a = y/norma(q)
  x = x + a*p
  s = s - a*A'*q
  y1 = norma(s)
  b = y1/y
  p = s + b*p
  k=k+1
  y=y1
end
```  
В цикле МСГ в качестве критерия остановки используется максимально допустимое отклонение нормы градиента (norm_residual),
цикл завершается при достижении нормы градиента "y" величины не превышающей "norm_residual". Дополнительный критерий остановки
ограничение на количество итераций. Счетчик k (тип Int64) считает количество итераций пока не достигнет значения
limit (тип Int64) и по достижению, прерывает выполнение цикла while.  
После выхода из цикла программа отображает в консоли вектор x — полученное решение методом сопряженных градиентов.  
Функция display() служит для отображения значений переменных в консоли. Удобна тем, что массивы представляются в консоли 
наглядно, по столбцам. Но функция display() не поддерживает тип BigFloat. Поэтому требуется конвертировать массив из BigFloat 
в Float64.
```
display(convert(Array{Float64},x))
```  
Происходит проверка, существует ли каталог, указанный в pathResult. Если каталог не существует, то функция mkpath() создает все каталоги указанные в pathResult.
```
if !(isdir(pathResult))
mkpath(pathResult)         # Создание директории result в случае 
                                      # её отсутствия.
end
```
В переменную difference записывается разность векторов x и real_result.
```
difference = x-real_result
```
Устанавливается значение для мантиссы BigFloat равное mantissa_out. Другое значение мантиссы (меньшее чем исходное) нужно, чтобы при записи результатов в файлы, числа выглядели более наглядно. Таким образом программа производит вычисления с мантиссой mantissa, а записывает в файлы с мантиссой mantissa_out.
Изменение мантиссы не затрагивает уже существующие переменные, поэтому к векторам типа BigFloat прибавляется и вычитается единица.
```
set_bigfloat_precision(mantissa_out)
x=x+1-1
real_result = real_result+1-1
difference = difference+1-1
```
