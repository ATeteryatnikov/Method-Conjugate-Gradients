### Сравнение скорости работы программы godunovMatrix с использованием типа BigFloat с программой использующей тип Float64.

описание программы [godunovMatrix](https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/blob/master/%D0%9E%D0%BF%D0%B8%D1%81%D0%B0%D0%BD%D0%B8%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D1%8B%20godunovMatrix.md).  

Проверим, во сколько раз изменится время работы программы godunovMatrix, если изменить тип данных с BigFloat на Float64. Для этого была создана копия программы godunovMatrix, но с изменением типа данных BigFloat на Float64. 

> Для сравнения, величина мантиссы BigFloat в тесте была равна 53.

Алгоритм программы взят из:   
[презентация Киреев И.В. «Метод сопряженных градиентов» - Красноярск, 2011  
В программе реализован 16 слайд.](https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/blob/master/%D0%A0%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%80%D0%B0%D0%B7%D0%BB%D0%B8%D1%87%D0%BD%D1%8B%D1%85%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%D0%BE%D0%B2%20%D0%9C%D0%A1%D0%93/%D0%98%D1%81%D1%82%D0%BE%D1%87%D0%BD%D0%B8%D0%BA%D0%B8/%D0%9F%D1%80%D0%B5%D0%B7%D0%B5%D0%BD%D1%82%D0%B0%D1%86%D0%B8%D1%8F%20%D0%9A%D0%B8%D1%80%D0%B5%D0%B5%D0%B2%20%D0%BE%20%D0%9C%D0%A1%D0%93.pdf)  

[Результаты](https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/blob/master/%D0%A2%D0%B5%D1%81%D1%82%D1%8B%20%D0%B8%20%D1%81%D1%80%D0%B0%D0%B2%D0%BD%D0%B5%D0%BD%D0%B8%D1%8F/%D0%A1%D1%80%D0%B0%D0%B2%D0%BD%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B2%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%B8%20%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D1%8B%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D1%8B%20%D1%81%20%D0%B8%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%D0%BC%20BigFloat%20%D0%B8%20%D1%81%20Float64/%D0%A0%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%D1%8B.md).  

Вывод: Использование BigFloat замедляет работу программы  
для размерности матрицы Годунова 400, приблизительно в 57 раз.  
для размерности матрицы Годунова 300, приблизительно в 32 раза.  
для размерности матрицы Годунова 200, приблизительно в 16 раз.  
для размерности матрицы Годунова 150, приблизительно в 10 раз.   
для размерности матрицы Годунова 100, приблизительно в 5 раз.  
для размерности матрицы Годунова 50, приблизительно в 2 раза.


 
