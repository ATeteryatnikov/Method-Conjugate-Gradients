#!/bin/bash


ABSOLUTE_FILENAME=`readlink -e "$0"`       # полный путь до исполняемого файла test.sh
DIRECTORY=`dirname "$ABSOLUTE_FILENAME"`   # берем только каталог в котором находится test.sh

rm "$DIRECTORY/compare time.txt"

echo &(grep -i --recursive "timer: " "$DIRECTORY/16 slides.pdf/result") >> "$DIRECTORY/compare.txt"

echo &(sort "$DIRECTORY/compare.txt") >> "compare time.txt"

echo "
------------------------------with MPFR
" >> "$DIRECTORY/compare time.txt"

rm "$DIRECTORY/compare.txt"

echo &(grep -i --recursive  "timer: " "$DIRECTORY/MPFR 16 slides.pdf/result") >> "$DIRECTORY/compare.txt"

echo &(sort "$DIRECTORY/compare.txt") >> "compare time.txt"

rm "$DIRECTORY/compare.txt"