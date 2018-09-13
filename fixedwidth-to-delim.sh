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
echo "Col1|Col2|Col3" | gzip > NEW_FILE.txt.gz
gunzip -c FILE1.txt.gz | cut --output-delimiter="|" -b 88-95,98,99-107 | gzip >> NEW_FILE.txt.gz


#-------------------------------------------------------------------------
# To add quote to output file

# Set headers
echo "Col1|Col2|Col3" | gzip > NEW_FILE.txt.gz
gunzip -c FILE1.txt.gz | cut --output-delimiter='"|"' -b 88-95,98,99-107 | gzip >> NEW_FILE.txt.gz

# >>> This still need quotes at start end end, possibly
gunzip -c FILE1.txt.gz | cut --output-delimiter='"|"' -b 88-95,98,99-107 | sed -e 's/^/"/'| sed 's/$/"/' | gzip >> NEW_FILE.txt.gz
# however the above is realy slow

# this aproach...
echo "my standard in" | cat <(echo "prefix... ") <(cat -) <(echo " ...suffix")
# adds only to the start and end of the file

# this works much faster
gunzip -c FILE1.txt.gz | cut --output-delimiter='"|"' -b 88-95,98,99-107 | awk '{ print "\""$0"\""}' | gzip >> NEW_FILE.txt.gz

