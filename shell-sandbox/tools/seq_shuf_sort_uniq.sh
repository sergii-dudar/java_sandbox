seq 50 | shuf

# random number
seq 10 | shuf -n 1
seq 10 | shuf -n 5

# 5 random lines from file
shuf -n 5 .zshrc

# random from inclusive range
shuf -n 3 -i 1-10 # all uniq
shuf -n 3 -i 1-10 --repeat # no uniq, can be repeated

# ==================
# sort
sort .zshrc # alphabeticaly, -n for numerical sort
sort -r .zshrc # reverse, desc

# sort by column and separator
sort -t : -k 5n /etc/passwd # -k 5n - sort by 5 column

# sort only uniq lines
sort -u .zshrc
# sort -u .zshrc | wc -l | wc -l [ less than as no dup ] sort .zshrc

# random sort
sort -R .zshrc

#==============================
#=========== uniq

# sort and return only uniq lines (distinct)
sort .zshrc | uniq # same as: sort -u .zshrc

# return only uniq lines (if present not uniq line, it will not be returned)
sort .zshrc | uniq -u

# return only duplicates lines
sort .zshrc | uniq -d

# lines with number of occurences (duplications)
sort .zshrc | uniq -c


# uniq -c < .zshrc | sort -nr | head --lines 3
sort .zshrc | uniq -c | sort -nr | head --lines 3 # -nr: numberical reverced
# 35
#  1 source $ZSH/oh-my-zsh.sh
#  1 source "$HOME/serhii.shell/variables.sh"
