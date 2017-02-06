#!/bin/bash

#shell-скрипт "compare time.sh" служит для поиска строк, содержащих ключевое слово "timer: " во всех файлах в каталогах расположенных в одной директории со скриптом "compare time.sh":
#Поиск производится только в каталогах со следующими путями:
#/Kireev 16 slide with Float64/result
#/Kireev 16 slide with BigFloat/result

#Скрипт формирует текстовой файл "compare time.txt" содержащий найденные совпадения с ключевым словом вместе с путем до файла содержащего ключевое слово.



ABSOLUTE_FILENAME=`readlink -e "$0"`       # полный путь до исполняемого файла test.sh
DIRECTORY=`dirname "$ABSOLUTE_FILENAME"`   # берем только каталог в котором находится test.sh

rm "$DIRECTORY/compare time.txt"


echo "
------------------------------with Float64
" >> "$DIRECTORY/compare time.txt"

echo &(grep -i --recursive "timer: " "$DIRECTORY/Kireev 16 slide with Float64/result") >> "$DIRECTORY/compare.txt"

echo &(sort "$DIRECTORY/compare.txt") >> "compare time.txt"

echo "
------------------------------with BigFloat
" >> "$DIRECTORY/compare time.txt"

rm "$DIRECTORY/compare.txt"

echo &(grep -i --recursive  "timer: " "$DIRECTORY/Kireev 16 slide with BigFloat/result") >> "$DIRECTORY/compare.txt"

echo &(sort "$DIRECTORY/compare.txt") >> "compare time.txt"

rm "$DIRECTORY/compare.txt"
