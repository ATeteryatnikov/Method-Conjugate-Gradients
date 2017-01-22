### Сравнение скорости работы программы godunovMatrix реализованной на julia, с использованием матричного умножения заложенного в язык Julia, с аналогичной программой, но с реализованным матричным умножением через цикл «for» 


Алгоритм программы взят из:   
презентация Киреев И.В. «Метод сопряженных градиентов» - Красноярск, 2011  
В программе реализован 16 слайд.

Пример матричного умножения реализованного через цикл «for». Произведение матрицы A размерности n*n и вектора p размерности n.
```  
for j in 1:1:n  
   for i in 1:1:n  
       q[j] = q[j] + A[j,i]*p[i]  
   end  
end  
```
Результаты:  
***
с использованием матричного умножения Julia  
 
dim=100 norm residual=1e-100 mantissa=70/resultTime.txt:timer: 1.222873403  
dim=100 norm residual=1e-150 mantissa=70/resultTime.txt:timer: 1.180078767  
dim=100 norm residual=1e-200 mantissa=70/resultTime.txt:timer: 1.197781647  
dim=100 norm residual=1e-250 mantissa=70/resultTime.txt:timer: 1.184367172  
dim=100 norm residual=1e-300 mantissa=70/resultTime.txt:timer: 1.184397378  
dim=50 norm residual=1e-100 mantissa=70/resultTime.txt:timer: .476283116  
dim=50 norm residual=1e-150 mantissa=70/resultTime.txt:timer: .515982735  
dim=50 norm residual=1e-200 mantissa=70/resultTime.txt:timer: .507994048  
dim=50 norm residual=1e-250 mantissa=70/resultTime.txt:timer: .493998082  
dim=50 norm residual=1e-300 mantissa=70/resultTime.txt:timer: .496811836  
***
С использованием  матричного умножения через цикл «for»  

dim=100 norm residual=1e-100 mantissa=70/resultTime.txt:timer: 1.726621903  
dim=100 norm residual=1e-150 mantissa=70/resultTime.txt:timer: 1.705324255  
dim=100 norm residual=1e-200 mantissa=70/resultTime.txt:timer: 1.728482246  
dim=100 norm residual=1e-250 mantissa=70/resultTime.txt:timer: 1.697802452  
dim=100 norm residual=1e-300 mantissa=70/resultTime.txt:timer: 1.765456323  
dim=50 norm residual=1e-100 mantissa=70/resultTime.txt:timer: .592598621  
dim=50 norm residual=1e-150 mantissa=70/resultTime.txt:timer: .617997116  
dim=50 norm residual=1e-200 mantissa=70/resultTime.txt:timer: .589804076  
dim=50 norm residual=1e-250 mantissa=70/resultTime.txt:timer: .594593436  
dim=50 norm residual=1e-300 mantissa=70/resultTime.txt:timer: .6194264  
***
Вывод:
После серии запусков программы godunovMatrix.jl с различными входными параметрами, смотря на время работы программы можно сделать вывод, что матричное умножение реализованное в Julia работает быстрее, чем реализованное матричное умножение через цикл «for».



 
