#!/bin/bash

# утилита expr источник: Собель-Linux. Администрирование и системное 
#                        программирование-Питер (2011)  (стр 694)
#
# $var - означает значение переменной var.
#
#
num=0  # num - отвечает за нумерацию каталогов с результатами. 

ABSOLUTE_FILENAME=`readlink -e "$0"`       # полный путь до исполняемого файла test.sh
DIRECTORY=`dirname "$ABSOLUTE_FILENAME"`   # берем только каталог в котором находится test.sh

# $(expr $mantissa \< $end_mantissa) - если неравенство выполняется, то
# значение всего выражения = 1, иначе = 0.
#mkdir "$DIRECTORY/result"

rm config.txt  #удаление config.txt

echo "# ограничение на количество итераций
limit = 100

# размерность матрицы Годунова
Godunov_matrix_dim = 100

# максимально допустимое отклонение нормы градиента в точке
norm_residual = 1e-300

# путь к каталогу для вывода результатов
pathResult = $DIRECTORY/result/dim=100 norm residual=1e-100" >> config.txt
julia -p 4 godunovMatrix.jl