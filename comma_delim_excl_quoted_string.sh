#! /bin/bash

# If you have a CSV file "FILE1.txt"
# and you want to extract only certain columns, but there are commas within quoted text columns

# Set headers
echo "123,\"This is a text field, with comma\",234,\"more text\",\"text,,comma\"" > NEW_FILE.txt

# Extract columns 3 4 and 5
# I'm using awk to change all valid commas to a pipe character, then doing the normal "cut" using "|"
awk -F, '{ bs = $1 
  for (i=2; i<=NF; i++) {
    if (s) {
      if ($i ~ "\"$") {   bs = bs"|"s","$i; s=""}
      else s = s","$i
    }
    else {
      if ($i ~ "^\".*\"$") bs = bs"|"$i
      else if ($i ~ "^\"") s = $i
      else bs = bs"|"$i
    }
  }
print bs"|"$NF
}' NEW_FILE.txt | cut -d "|" -f 3,4,5 --output-delimiter=","
