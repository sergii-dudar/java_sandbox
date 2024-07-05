#!/bin/bash

#1. ; (Semicolon) -  Separates multiple commands. Each command is executed sequentially, regardless of whether the previous command succeeds or fails.
# command1; command2; command3

#2. && (Logical AND) Usage: Executes the second command only if the first command succeeds (returns a status code of 0).
# command1 && command2

#3. || (Logical OR) Usage: Executes the second command only if the first command fails (returns a non-zero status code).
# command1 || command2

#4. | (Pipe) Usage: Takes the output of the first command and uses it as the input for the second command.
# command1 | command2

#5. & (Background Execution )Usage: Runs the command in the background, allowing the terminal to accept new commands immediately.
# command1 &

#6. && ... || (Conditional Execution) Usage: A combination of logical AND and OR, allowing for more complex conditional execution. Often used to mimic an if-else statement.
# command1 && command2 || command3 #- This means: if command1 succeeds, then execute command2; otherwise, execute command3.

#7. () (Subshell) Usage: Groups commands into a subshell, where they are executed in a separate environment.
# (command1; command2; command3)

#8. {} (Command Grouping) Usage: Groups commands together (so that they are executed as a single block),
# but unlike (), they are executed in the current shell.
# { command1; command2; command3; }

#9. > (Output Redirection) Usage: Redirects the output of a command to a file, overwriting the file if it exists.
# command > file
# as 1 is stdout: [command 1> file] is same as [command > file]

#10. >> (Append Output Redirection) Usage: Redirects the output of a command to a file, appending to the file if it exists.
# command >> file

#11. < (Input Redirection) Usage: Takes the input for a command from a file.
# command < file

#12. 2> (Error Redirection) Usage: Redirects the error output (stderr) of a command to a file.
# command 2> errorfile

#13. 2>&1 (Merge stdout and stderr) Usage: Redirects stderr to the same location as stdout.
# command > file 2>&1

#14. |& (Pipe with stderr) Usage: Pipes both stdout and stderr to the next command.
# command1 |& command2

#15. && and ; in Combination - Usage: Can be combined to create complex sequences of commands with conditional logic.
# command1 && command2; command3 # This means: execute command1 and if it succeeds, execute command2, regardless of whether command2 succeeds, execute command3.

#16 ((...)) - Used for arithmetic evaluation.
# Usage: Typically used for incrementing, decrementing, and other arithmetic operations within a script. It can also be used in conditional statements.
# x=10
# ((x -= 3))
# if (( x == 7 )); then ...

#17. $((...)) - Used for arithmetic expansion.
# Evaluates the expression inside and returns the result, which can be used in variable assignments or as part of a larger command.
# x=10
# y=$((x - 3))

#---------------------------------------
#----------------------Discard the output

#16 Sometimes you will need to execute a command, but you don't want the output displayed on the screen.
#     In such cases, you can discard the output by redirecting it to the file /dev/null
# command > /dev/null # Here command is the name of the command you want to execute. The file /dev/null is a special file that automatically discards all its input.

#16.1 To discard both output of a command and its error output, use standard redirection to redirect STDERR to STDOUT
# command > /dev/null 2>&1 # Here 2 represents STDERR and 1 represents STDOUT

#for example you can display a message on to STDERR by redirecting STDOUT into STDERR as follows
# echo message 1>&2

#---------------------------------------
#----------------------Redirection Commands

#1. pgm > file - Output of pgm is redirected to file
#2. pgm < file - Program pgm reads its input from file
#3. pgm >> file - Output of pgm is appended to file
#4. n > file - Output from stream with descriptor n redirected to file
#5. n >> file - Output from stream with descriptor n appended to file
#6. n >& m - Merges output from stream n with stream m
#7. n <& m - Merges input from stream n with stream m
#8. << tag - Standard input comes from here through next tag at the start of line
#9. | - Takes output from one program, or process, and sends it to another

# Note that the file descriptor 0 is normally standard input (STDIN), 1 is standard output (STDOUT), and 2 is standard error output (STDERR).

#---------------------------------------
#----------------------stdint

#---------------------------------------
#----------------------stdout
# redirect stdout to file by `ls -l > output.txt` or `ls -l 1 > output.txt`
# Here we mentioned 1 > output.txt which means Stdout should be redirected to output.txt file. By default system considers it as Stdout.

#---------------------------------------
#----------------------stdere
#By default STDERR is your display screen but just like standard out, it can be redirected to a file to save the error messages.

#cat  nonexist.txt
#cat: nonexist.txt: No such file or directory
# You can save this error message using the file descriptor 2 as follows:
#     cat  nonexist.txt 2> err


#--------------------------------------------
