#Name: Jack Moseley, Student number: 10424362

#!/bin/bash

#Ask the user to enter a file to be formatted
read -p "Enter a file or filepath: " file 

#Check if the file exists
rectangleFile=`find ~ -name "$file"` 

#If the file exists, then begin formatting the file  
if [ -f "$rectangleFile" ]; then 
    #The header line of the input file is removed first, followed by "Name:", "Height:", "Width:", "Area:" and "Colour:" being added to the 
    #each successive line
    sed -e '1d'\
        -e 's/\(Rec[[:digit:]]\),/Name: \1   /g'\
        -e 's/\(Rec[[:digit:]]\{2\}\),/Name: \1  /g'\
        -e 's/\([[:digit:]]\{2\}\),\([[:digit:]]\{2\}\),\([[:digit:]]\{4\}\),\([[:alpha:]]\+\)/Height: \1  Width: \2  Area: \3  Colour: \4/g'\
        -e 's/\([[:digit:]]\{2\}\),\([[:digit:]]\{2\}\),\([[:digit:]]\{3\}\),\([[:alpha:]]\+\)/Height: \1  Width: \2  Area: \3   Colour: \4/g'\
        -e 's/\([[:digit:]]\),\([[:digit:]]\{2\}\),\([[:digit:]]\{3\}\),\([[:alpha:]]\+\)/Height: \1   Width: \2  Area: \3   Colour: \4/g'\
        -e 's/\([[:digit:]]\),\([[:digit:]]\{2\}\),\([[:digit:]]\{2\}\),\([[:alpha:]]\+\)/Height: \1   Width: \2  Area: \3    Colour: \4/g' "$rectangleFile" > rectangle_f.txt
    echo "File successfully formatted"    
    exit 0

#If the file doesn't exist, then tell the user that the file wasn't found    
else
    echo "file not found:"
    exit 1
fi
