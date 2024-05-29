#!/bin/bash


# -b : File Returns	'True' if the FILE exists as a block special file.
# -c : File Returns	'True' if the FILE exists as a special character file.
# -d : File Returns	'True' if the FILE exists as a directory.
# -e : File Returns	'True' if the FILE exists as a file, regardless of type (node, directory, socket, etc.).
# -f : File Returns	'True' if the FILE exists as a regular file (not a directory or device).
# -G : File Returns	'True' if the FILE exists and contains the same group as the user is running the command.
# -h : File Returns	'True' if the FILE exists as a symbolic link.
# -g : File Returns	'True' if the FILE exists and contains set-group-id (sgid) flag set.
# -k : File Returns	'True' if the FILE exists and contains a sticky bit flag set.
# -L : File Returns	'True' if the FILE exists as a symbolic link.
# -O : File Returns	'True' if the FILE exists and is owned by the user who is running the command.
# -p : File Returns	'True' if the FILE exists as a pipe.
# -r : File Returns	'True' if the FILE exists as a readable file.
# -S : File Returns	'True' if the FILE exists as a socket.
#!!!! -s : File Returns	'True' if the FILE exists and has nonzero size.
# -u : File Returns	'True' if the FILE exists, and set-user-id (suid) flag is set.
# -w : File Returns	'True' if the FILE exists as a writable file.
# -x : File Returns	'True' if the FILE exists as an executable file.


# Following are the syntaxes of the test command, and we can use any of these commands:
#   test expression
#   [ expression ]
#   [[ expression ]]

# the most commonly used file operators are -e and -f
# '-e' option is used to check whether a file exists regardless of the type
# '-f' option is used to return true value only if the file is a regular file

dir="/home/serhii/serhii.home/personal/git/java_sandbox/testfiles"
file="$dir/testpasswd"
if test -f "$file"; then
  echo "$file exist "
fi

if [ -f "$file" ]; then
  echo "$file exist "
fi

if [[ -f "$file" ]]; then
  echo "$file exist "
fi

echo
test -f "$file" && echo "$file exist"
[ -f "$file" ] && echo "$file exist"
[[ -f "$file" ]] && echo "$file exist"

echo
[ -f $file ] && {
  echo "$file exist"
  echo "Task Completed"
}
[ -f $file ] && echo "$file exist" || echo "$file does not exist"

echo -e "\n---------#Check If Directory Exists "
# '-d' allows us to test whether a file is a directory or not.

if [ -d "$dir" ]; then
  echo "$dir is a directory"
fi

[[ -d "$dir" ]] && echo "$dir is a directory"

#---------------------------------------------------------
echo -e "\n---------#Check IF File does not Exist "

unexists=missing_read_file.txt
if [ ! -f "$unexists" ]; then
  echo "$unexists does not exist"
fi

[ ! -f "$unexists" ] && echo "$unexists unavailable"
