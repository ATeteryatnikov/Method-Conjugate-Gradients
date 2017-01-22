### Внесение алгоритма МСГ в функцию названную conj_grad() и сравнение по времени работы с программой godunovMatrix.jl без внесения в функцию алгоритма

Cравнение по времени работы 2 программ godunovMatrix.jl.  
Отличие программ состоит в том, что в одной из них часть алгоритма метода сопряженных градиентов, заключенная в цикле, реализована в виде функции conj_grad().

Результат:
***
Без представления алгоритма МСГ в виде функции  

dim=200 norm residual=1e-100 mantissa=53/resultTime.txt:timer: 4.23799242  
dim=200 norm residual=1e-150 mantissa=53/resultTime.txt:timer: 4.30566344  
dim=200 norm residual=1e-200 mantissa=53/resultTime.txt:timer: 4.242326593  
dim=200 norm residual=1e-250 mantissa=53/resultTime.txt:timer: 4.28694417  
dim=200 norm residual=1e-300 mantissa=53/resultTime.txt:timer: 4.222064748  
dim=300 norm residual=1e-100 mantissa=53/resultTime.txt:timer: 10.391606217  
dim=300 norm residual=1e-150 mantissa=53/resultTime.txt:timer: 10.294346857  
dim=300 norm residual=1e-200 mantissa=53/resultTime.txt:timer: 10.421635299  
dim=300 norm residual=1e-250 mantissa=53/resultTime.txt:timer: 10.207616628  
dim=300 norm residual=1e-300 mantissa=53/resultTime.txt:timer: 10.513710476  
dim=400 norm residual=1e-100 mantissa=53/resultTime.txt:timer: 17.995255293  
dim=400 norm residual=1e-150 mantissa=53/resultTime.txt:timer: 17.962957734  
dim=400 norm residual=1e-200 mantissa=53/resultTime.txt:timer: 17.744473515  
dim=400 norm residual=1e-250 mantissa=53/resultTime.txt:timer: 17.837666793  
dim=400 norm residual=1e-300 mantissa=53/resultTime.txt:timer: 18.031737135  
***  
С представлением алгоритма МСГ в виде функции  

dim=200 norm residual=1e-100 mantissa=53/resultTime.txt:timer: 4.234898688  
dim=200 norm residual=1e-150 mantissa=53/resultTime.txt:timer: 4.24114716  
dim=200 norm residual=1e-200 mantissa=53/resultTime.txt:timer: 4.29118939  
dim=200 norm residual=1e-250 mantissa=53/resultTime.txt:timer: 4.255858056  
dim=200 norm residual=1e-300 mantissa=53/resultTime.txt:timer: 4.299417494  
dim=300 norm residual=1e-100 mantissa=53/resultTime.txt:timer: 10.51071326  
dim=300 norm residual=1e-150 mantissa=53/resultTime.txt:timer: 10.368343828  
dim=300 norm residual=1e-200 mantissa=53/resultTime.txt:timer: 10.437339186  
dim=300 norm residual=1e-250 mantissa=53/resultTime.txt:timer: 10.314385187  
dim=300 norm residual=1e-300 mantissa=53/resultTime.txt:timer: 10.336085341  
dim=400 norm residual=1e-100 mantissa=53/resultTime.txt:timer: 18.085737118  
dim=400 norm residual=1e-150 mantissa=53/resultTime.txt:timer: 18.126490445  
dim=400 norm residual=1e-200 mantissa=53/resultTime.txt:timer: 18.117555716  
dim=400 norm residual=1e-250 mantissa=53/resultTime.txt:timer: 18.008305622  
dim=400 norm residual=1e-300 mantissa=53/resultTime.txt:timer: 18.173051074  
***  

Вывод: тест показал, что время работы программ едва отличается и для размерности СЛАУ Годунова равное 400 заметно, что для варианта программы без использования функции conj_grad() время работы меньше на 0,1 секунды.  
