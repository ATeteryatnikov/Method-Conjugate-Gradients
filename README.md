### Репозиторий Method-Conjugate-Gradients  

В своих работах я использую программу написанную на языке программирования [Julia](https://ru.wikipedia.org/wiki/Julia_(язык_программирования)), программу будем называть "godunovMatrix". godunovMatrix решает [СЛАУ Годунова](https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/blob/master/%D0%A1%D0%9B%D0%90%D0%A3%20%D0%93%D0%BE%D0%B4%D1%83%D0%BD%D0%BE%D0%B2%D0%B0.md) [методом сопряженных градиентов](https://ru.wikipedia.org/wiki/Метод_сопряжённых_градиентов_(для_решения_СЛАУ)). Подробное описание программы по [ссылке]().

В репозитории "Method-Conjugate-Gradients" располагаются следующие работы:  
* [Реализация различных вариантов МСГ](https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/tree/master/Реализация%20различных%20вариантов%20МСГ) - сравнение программ [godunovMatrix]() отличающихся алгоритмами метода сопряженных градиентов взятыми из 3 [источников](https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/tree/master/Реализация%20различных%20вариантов%20МСГ/Источники).  
* [Тесты и сравнения](https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/tree/master/Тесты%20и%20сравнения) - включает в себя сравнения:
  * [Сравнение скорости работы программы godunovMatrix с программой МСГ реализованной на C++](https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/tree/master/Тесты%20и%20сравнения/сравнение%20скорости%20работы%20C%2B%2B%20и%20Julia).
  
  * Сравнения по времени работы программы [godunovMatrix]() с некоторыми изменениями:    
    * [изменение используемого типа данных с BigFloat на Float64](https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/tree/master/Тесты%20и%20сравнения/Сравнение%20времени%20работы%20программы%20с%20использованием%20BigFloat%20и%20с%20Float64)  
    * [Изменение матричного умножения заложенного в Julia на умножением матриц через цикл for](https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/tree/master/Тесты%20и%20сравнения/Сравнение%20матричного%20умножения%20заложенного%20в%20Julia%20с%20умножением%20матриц%20через%20цикл%20for)  
    * [внесение алгоритма метода сопряженных градиентов в функцию](https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/tree/master/Тесты%20и%20сравнения/Внесение%20алгоритма%20МСГ%20в%20функцию%20conj_grad)  
