#!/bin/bash
sed -e '1d' \
    -e 's/\(Rec[[:digit:]]\),/Name: \1   /g'\
    -e 's/\(Rec[[:digit:]]\{2\}\),/Name: \1  /g'\
    -e 's/\([[:digit:]]\{2\}\),\([[:digit:]]\{2\}\),\([[:digit:]]\{4\}\),\([[:alpha:]]\+\)/Height: \1  Width: \2  Area: \3  Colour: \4/g'\
    -e 's/\([[:digit:]]\{2\}\),\([[:digit:]]\{2\}\),\([[:digit:]]\{3\}\),\([[:alpha:]]\+\)/Height: \1  Width: \2  Area: \3   Colour: \4/g'\
    -e 's/\([[:digit:]]\),\([[:digit:]]\{2\}\),\([[:digit:]]\{3\}\),\([[:alpha:]]\+\)/Height: \1   Width: \2  Area: \3   Colour: \4/g'\
    -e 's/\([[:digit:]]\),\([[:digit:]]\{2\}\),\([[:digit:]]\{2\}\),\([[:alpha:]]\+\)/Height: \1   Width: \2  Area: \3    Colour: \4/g' rectangle.txt > rectangle2.txt
exit 0  