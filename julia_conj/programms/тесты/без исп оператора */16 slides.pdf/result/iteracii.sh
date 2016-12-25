#!/bin/bash


ABSOLUTE_FILENAME=`readlink -e "$0"`       # полный путь до исполняемого файла test.sh
DIRECTORY=`dirname "$ABSOLUTE_FILENAME"`   # берем только каталог в котором находится test.sh

echo &(grep -i --recursive "количество" "$DIRECTORY") >> "$DIRECTORY/Iteracii.txt"

