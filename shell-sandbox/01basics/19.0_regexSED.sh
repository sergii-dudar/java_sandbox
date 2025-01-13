#!/bin/bash
# https://www.tutorialspoint.com/unix/unix-regular-expressions.htm

# SED stands for stream editor. This stream-oriented editor was created exclusively for executing scripts.
#   Thus, all the input you feed into it passes through and goes to STDOUT and it does not change the input file.

# syntax: /pattern/action
# pattern is a regular expression
# action is one of the commands given in the following table

# p - Prints the line
# d - Deletes the line
# s/pattern1/pattern2/ - Substitutes the first occurrence of pattern1 with pattern2

# If pattern is omitted, action is performed for every line as we have seen above.

cd "testfiles" || exit
#cat testpasswd

#------------- Deleting All Lines with sed

# cat "testpasswd" | sed 'd'
# or
# sed -e 'd' "testpasswd"


#-------------- The sed Addresses
# cat "testpasswd" | sed '1d' # delete the first line of file and print the rest of the file

#cat "testpasswd" | sed '1, 5d' # The above command will be applied on all the lines starting from 1 through 5. This deletes the first five lines.

# cat "testpasswd" | sed 's/root/amrood/g'

#--------------- Alternative String Separator
# cat "testpasswd" | sed 's:/root:/amrood:g'

#--------------- Replacing with Empty Space
#cat "testpasswd" | sed 's/root//g'

#-----------------------------------------------------
#--------------- The Matching Command
# You would use the "p" option along with the "-n" option to print all the matching lines as follows

# cat "testpasswd" | sed -n '/sh/p'

#---------------- Using Regular Expression

cat "testpasswd" | sed -n '/sh$/p'

# g - Replaces all matches, not just the first match
# NUMBER - Replaces only NUMBERth match
# p - If substitution was made, then prints the pattern space
# w FILENAME - If substitution was made, then writes result to FILENAME
# I or i - Matches in a case-insensitive manner
# M or m - In addition to the normal behavior of the special regular expression characters ^ and $, this flag causes ^ to match the empty string after a newline and $ to match the empty string before a newline
