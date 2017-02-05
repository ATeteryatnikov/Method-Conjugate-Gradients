### Сравнение различных версий метода сопряженных градиентов

Проведены запуски различных вариантов программы [godunovMatrix](https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/blob/master/%D0%9E%D0%BF%D0%B8%D1%81%D0%B0%D0%BD%D0%B8%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D1%8B%20godunovMatrix.md) с четыремя разными параметрами запуска.  
Отличие программ заключается в алгоритме МСГ, который взят из источников:
* [Алгоритм МСГ Ушакова](https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/blob/master/%D0%A0%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%80%D0%B0%D0%B7%D0%BB%D0%B8%D1%87%D0%BD%D1%8B%D1%85%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%D0%BE%D0%B2%20%D0%9C%D0%A1%D0%93/%D0%98%D1%81%D1%82%D0%BE%D1%87%D0%BD%D0%B8%D0%BA%D0%B8/%D0%90%D0%BB%D0%B3%D0%BE%D1%80%D0%B8%D1%82%D0%BC%20%D0%A3%D1%88%D0%B0%D0%BA%D0%BE%D0%B2%D0%B0.png);
* [Алгоритм МСГ Ушакова с изменениями](https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/blob/master/%D0%A0%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%80%D0%B0%D0%B7%D0%BB%D0%B8%D1%87%D0%BD%D1%8B%D1%85%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%D0%BE%D0%B2%20%D0%9C%D0%A1%D0%93/%D0%98%D1%81%D1%82%D0%BE%D1%87%D0%BD%D0%B8%D0%BA%D0%B8/%D0%90%D0%BB%D0%B3%D0%BE%D1%80%D0%B8%D1%82%D0%BC%20%D0%9C%D0%A1%D0%93%20%D0%A3%D1%88%D0%B0%D0%BA%D0%BE%D0%B2%D0%B0%20%D1%81%20%D0%B8%D0%B7%D0%BC%D0%B5%D0%BD%D0%B5%D0%BD%D0%B8%D1%8F%D0%BC%D0%B8.png)
* [Презентация Киреев И.В. «Метод сопряженных градиентов» - Красноярск, 2011, 16 слайд](https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/blob/master/%D0%A0%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%80%D0%B0%D0%B7%D0%BB%D0%B8%D1%87%D0%BD%D1%8B%D1%85%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%D0%BE%D0%B2%20%D0%9C%D0%A1%D0%93/%D0%98%D1%81%D1%82%D0%BE%D1%87%D0%BD%D0%B8%D0%BA%D0%B8/%D0%9F%D1%80%D0%B5%D0%B7%D0%B5%D0%BD%D1%82%D0%B0%D1%86%D0%B8%D1%8F%20%D0%9A%D0%B8%D1%80%D0%B5%D0%B5%D0%B2%20%D0%BE%20%D0%9C%D0%A1%D0%93.pdf);
* [Киреев И.В. Экономичные критерии останова итераций в методе сопряженных градиентов 2015](https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/blob/master/%D0%A0%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%80%D0%B0%D0%B7%D0%BB%D0%B8%D1%87%D0%BD%D1%8B%D1%85%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%D0%BE%D0%B2%20%D0%9C%D0%A1%D0%93/%D0%98%D1%81%D1%82%D0%BE%D1%87%D0%BD%D0%B8%D0%BA%D0%B8/%D0%9A%D0%B8%D1%80%D0%B5%D0%B5%D0%B2%20%D0%98.%D0%92.%20%D0%AD%D0%BA%D0%BE%D0%BD%D0%BE%D0%BC%D0%B8%D1%87%D0%BD%D1%8B%D0%B5%20%D0%BA%D1%80%D0%B8%D1%82%D0%B5%D1%80%D0%B8%D0%B8%20%D0%BE%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%B0%20%D0%B8%D1%82%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B9%20%D0%B2%20%D0%BC%D0%B5%D1%82%D0%BE%D0%B4%D0%B5%20%D1%81%D0%BE%D0%BF%D1%80%D1%8F%D0%B6%D0%B5%D0%BD%D0%BD%D1%8B%D1%85%20%D0%B3%D1%80%D0%B0%D0%B4%D0%B8%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%202015.pdf), алгоритм приведен на 2 странице. Для вычисления коэффициентов даны на выбор по 2 формулы: <img src="https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/blob/master/%D0%BC%D0%B0%D1%82%D0%B5%D1%80%D0%B8%D0%B0%D0%BB%D1%8B%20%D0%B4%D0%BB%D1%8F%20readme/%D0%BA%D0%BE%D1%8D%D1%84%D1%84%D0%B8%D1%86%D0%B8%D0%B5%D0%BD%D1%82%D1%8B%20%D0%B2%20%D0%B0%D0%BB%D0%B3%D0%BE%D1%80%D0%B8%D1%82%D0%BC%D0%B5%20%D0%9C%D0%A1%D0%93%20%D0%9A%D0%B8%D1%80%D0%B5%D0%B5%D0%B2%D0%B01.png" width="600">  
Получаем 4 алгоритма при использовании различных формул.

Параметры запуска программ godunovMatrix:  
1. dim=200 norm residual=1e-500 mantissa=2000  
2. dim=100 norm residual=1e-250 mantissa=1000  
3. dim=50 norm residual=1e-125 mantissa=500  
4. dim=25 norm residual=1e-62 mantissa=250

где dim — размерность СЛАУ Годунова, norm residual — максимально допустимое отклонение нормы градиента (служит критерием остановки в цикле алгоритма МСГ), mantissa — количество бит в мантиссе чисел типа BigFloat.

При каждом запуске программы godunovMatrix в каталоге «result» создается каталог в названии которого указываются параметры запуска. В этом каталоге сохраняются результаты работы программы в файлы:

* log.txt — описывает по какому критерию программа остановила расчет (сработало ограничение на количество итераций или отклонение нормы градиента не превышает максимальное), содержит входные параметры,выставленное ограничение на количество итераций и полученное отклонение нормы градиента.
* resultCompare.txt — два столбца — вектор полученного решения в результате работы МСГ и вектор решения СЛАУ Годунова рассчитанного по формулам.
* resultDifference.txt - разность вектора полученного решения в результате работы МСГ и вектора решения СЛАУ Годунова рассчитанного по формулам.
* maxDiffer.txt — максимальное по модулю число из resultDifference.txt.
* resultTime.txt — время работы алгоритма МСГ.
* resultX.txt - вектор полученного решения в результате работы МСГ.

***

Полученное время работы программ при различных параметрах (время указывается в секундах):  
<a name="нумерация"></a>  
1)Киреев И.В. Экономичные критерии останова итераций в методе сопряженных градиентов 2015[использована 1 формула для расчета альфа и 1 формула для расчета бета:

dim=200 norm residual=1e-500 mantissa=2000 timer: 19.085446518  
dim=100 norm residual=1e-250 mantissa=1000 timer: 3.933407718  
dim=50 norm residual=1e-125 mantissa=500 timer: 1.125106475  
dim=25 norm residual=1e-62 mantissa=250 timer: .832668464  

2)Киреев И.В. Экономичные критерии останова итераций в методе сопряженных градиентов 2015
использована 1 формула для расчета альфа и 2 формула для расчета бета:

dim=200 norm residual=1e-500 mantissa=2000 timer: 13.131313187  
dim=100 norm residual=1e-250 mantissa=1000 timer: 2.784430227  
dim=50 norm residual=1e-125 mantissa=500 timer: 1.01434431  
dim=25 norm residual=1e-62 mantissa=250 timer: .820628748  

3)Киреев И.В. Экономичные критерии останова итераций в методе сопряженных градиентов 2015
использована 2 формула для расчета альфа и 1 формула для расчета бета:

dim=200 norm residual=1e-500 mantissa=2000 timer: 19.399853095  
dim=100 norm residual=1e-250 mantissa=1000 timer: 3.990158701  
dim=50 norm residual=1e-125 mantissa=500 timer: 1.13305135  
dim=25 norm residual=1e-62 mantissa=250 timer: .827894873  

4)Киреев И.В. Экономичные критерии останова итераций в методе сопряженных градиентов 2015
использована 2 формула для расчета альфа и 2 формула для расчета бета:

dim=200 norm residual=1e-500 mantissa=2000 timer: 13.295699026  
dim=100 norm residual=1e-250 mantissa=1000 timer: 2.760137909  
dim=50 norm residual=1e-125 mantissa=500 timer: 1.015523375  
dim=25 norm residual=1e-62 mantissa=250 timer: .821944988  

5)презентация Киреев И.В. «Метод сопряженных градиентов» - Красноярск, 2011 — 16 слайд:

dim=200 norm residual=1e-500 mantissa=2000 timer: 6.694421971  
dim=100 norm residual=1e-250 mantissa=1000 timer: 1.611667973  
dim=50 norm residual=1e-125 mantissa=500 timer: .651669404  
dim=25 norm residual=1e-62 mantissa=250 timer: .533816934  

6)Слайды Ушакова о МСГ:

dim=200 norm residual=1e-500 mantissa=2000 timer: 15.10778447  
dim=100 norm residual=1e-250 mantissa=1000 timer: 3.959465588  
dim=50 norm residual=1e-125 mantissa=500 timer: 2.097025044  
dim=25 norm residual=1e-62 mantissa=250 timer: 1.932025239  

7)Слайды Ушакова о МСГ (в алгоритме изначально не домножаем матрицу A и вектор B на транспонированную матрицу A слева, а умножение производим в цикле):  

dim=200 norm residual=1e-500 mantissa=2000 timer: 9.927693616  
dim=100 norm residual=1e-250 mantissa=1000 timer: 2.881636564  
dim=50 norm residual=1e-125 mantissa=500 timer: 2.178825141  
dim=25 norm residual=1e-62 mantissa=250 timer: 2.080774947  

Сравним время работы программ для разных размерностей (цифры указывают на номер программы, [нумерация указана выше](#нумерация)):  
dim=200 5<7<2<4<6<1<3  
dim=100 5<4<2<7<1<6<3  
dim=50  5<2<4<1<3<6<7  
dim=25  5<2<4<3<1<6<7  

(меньше - меньше время работы программы godunovMatrix.jl)

***

Полученный максимальный по модулю элемент вектора разности полученного решения в результате работы МСГ и вектора решения СЛАУ Годунова рассчитанного по формулам.

1)Киреев И.В. Экономичные критерии останова итераций в методе сопряженных градиентов 2015
использована 1 формула для расчета альфа и 1 формула для расчета бета:

dim=200 norm residual=1e-500 mantissa=2000 maxDifference: 8.906e-02  
dim=100 norm residual=1e-250 mantissa=1000 maxDifference: 1.417e-220  
dim=50 norm residual=1e-125 mantissa=500 maxDifference: 1.147e-110  
dim=25 norm residual=1e-62 mantissa=250 maxDifference: 3.455e-56  

2)Киреев И.В. Экономичные критерии останова итераций в методе сопряженных градиентов 2015
использована 1 формула для расчета альфа и 2 формула для расчета бета:

dim=200 norm residual=1e-500 mantissa=2000 maxDifference: 8.906e-02  
dim=100 norm residual=1e-250 mantissa=1000 maxDifference: 6.978e-220  
dim=50 norm residual=1e-125 mantissa=500 maxDifference: 8.114e-111  
dim=25 norm residual=1e-62 mantissa=250 maxDifference: 4.233e-56  

3)Киреев И.В. Экономичные критерии останова итераций в методе сопряженных градиентов 2015
использована 2 формула для расчета альфа и 1 формула для расчета бета:

dim=200 norm residual=1e-500 mantissa=2000 maxDifference: 8.906e-02  
dim=100 norm residual=1e-250 mantissa=1000 maxDifference: 7.440e-220  
dim=50 norm residual=1e-125 mantissa=500 maxDifference: 1.129e-110  
dim=25 norm residual=1e-62 mantissa=250 maxDifference: 3.452e-56  


4)Киреев И.В. Экономичные критерии останова итераций в методе сопряженных градиентов 2015
использована 2 формула для расчета альфа и 2 формула для расчета бета:

dim=200 norm residual=1e-500 mantissa=2000 maxDifference: 8.906e-02  
dim=100 norm residual=1e-250 mantissa=1000 maxDifference: 2.404e-219  
dim=50 norm residual=1e-125 mantissa=500 maxDifference: 1.340e-110  
dim=25 norm residual=1e-62 mantissa=250 maxDifference: 2.956e-56  

5)презентация Киреев И.В. «Метод сопряженных градиентов» - Красноярск, 2011 — 16 слайд:

dim=200 norm residual=1e-500 mantissa=2000 maxDifference: 8.906e-02  
dim=100 norm residual=1e-250 mantissa=1000 maxDifference: 1.586e-219  
dim=50 norm residual=1e-125 mantissa=500 maxDifference: 7.372e-111  
dim=25 norm residual=1e-62 mantissa=250 maxDifference: 2.950e-56  

6)Слайды Ушакова о МСГ:

dim=200 norm residual=1e-500 mantissa=2000 maxDifference: 8.906e-02  
dim=100 norm residual=1e-250 mantissa=1000 maxDifference: 4.108e-220  
dim=50 norm residual=1e-125 mantissa=500 maxDifference: 1.362e-110  
dim=25 norm residual=1e-62 mantissa=250 maxDifference: 5.703e-57  

7)Слайды Ушакова о МСГ (в алгоритме изначально не домножаем матрицу A и вектор B на транспонированную матрицу A слева, а умножение производим в цикле):


dim=200 norm residual=1e-500 mantissa=2000 maxDifference: 4.337e-04  
dim=100 norm residual=1e-250 mantissa=1000 maxDifference: 8.638e-04  
dim=50 norm residual=1e-125 mantissa=500 maxDifference: 1.714e-03  
dim=25 norm residual=1e-62 mantissa=250 maxDifference: 3.384e-03  

Сравним максимальные отклонения решения СЛАУ методом МСГ от решения СЛАУ годунова расчитанного по формулам для разных размерностей:

dim=200 7<1=6=2=3=5=4  
dim=100 1<6<2<3<5<4<7  
dim=50  5<2<3<1<4<6<7  
dim=25  6<5<4<3<1<2<7  

(меньше — меньше максимальное отклонение)  
***
