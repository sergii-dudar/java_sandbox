#!/bin/bash

# cat ~/.zshrc | wc -l
# cat ~/.zshrc | nl

# cat -n ~/.zshrc | tail -n 1 | cut -f1
#bat -n ~/.zshrc # | tail -n 1 # | cut -f1
bat ~/.zshrc

# grep -c ".*" ~/.zshrc
# rg -c ".*" ~/.zshrc
# sed -n '$=' ~/.zshrc
# awk 'END{print NR}' ~/.zshrc