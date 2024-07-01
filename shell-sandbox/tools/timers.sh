#\r: This is a carriage return character.
# It moves the cursor back to the beginning of
# the current line without advancing to the next line.
# When combined with thwhile true; do printf '%s\r' "$(date)"; donee output from date, it causes the
# printed text to be overwritten if more text is printed afterward.

while true; do printf '%s\r' "$(date)"; done
for i in $(seq 60 -1 1); do echo -ne "\r$i"; sleep 1; done

n=100; while [[ $((--n)) -gt 0 ]]; do echo $n | figlet -c | lolcat && sleep 1; done

# https://github.com/trehn/termdown