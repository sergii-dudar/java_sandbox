#!/bin/bash

# cat ~/.zshrc | wc -l
# cat ~/.zshrc | nl
# wc -l .zshrc

# cat -n ~/.zshrc | tail -n 1 | cut -f1
/usr/bin/cat -n ~/.zshrc | tail -n 1 | cut -f1

# grep -c ".*" ~/.zshrc
# rg -c ".*" ~/.zshrc
# sed -n '$=' ~/.zshrc
# awk 'END{print NR}' ~/.zshrc