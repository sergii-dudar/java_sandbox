###################################
######### print columns
###################################
# by default spaces is separator symbol

# print first column (PID) of ps command
command ps | awk '{print $1}'

# print whole line, as `cat`
command ps | awk '{print $0}'