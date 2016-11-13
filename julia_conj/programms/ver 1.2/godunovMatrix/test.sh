#!/bin/bash

# утилита expr источник: Собель-Linux. Администрирование и системное 
#                        программирование-Питер (2011)  (стр 694)
#
# $var - означает значение переменной var.
#
#
num=0  # num - отвечает за нумерацию каталогов с результатами. 
mantissa=10000  # начальное значение
step_mantissa=50
end_mantissa=10200

ABSOLUTE_FILENAME=`readlink -e "$0"`       # полный путь до исполняемого файла test.sh
DIRECTORY=`dirname "$ABSOLUTE_FILENAME"`   # берем только каталог в котором находится test.sh

# $(expr $mantissa \< $end_mantissa) - если неравенство выполняется, то
# значение всего выражения = 1, иначе = 0.
#mkdir "$DIRECTORY/result"

while [ $(expr $mantissa \<\= $end_mantissa) = 1 ]
do
num=$(expr $num + 1)

rm config.txt  #удаление config.txt

echo "# ограничение на количество итераций
limit = 100

# размерность матрицы Годунова
Godunov_matrix_dim = 10

# максимально допустимое отклонение нормы градиента в точке
norm_residual = 1e-100

# мантисса
mantissa = $mantissa

# мантисса при записи вектора X в файл
mantissa_out = 1000

# путь к каталогу для вывода результатов
pathResult = $DIRECTORY/result/mantissa_$mantissa" >> config.txt
julia godunovMatrix.jl
mantissa=$(expr $mantissa + $step_mantissa)
done