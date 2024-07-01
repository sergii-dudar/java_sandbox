#!/bin/bash

# get first line
head --lines 1 ~/.zshrc
cat .zshrc | head --lines 5

# get last list
tail --lines 1 ~/.zshrc
cat .zshrc | tail --lines 5

# cat .zshrc | less
# less ~/.zshrc
