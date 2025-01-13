#!/bin/bash





file='/home/serhii/serhii.home/personal/git/java_sandbox/shell-sandbox/tutpoint/07fileTestOperators.sh'

#-b file	Checks if file is a block special file; if yes, then the condition becomes true.	[ -b $file ] is false.
if [[ -b $file ]]; then
  echo '-b file is true'
else
  echo '-b file is false'
fi

#-c file	Checks if file is a character special file; if yes, then the condition becomes true.	[ -c $file ] is false.


#-d file	Checks if file is a directory; if yes, then the condition becomes true.	[ -d $file ] is not true.
if [[ -b $file ]]; then
  echo 'is directory: true'
else
  echo 'is directory: false'
fi

#-f file	Checks if file is an ordinary file as opposed to a directory or special file; if yes, then the condition becomes true.	[ -f $file ] is true.
if [[ -f $file ]]; then
  echo 'is file: true'
else
  echo 'is file: false'
fi

#-g file	Checks if file has its set group ID (SGID) bit set; if yes, then the condition becomes true.	[ -g $file ] is false.


#-k file	Checks if file has its sticky bit set; if yes, then the condition becomes true.	[ -k $file ] is false.


#-p file	Checks if file is a named pipe; if yes, then the condition becomes true.	[ -p $file ] is false.


#-t file	Checks if file descriptor is open and associated with a terminal; if yes, then the condition becomes true.	[ -t $file ] is false.


#-u file	Checks if file has its Set User ID (SUID) bit set; if yes, then the condition becomes true.	[ -u $file ] is false.


#-r file	Checks if file is readable; if yes, then the condition becomes true.	[ -r $file ] is true.
if [[ -r $file ]]; then
  echo 'is readable: true'
else
  echo 'is readable: false'
fi

#-w file	Checks if file is writable; if yes, then the condition becomes true.	[ -w $file ] is true.
if [[ -w $file ]]; then
  echo 'is writable: true'
else
  echo 'is writable: false'
fi

#-x file	Checks if file is executable; if yes, then the condition becomes true.	[ -x $file ] is true.
if [[ -x $file ]]; then
  echo 'is executable: true'
else
  echo 'is executable: false'
fi

#-s file	Checks if file has size greater than 0; if yes, then condition becomes true.	[ -s $file ] is true.
if [[ -s $file ]]; then
  echo 'is file has size greater than 0: true'
else
  echo 'is file has size greater than 0: false'
fi

#-e file	Checks if file exists; is true even if file is a directory but exists.	[ -e $file ] is true.
if [[ -e $file ]]; then
  echo 'is file exists: true'
else
  echo 'is file exists: false'
fi

if [[ ! -e $file ]]; then
  echo 'is file exists: true'
else
  echo 'is file exists: false'
fi
