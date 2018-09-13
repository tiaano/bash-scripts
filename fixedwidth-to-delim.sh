#! /bin/bash

# If you have a fixed width file "FILE1.txt"
# and you want to extract data into a pipe "|" delimited format

# Set headers
echo "Col1|Col2|Col3" > NEW_FILE.txt

# Extract and add data
cat FILE1.txt | cut --output-delimiter="|" -b 88-95,98,99-107 >> NEW_FILE.txt
