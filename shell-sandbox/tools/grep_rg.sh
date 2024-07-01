# grep it's ripgrep

grep the .zshrc
grep -w the .zshrc # search specific work, not pattern
grep -w the .zshrc ./config

pg the .zshrc
pg -w the .zshrc # search specific work, not pattern
pg -w the .zshrc ./config
rg "[aeiou]" .zshrc
rg "[z-z]" .zshrc
rg "^sou" .zshrc

# rg
# -c count
# -n, --line-number (enabled by default)
# -i ignore-case
# -H pring file name (enabled by default)
# -l pring only file name of matched file
# context, before, after, both (-C)

rg -A 3 "^sou" .zshrc
rg -B 3 "^sou" .zshrc
rg -A 3 "^sou" -B 3 .zshrc
rg -C 3 "^sou" .zshrc
# OR

rg -A3 "^sou" .zshrc
rg -B3 "^sou" .zshrc
rg -C3 "^sou" .zshrc