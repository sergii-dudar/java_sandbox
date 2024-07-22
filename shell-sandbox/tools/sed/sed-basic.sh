# sed 's/find/replace' < oldfile > newfile

###################################################
############## sed substitution (replace)
###################################################

echo "Serhii" | sed 's/Serhii/Ser/'
echo "the Emacs file manager is dired red." | sed 's/ red/ green/'

sed 's/o/O/' .zshrc
cat .zshrc | head | sed 's/o/O/'

head .zshrc | sed 's/o/O/' # replace first in line
head .zshrc | sed 's/o/O/g' # replace all in line

# read and replace in same file
# sed -i 's/apple/mango/g' <file> # same as: sed 's/apple/mango/g' < <file> > <file>
sed -i 's/find/replace/g' filename
# sed -i 's/o/O/' .zshrc

# delete extra spaces on the end of all lines
sed -i 's/ *$//' test.txt
sed -i 's/[[:space:]]*$//' test.txt

# change lower case symbols to upper/lower case
cat .zshrc | head | sed 's/[a-z]/\U&/g'
cat .zshrc | head | sed 's/[A-Z]/\L&/g'

# ==========================================
# =========Find all lines by pattern, then apply substitution
# sed '/Pattern/s/find/replace/'
tldr sed | sed '/Replace/s/the/THE/g'

###################################################
############## multiple substitution (replace)
###################################################

cat '/etc/shells' | sed -e 's/usr/u/g' -e 's/bin/b/g'

# another possible special symbol (in case the are not part of patterns)
cat '/etc/shells' | sed -e 's|usr|u|g' -e 's|bin|b|g'
cat '/etc/shells' | sed -e 's:usr:u:g' -e 's:bin:b:g'
cat '/etc/shells' | sed -e 's#usr#u#g' -e 's#bin#b#g'
cat '/etc/shells' | sed -e 's!usr!u!g'
# ...

###################################################
############## sed delete lines
###################################################

short sed | sed '/Replace/d'

# delete empty lines
cat .zshrc | head | sed '/^$/d'

###################################################
############## sed find lines
###################################################

# -n: find lines
#  p: print
cat '/etc/shells' | sed -n '/usr/p'

###################################################
############## head replacement
###################################################

cat .zshrc | head # same as head --lines 10
cat .zshrc | sed 10q
cat .zshrc | awk 'NR <= 10'