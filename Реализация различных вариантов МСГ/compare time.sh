#!/bin/bash


#shell-скрипт "compare time.sh" служит для поиска строк, содержащих ключевое слово "timer: " во всех файлах в каталогах расположенных в одной директории со скриптом "compare time.sh":
#Поиск производится только в каталогах со следующими путями:
#/Kireev/result
#/Kireev1/result
#/Kireev2/result
#/Kireev3/result
#/Kireev 16 slide/result
#/Ushakov/result
#/Ushakov variant E/result

#Скрипт формирует текстовой файл "compare time.txt" содержащий найденные совпадения с ключевым словом вместе с путем до файла содержащего ключевое слово.

echo "Kireev 1 1"
ABSOLUTE_FILENAME=`readlink -e "$0"`       # полный путь до исполняемого файла test.sh
DIRECTORY=`dirname "$ABSOLUTE_FILENAME"`   # берем только каталог в котором находится test.sh

rm "$DIRECTORY/compare time.txt"

echo "
-----------------------------------------------------------------------------------------------------------Kireev 1 1
" >> "$DIRECTORY/compare time.txt"

echo &(grep -i --recursive "timer: " "$DIRECTORY/Kireev/result") >> "$DIRECTORY/compare.txt"

echo &(sort "$DIRECTORY/compare.txt") >> "compare time.txt"

echo "
-----------------------------------------------------------------------------------------------------------Kireev 1 2
" >> "$DIRECTORY/compare time.txt"

rm "$DIRECTORY/compare.txt"

echo &(grep -i --recursive  "timer: " "$DIRECTORY/Kireev1/result") >> "$DIRECTORY/compare.txt"

echo &(sort "$DIRECTORY/compare.txt") >> "compare time.txt"


echo "
-----------------------------------------------------------------------------------------------------------Kireev 2 1
" >> "$DIRECTORY/compare time.txt"

rm "$DIRECTORY/compare.txt"

echo &(grep -i --recursive  "timer: " "$DIRECTORY/Kireev2/result") >> "$DIRECTORY/compare.txt"

echo &(sort "$DIRECTORY/compare.txt") >> "compare time.txt"



echo "
-----------------------------------------------------------------------------------------------------------Kireev 2 2
" >> "$DIRECTORY/compare time.txt"

rm "$DIRECTORY/compare.txt"

echo &(grep -i --recursive  "timer: " "$DIRECTORY/Kireev3/result") >> "$DIRECTORY/compare.txt"

echo &(sort "$DIRECTORY/compare.txt") >> "compare time.txt"


echo "
-----------------------------------------------------------------------------------------------------------Kireev 16 slide
" >> "$DIRECTORY/compare time.txt"

rm "$DIRECTORY/compare.txt"

echo &(grep -i --recursive  "timer: " "$DIRECTORY/Kireev 16 slide/result") >> "$DIRECTORY/compare.txt"

echo &(sort "$DIRECTORY/compare.txt") >> "compare time.txt"


echo "
-----------------------------------------------------------------------------------------------------------Ushakov
" >> "$DIRECTORY/compare time.txt"

rm "$DIRECTORY/compare.txt"

echo &(grep -i --recursive  "timer: " "$DIRECTORY/Ushakov/result") >> "$DIRECTORY/compare.txt"

echo &(sort "$DIRECTORY/compare.txt") >> "compare time.txt"


echo "
-----------------------------------------------------------------------------------------------------------Ushakov variant E
" >> "$DIRECTORY/compare time.txt"

rm "$DIRECTORY/compare.txt"

echo &(grep -i --recursive  "timer: " "$DIRECTORY/Ushakov variant E/result") >> "$DIRECTORY/compare.txt"

echo &(sort "$DIRECTORY/compare.txt") >> "compare time.txt"

rm "$DIRECTORY/compare.txt"