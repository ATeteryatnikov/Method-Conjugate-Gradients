#!/bin/bash

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

rm "$DIRECTORY/compare.txt"

echo "
-----------------------------------------------------------------------------------------------------------Kireev 2 1
" >> "$DIRECTORY/compare time.txt"

rm "$DIRECTORY/compare.txt"

echo &(grep -i --recursive  "timer: " "$DIRECTORY/Kireev2/result") >> "$DIRECTORY/compare.txt"

echo &(sort "$DIRECTORY/compare.txt") >> "compare time.txt"

rm "$DIRECTORY/compare.txt"


echo "
-----------------------------------------------------------------------------------------------------------Kireev 2 2
" >> "$DIRECTORY/compare time.txt"

rm "$DIRECTORY/compare.txt"

echo &(grep -i --recursive  "timer: " "$DIRECTORY/Kireev3/result") >> "$DIRECTORY/compare.txt"

echo &(sort "$DIRECTORY/compare.txt") >> "compare time.txt"

rm "$DIRECTORY/compare.txt"