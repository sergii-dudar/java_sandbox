#!/bin/bash

#pwd

cd testfiles || exit

#who > users
who >> users # append
# cat users

wc -l < users
