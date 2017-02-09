#!/bin/bash

# shell-скрипт "compare time.sh" служит для поиска строк, содержащих ключевое слово "timer: " во всех файлах в каталогах расположенных в одной директории со скриптом "compare time.sh":

# Поиск производится только в каталогах со следующими путями:
#/MPFR Kireev 16 slide with function/result
#/MPFR Kireev 16 slide/result

#Скрипт формирует текстовой файл "compare time.txt" содержащий найденные совпадения с ключевым словом вместе с путем до файла содержащего ключевое слово.


ABSOLUTE_FILENAME=`readlink -e "$0"`       # полный путь до исполняемого файла
DIRECTORY=`dirname "$ABSOLUTE_FILENAME"`   # берем только каталог в котором находится исполняемый файл

rm "$DIRECTORY/compare time.txt"

echo "
------------------------------Без представления алгоритма МСГ в виде функции
" >> "$DIRECTORY/compare time.txt"

echo &(grep -i  --recursive "timer: " "$DIRECTORY/MPFR Kireev 16 slide/result") >> "$DIRECTORY/compare.txt"

echo &(sort "$DIRECTORY/compare.txt") >> "compare time.txt"

echo "
------------------------------С представлением алгоритма МСГ в виде функции
" >> "$DIRECTORY/compare time.txt"

rm "$DIRECTORY/compare.txt"

echo &(grep -i --recursive  "timer: " "$DIRECTORY/MPFR Kireev 16 slide with function/result") >> "$DIRECTORY/compare.txt"

echo &(sort "$DIRECTORY/compare.txt") >> "compare time.txt"

rm "$DIRECTORY/compare.txt"

julia "$DIRECTORY/cut.jl"
