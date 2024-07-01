echo "one two three" | xargs touch
echo "one two three" | xargs rm

# =======
seq 5 | xargs echo
# 1 2 3 4 5

seq 5 | xargs -n 2 echo
# 1 2
# 3 4
# 5

# we can not call echo, if not ourput app, xargs works as echo by default
# seq 5 | xargs -n 2

seq 5 | xargs -t
# echo 1 2 3 4 5
# 1 2 3 4 5

cut -d: -f1 /etc/passwd | sort | xargs

# ==========================
# ========= Placeholders

/usr/bin/ls | xargs -I {} echo "/home/serhii/{}"
/usr/bin/ls | xargs -I XXX echo "/home/serhii/XXX"

seq 1000 | xargs -I {} touch {}.txt
/usr/bin/ls | cut -d . -f1 | xargs -I {} mv {}.txt {}.text


la | xargs -t -n 5
# echo 1.text 2.text 3.text 4.text 5.text
# 1.text 2.text 3.text 4.text 5.text
# echo 6.text 7.text 8.text 9.text 10.text
# 6.text 7.text 8.text 9.text 10.text
# ...

# ============ Processes
seq 5 | xargs -n 1 bash -c 'echo $0'
seq 5 | xargs -n 1 -P 2 bash -c 'echo $0; sleep 1'


# =======================
time /usr/bin/find . -type f -name "*.text" -exec rm {} \; # The \; is a necessary part of the -exec syntax. Without it, find would not know where the -exec command ends, leading to a syntax error.
time /usr/bin/find . -type f -name "*.txt" | xargs rm # 10 time faster