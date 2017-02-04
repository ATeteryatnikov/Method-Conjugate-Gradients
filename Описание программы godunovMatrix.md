### Описание программы godunovMatrix

godunovMatrix - программа реализованная на языке программирования [Julia](https://ru.wikipedia.org/wiki/Julia_(язык_программирования)), для решения 
[СЛАУ Годунова](https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/blob/master/%D0%A1%D0%9B%D0%90%D0%A3%20%D0%93%D0%BE%D0%B4%D1%83%D0%BD%D0%BE%D0%B2%D0%B0.md)
[методом сопряженных градиентов](https://ru.wikipedia.org/wiki/Метод_сопряжённых_градиентов_(для_решения_СЛАУ)).  

В описываемой программе используется алгоритм МСГ из [презентации Киреева о МСГ](https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/blob/master/%D0%A0%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%80%D0%B0%D0%B7%D0%BB%D0%B8%D1%87%D0%BD%D1%8B%D1%85%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%D0%BE%D0%B2%20%D0%9C%D0%A1%D0%93/%D0%98%D1%81%D1%82%D0%BE%D1%87%D0%BD%D0%B8%D0%BA%D0%B8/%D0%9F%D1%80%D0%B5%D0%B7%D0%B5%D0%BD%D1%82%D0%B0%D1%86%D0%B8%D1%8F%20%D0%9A%D0%B8%D1%80%D0%B5%D0%B5%D0%B2%20%D0%BE%20%D0%9C%D0%A1%D0%93.pdf)
, 16 слайд.  
Программа расположена по [ссылке](https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/tree/master/%D0%A0%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%80%D0%B0%D0%B7%D0%BB%D0%B8%D1%87%D0%BD%D1%8B%D1%85%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%D0%BE%D0%B2%20%D0%9C%D0%A1%D0%93/Kireev%2016%20slide).  
> В момент написания программы использовалась Julia версии 0.4.5.  

Программа состоит из 3 файлов: Главная часть программы godunovMatrix.jl, модуля readFile.jl подключаемого в главной части и
конфигурационного файла config.txt.  

***  

#### Файл config.txt

В конфигурационном файле "config.txt" программы godunovMatrix указываются входные параметры:
* limit - ограничение на количество итераций в цикле МСГ;  
* Godunov_matrix_dim - размерность СЛАУ Годунова;  
* norm_residual - максимально допустимое отклонение нормы градиента в точке X;  
* mantissa - значение мантиссы для типа данных BigFloat, указывается в битах;  
* mantissa_out - мантисса BigFloat при записи в файл.  

> в программе для расчетов используется тип данных BigFloat - для работы с числами произвольной точности, мантисса которых указывается пользователем (в конфигурационном файле config.txt параметр mantissa).

Пример конфигурационного файла по [ссылке](https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/blob/master/%D0%A0%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%80%D0%B0%D0%B7%D0%BB%D0%B8%D1%87%D0%BD%D1%8B%D1%85%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%D0%BE%D0%B2%20%D0%9C%D0%A1%D0%93/Kireev%2016%20slide/config.txt).

***  

#### Вывод результатов

В результате работы программы создается каталог result в каталоге, в котором находится исполняемый файл (godunovMatrix.jl).  
В каталоге result создаются файлы:  
* log.txt - содержит информацию о том, как завершилась работа программы (сработало ли ограничение на количестово итераций) и с какими входными параметрами программа была запущена;
* resultX.txt - результат работы алгоритма МСГ, вектор X;
* resultCompare.txt - выводит в левом столбце вектор X (результат МСГ), в правом столбце решение матрицы Годунова. Сделано для наглядного сравнения;
* resultDifference.txt - разность векторов полученного в результате МСГ и решения матрицы Годунова;
* resultTime.txt - время работы программы (в секундах).

Пример каталога result по [ссылке](https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/tree/master/%D0%A0%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%80%D0%B0%D0%B7%D0%BB%D0%B8%D1%87%D0%BD%D1%8B%D1%85%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%D0%BE%D0%B2%20%D0%9C%D0%A1%D0%93/Kireev%2016%20slide/result).




