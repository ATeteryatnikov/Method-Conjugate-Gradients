#!/bin/bash

# утилита expr источник: Собель-Linux. Администрирование и системное 
#                        программирование-Питер (2011)  (стр 694)
#
# $var - означает значение переменной var.
#

Godunov_matrix_dim=25
#step_Godunov_matrix_dim=25
end_Godunov_matrix_dim=200

ABSOLUTE_FILENAME=`readlink -e "$0"`       # полный путь до исполняемого файла test.sh
DIRECTORY=`dirname "$ABSOLUTE_FILENAME"`   # берем только каталог в котором находится test.sh

# $(expr $mantissa \< $end_mantissa) - если неравенство выполняется, то
# значение всего выражения = 1, иначе = 0.
#mkdir "$DIRECTORY/result"

while [ $(expr $Godunov_matrix_dim \<\= $end_Godunov_matrix_dim) = 1 ]
do
#num=$(expr $num + 1)
mantissa=$(expr $Godunov_matrix_dim \* 10)
norm_residual=$(expr $mantissa \/ 4)

rm config.txt  #удаление config.txt

echo "# ограничение на количество итераций
limit = 100

# размерность матрицы Годунова
Godunov_matrix_dim = $Godunov_matrix_dim

# максимально допустимое отклонение нормы градиента в точке
norm_residual = 1e-$norm_residual

# мантисса
mantissa = $mantissa

# мантисса при записи вектора X в файл
mantissa_out = $mantissa

# путь к каталогу для вывода результатов
pathResult = $DIRECTORY/result/dim=$Godunov_matrix_dim norm residual=1e-$norm_residual mantissa=$mantissa" >> config.txt
julia -p 4 godunovMatrix.jl
echo "norm_residual = 1e-$norm_residual
mantissa = $mantissa
Godunov_matrix_dim = $Godunov_matrix_dim"

Godunov_matrix_dim=$(expr $Godunov_matrix_dim \* 2)
done 
