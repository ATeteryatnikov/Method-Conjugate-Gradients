### Внесение алгоритма МСГ в функцию названную conj_grad() и сравнение по времени работы с программой godunovMatrix без внесения в функцию алгоритма

Cравнение по времени работы 2 программ [godunovMatrix]
(https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/blob/master/%D0%9E%D0%BF%D0%B8%D1%81%D0%B0%D0%BD%D0%B8%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D1%8B%20godunovMatrix.md).    
Алгоритм взят из: [презентация Киреев И.В. «Метод сопряженных градиентов» - Красноярск, 2011
В программе реализован 16 слайд.]
(https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/blob/master/%D0%A0%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%80%D0%B0%D0%B7%D0%BB%D0%B8%D1%87%D0%BD%D1%8B%D1%85%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%D0%BE%D0%B2%20%D0%9C%D0%A1%D0%93/%D0%98%D1%81%D1%82%D0%BE%D1%87%D0%BD%D0%B8%D0%BA%D0%B8/%D0%9F%D1%80%D0%B5%D0%B7%D0%B5%D0%BD%D1%82%D0%B0%D1%86%D0%B8%D1%8F%20%D0%9A%D0%B8%D1%80%D0%B5%D0%B5%D0%B2%20%D0%BE%20%D0%9C%D0%A1%D0%93.pdf)  
Отличие программ состоит в том, что в одной из них часть алгоритма метода сопряженных градиентов, заключенная в цикле, реализована в виде функции conj_grad(). (см. функцию conj_grad() в коде программы по [ссылке]
(https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/blob/master/%D0%A2%D0%B5%D1%81%D1%82%D1%8B%20%D0%B8%20%D1%81%D1%80%D0%B0%D0%B2%D0%BD%D0%B5%D0%BD%D0%B8%D1%8F/%D0%92%D0%BD%D0%B5%D1%81%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B0%D0%BB%D0%B3%D0%BE%D1%80%D0%B8%D1%82%D0%BC%D0%B0%20%D0%9C%D0%A1%D0%93%20%D0%B2%20%D1%84%D1%83%D0%BD%D0%BA%D1%86%D0%B8%D1%8E%20conj_grad/MPFR%20Kireev%2016%20slide%20with%20function/godunovMatrix.jl))

[Результаты.](https://github.com/ATeteryatnikov/Method-Conjugate-Gradients/blob/master/%D0%A2%D0%B5%D1%81%D1%82%D1%8B%20%D0%B8%20%D1%81%D1%80%D0%B0%D0%B2%D0%BD%D0%B5%D0%BD%D0%B8%D1%8F/%D0%92%D0%BD%D0%B5%D1%81%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B0%D0%BB%D0%B3%D0%BE%D1%80%D0%B8%D1%82%D0%BC%D0%B0%20%D0%9C%D0%A1%D0%93%20%D0%B2%20%D1%84%D1%83%D0%BD%D0%BA%D1%86%D0%B8%D1%8E%20conj_grad/%D0%A0%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%D1%8B.md)

Вывод: тест показал, что время работы программ едва отличается и для размерности СЛАУ Годунова равное 400 заметно, что для варианта программы без использования функции conj_grad() время работы меньше на 0,1 секунды.  
