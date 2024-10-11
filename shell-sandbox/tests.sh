#!/bin/bash

test() {
    return 0
}

find_git_root() {
    return 1
}

if ! find_git_root && test; then
    echo "Condition met"
else
    echo "Condition not met."
fi