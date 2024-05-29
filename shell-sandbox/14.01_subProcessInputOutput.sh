#!/bin/bash

# Process substitution allows a process’s input or output to be referred to using a filename.
#   It has two forms: output <(cmd), and input >(cmd).

file1=./testfiles/file1.txt
file2=./testfiles/file2.txt

echo -e "------------Output"

cat <<EOF >"$file1"
1. line 1
2. line 2
3. line 3
EOF

cat <<EOF >$file2
2. line 2
3. line 3
1. line 1
EOF

# Imagine you've two files for which you want to compare the content.
#   Using diff file1 file2 could generate false positives in the case lines are not ordered.
#   So if you want to compare those files you could create two new files, ordered, and compare those.
#   It would look like:

# sort file1 > sorted_file1
# sort file2 > sorted_file2
# diff sorted_file1 sorted_file2

#diff $file1 $file2
#cat <(sort $file1)
#echo
#cat <(sort $file2)
#echo
diff <(sort $file1) <(sort $file2)

printf "\n------------Input"

#Imagine you want to store logs of an application into a file and at the same time print 
#   it on the console. A very handy command for that is tee.

helloFile=./testfiles/hello.txt
# echo "Hello, world!" | tee ./testfiles/hello.txt

#Now let say you want to have only lower case characters in the file but keep the 
#   regular case on the output. You could use process substitution that way:

echo "Hello, world!" | tee >(tr '[:upper:]' '[:lower:]' > $helloFile)