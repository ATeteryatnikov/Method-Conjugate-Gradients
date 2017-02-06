### Описание программы godunovMatrix

godunovMatrix - программа реализованная на языке программирования [Julia](https://ru.wikipedia.org/wiki/Julia_(язык_программирования)), для решения 
[СЛАУ Годунова](https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/blob/master/%D0%A1%D0%9B%D0%90%D0%A3%20%D0%93%D0%BE%D0%B4%D1%83%D0%BD%D0%BE%D0%B2%D0%B0.md)
[методом сопряженных градиентов](https://ru.wikipedia.org/wiki/Метод_сопряжённых_градиентов_(для_решения_СЛАУ)).  

В описываемой программе используется алгоритм МСГ из [презентации Киреева о МСГ](https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/blob/master/%D0%A0%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%80%D0%B0%D0%B7%D0%BB%D0%B8%D1%87%D0%BD%D1%8B%D1%85%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%D0%BE%D0%B2%20%D0%9C%D0%A1%D0%93/%D0%98%D1%81%D1%82%D0%BE%D1%87%D0%BD%D0%B8%D0%BA%D0%B8/%D0%9F%D1%80%D0%B5%D0%B7%D0%B5%D0%BD%D1%82%D0%B0%D1%86%D0%B8%D1%8F%20%D0%9A%D0%B8%D1%80%D0%B5%D0%B5%D0%B2%20%D0%BE%20%D0%9C%D0%A1%D0%93.pdf), 16 слайд.  

В качестве критерия остановки в цикле алгоритма МСГ используется максимально допустимое отклонение нормы градиента, цикл завершается при достижении нормы градиента не превышающей максимально допустимое отклонение нормы градиента. Дополнительный критерий остановки - ограничение на количество итераций.(см. код программы по [ссылке](https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/blob/master/%D0%9E%D0%BF%D0%B8%D1%81%D0%B0%D0%BD%D0%B8%D0%B5%20%D0%BA%D0%BE%D0%B4%D0%B0%20%D1%84%D0%B0%D0%B9%D0%BB%D0%B0%20godunovMatrix%20jl%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D1%8B%20godunovMatrix.md)).

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
* mantissa - значение мантиссы для типа данных BigFloat, указывается в битах (мантисса с которой производится расчет алгоритма МСГ);  
* mantissa_out - значение мантиссы для типа данных BigFloat предназначено для Уменьшение количества знаков после запятой при записи результатов в файл.

> в программе для расчетов используется тип данных BigFloat - для работы с числами произвольной точности, мантисса которых указывается пользователем (в конфигурационном файле config.txt параметр mantissa).

Пример конфигурационного файла по [ссылке](https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/blob/master/%D0%A0%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%80%D0%B0%D0%B7%D0%BB%D0%B8%D1%87%D0%BD%D1%8B%D1%85%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%D0%BE%D0%B2%20%D0%9C%D0%A1%D0%93/Kireev%2016%20slide/config.txt).

***  

#### Вывод результатов

В результате работы программы создается каталог result в каталоге, в котором находится исполняемый файл (godunovMatrix.jl).  
В каталоге result создаются файлы:  
* log.txt - содержит информацию о том, как завершилась работа программы (сработало ли ограничение на количестово итераций) и с какими входными параметрами программа была запущена;
* resultX.txt - результат работы алгоритма МСГ, вектор X;
* resultCompare.txt - выводит в левом столбце вектор полученный в результате работы алгоритма МСГ примененного к СЛАУ годунова, в правом столбце решение матрицы Годунова расчитанное по формулам (сделано для наглядного сравнения);
* resultDifference.txt - разность вектора полученного в результате работы алгоритма МСГ примененного к СЛАУ годунова и вектора решения СЛАУ Годунова расчитанного по формулам с увеличением мантиссы на 5 бит;
* resultTime.txt - время работы программы (в секундах);  
* maxDiffer.txt - максимальное по модулю число из resultDifference.txt.

Пример каталога result по [ссылке](https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/tree/master/%D0%A0%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%80%D0%B0%D0%B7%D0%BB%D0%B8%D1%87%D0%BD%D1%8B%D1%85%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%D0%BE%D0%B2%20%D0%9C%D0%A1%D0%93/Kireev%2016%20slide/result).

***

### файл godunovMatrix.jl

Запуск программы godunovMatrix производится через файл godunovMatrix.jl. 
Разбор кода godunovMatrix.jl по [ссылке](https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/blob/master/%D0%9E%D0%BF%D0%B8%D1%81%D0%B0%D0%BD%D0%B8%D0%B5%20%D0%BA%D0%BE%D0%B4%D0%B0%20%D1%84%D0%B0%D0%B9%D0%BB%D0%B0%20godunovMatrix%20jl%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D1%8B%20godunovMatrix.md).

***  

### файл readFile.jl

readFile.jl подключается в файле godunovMatrix.jl. readFile.jl производит считывание параметров программы из конфигурационного файла config.txt. (см. код [readFile.jl](https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/blob/master/%D0%A0%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%80%D0%B0%D0%B7%D0%BB%D0%B8%D1%87%D0%BD%D1%8B%D1%85%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%D0%BE%D0%B2%20%D0%9C%D0%A1%D0%93/Kireev%2016%20slide/readFile.jl))
