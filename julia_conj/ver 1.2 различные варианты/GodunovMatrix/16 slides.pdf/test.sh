#!/bin/bash

# утилита expr источник: Собель-Linux. Администрирование и системное 
#                        программирование-Питер (2011)  (стр 694)
#
# $var - означает значение переменной var.
#
#
num=0  # num - отвечает за нумерацию каталогов с результатами. 

mantissa=100  # начальное значение
step_mantissa=100
end_mantissa=100

Godunov_matrix_dim=25
step_Godunov_matrix_dim=25
end_Godunov_matrix_dim=50

norm_residual=100
step_norm_residual=50
end_norm_residual=300

ABSOLUTE_FILENAME=`readlink -e "$0"`       # полный путь до исполняемого файла test.sh
DIRECTORY=`dirname "$ABSOLUTE_FILENAME"`   # берем только каталог в котором находится test.sh

# $(expr $mantissa \< $end_mantissa) - если неравенство выполняется, то
# значение всего выражения = 1, иначе = 0.
#mkdir "$DIRECTORY/result"

while [ $(expr $Godunov_matrix_dim \<\= $end_Godunov_matrix_dim) = 1 ]
do
mantissa=100
while [ $(expr $mantissa \<\= $end_mantissa) = 1 ]
do
norm_residual=100
while [ $(expr $norm_residual \<\= $end_norm_residual) = 1 ]
do

#num=$(expr $num + 1)

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

norm_residual=$(expr $norm_residual + $step_norm_residual)
done
mantissa=$(expr $mantissa + $step_mantissa)
done 
Godunov_matrix_dim=$(expr $Godunov_matrix_dim + $step_Godunov_matrix_dim)

done