# STDIN 0   /dev/stdin
# STDOUT 1  /dev/stdout
# STDERR 2  /dev/stderr
# BLACK HOLL=)) /deb/null

# cat 0< .bashrc 1> /dev/stdout
cat .bashrc > newfile.txt
cat .bashrc >> newfile.txt

# suppress
ls -z 2> /deb/null

# same as > or >> (if -a), but also populate output to /dev/stdout
echo "Hello, World!" | tee newfile.txt # like: echo "Hello, World!" > newfile.txt && cat newfile.txt
echo "Hello, World!" | tee -a newfile.txt # like: echo "Hello, World!" >> newfile.txt && cat newfile.txt

# resolving sudo privileges:
# echo 1 > /proc/sys/kernel/sysrq # not work
# sudo echo 1 > /proc/sys/kernel/sysrq # not work, as echo not need sudo
# echo 1 | sudo tee /proc/sys/kernel/sysrq # work


# command - command built-in in Bash is used to execute a command while
# bypassing any aliases or shell functions that might override it.

# Using command cat .bashrc ensures that the system's default cat command is used,
# regardless of any aliases or functions named cat that might be defined in the shell.
alias cat='bat'
command cat .bashrc # it will use /usr/bin/cat , and will skip alias


