cat /etc/passwd | awk '{print $1}'
cat /etc/passwd | cut -f1 -d :
cat /etc/passwd | awk -F ':' '{print $1}'
awk -F : '{print $1}' /etc/passwd
awk -F : '/serhii/ {print $1}' /etc/passwd
awk -F : '/serhii/ {print $NF}' /etc/passwd # NF - last column

# ---------------

awk '{print $1" "$2}' /etc/netconfig | grep -v "^#"
awk '!/^#/ {print $1" "$2}' /etc/netconfig
awk '!/^#/ {print $1" "$2}' /etc/netconfig | sed 's/ / XXX /g'

awk '{print $1" "$2}' ~/.zshrc

awk '/alias/' ~/.zshrc
awk '/alias/ {print $1}' ~/.zshrc

# ----------------

xrandr | grep connected | cut -f1 -d " " # cut uses TAB as default delim
xrandr | grep connected | awk '{print $1}'

# ----------------

# cat equivalent
awk '{print $0}' ~/.zshrc # $0 - whole line


# grep equivalent
awk '/#/' ~/.zshrc
awk '$1 == "#" {print $2}' ~/.zshrc
awk '$1 ~ "if" {print $3" "$4}' ~/.zshrc
awk '$1 !~ "if" {print $3" "$4}' ~/.zshrc

grep -i 'dir' ~/.zshrc
sed '/[Vv]im/!d' ~/.zshrc
awk 'tolower($0) ~ /vim/' ~/.zshrc

# head
head ~/.zshrc
sed 11q ~/.zshrc
awk '(NR>=0 && NR<=11){print} (NR==11){exit}' ~/.zshrc # NR - number of record