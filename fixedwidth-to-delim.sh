#! /bin/bash

# If you have a fixed width file "FILE1.txt"
# and you want to extract data into a pipe "|" delimited format

# Set headers
echo "Col1|Col2|Col3" > NEW_FILE.txt

# Extract and add data (-b is to extract specific bytes from file, starting with 1)
cat FILE1.txt | cut --output-delimiter="|" -b 88-95,98,99-107 >> NEW_FILE.txt

#-------------------------------------------------------------------------
# Do the above from a gzip file strait to another gzip file

# Set headers
echo "Col1|Col2|Col3" | gxip > NEW_FILE.txt.gz
gunzip -c FILE1.txt.gz | cut --output-delimiter="|" -b 88-95,98,99-107 | gzip >> NEW_FILE.txt.gz

