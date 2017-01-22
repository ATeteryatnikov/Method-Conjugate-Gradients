#!/bin/bash

echo "Kireev 1 1"
ABSOLUTE_FILENAME=`readlink -e "$0"`       # полный путь до исполняемого файла test.sh
DIRECTORY=`dirname "$ABSOLUTE_FILENAME"`   # берем только каталог в котором находится test.sh

rm "$DIRECTORY/compare maxDifference.txt"

echo "
-----------------------------------------------------------------------------------------------------------Kireev 1 1
" >> "$DIRECTORY/compare maxDifference.txt"

echo &(grep -i --recursive "maxDifference: " "$DIRECTORY/Kireev/result") >> "$DIRECTORY/compare.txt"

echo &(sort "$DIRECTORY/compare.txt") >> "compare maxDifference.txt"

echo "
-----------------------------------------------------------------------------------------------------------Kireev 1 2
" >> "$DIRECTORY/compare maxDifference.txt"

rm "$DIRECTORY/compare.txt"

echo &(grep -i --recursive  "maxDifference: " "$DIRECTORY/Kireev1/result") >> "$DIRECTORY/compare.txt"

echo &(sort "$DIRECTORY/compare.txt") >> "compare maxDifference.txt"


echo "
-----------------------------------------------------------------------------------------------------------Kireev 2 1
" >> "$DIRECTORY/compare maxDifference.txt"

rm "$DIRECTORY/compare.txt"

echo &(grep -i --recursive  "maxDifference: " "$DIRECTORY/Kireev2/result") >> "$DIRECTORY/compare.txt"

echo &(sort "$DIRECTORY/compare.txt") >> "compare maxDifference.txt"



echo "
-----------------------------------------------------------------------------------------------------------Kireev 2 2
" >> "$DIRECTORY/compare maxDifference.txt"

rm "$DIRECTORY/compare.txt"

echo &(grep -i --recursive  "maxDifference: " "$DIRECTORY/Kireev3/result") >> "$DIRECTORY/compare.txt"

echo &(sort "$DIRECTORY/compare.txt") >> "compare maxDifference.txt"


echo "
-----------------------------------------------------------------------------------------------------------Kireev 16 slide
" >> "$DIRECTORY/compare maxDifference.txt"

rm "$DIRECTORY/compare.txt"

echo &(grep -i --recursive  "maxDifference: " "$DIRECTORY/Kireev 16 slide/result") >> "$DIRECTORY/compare.txt"

echo &(sort "$DIRECTORY/compare.txt") >> "compare maxDifference.txt"


echo "
-----------------------------------------------------------------------------------------------------------Ushakov
" >> "$DIRECTORY/compare maxDifference.txt"

rm "$DIRECTORY/compare.txt"

echo &(grep -i --recursive  "maxDifference: " "$DIRECTORY/Ushakov/result") >> "$DIRECTORY/compare.txt"

echo &(sort "$DIRECTORY/compare.txt") >> "compare maxDifference.txt"


echo "
-----------------------------------------------------------------------------------------------------------Ushakov variant E
" >> "$DIRECTORY/compare maxDifference.txt"

rm "$DIRECTORY/compare.txt"

echo &(grep -i --recursive  "maxDifference: " "$DIRECTORY/Ushakov variant E/result") >> "$DIRECTORY/compare.txt"

echo &(sort "$DIRECTORY/compare.txt") >> "compare maxDifference.txt"

rm "$DIRECTORY/compare.txt"