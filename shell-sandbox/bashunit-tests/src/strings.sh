#!/usr/bin/env bash

# String helpers used by the example tests.

function say_hi() {
  echo "Hi, $1!"
}

function to_upper() {
  echo "${1^^}"
}

function slugify() {
  local text="$1"
  text="${text,,}"
  text="${text// /-}"
  echo "$text"
}

function fizzbuzz() {
  local n="$1"
  if (( n % 15 == 0 )); then
    echo "FizzBuzz"
  elif (( n % 3 == 0 )); then
    echo "Fizz"
  elif (( n % 5 == 0 )); then
    echo "Buzz"
  else
    echo "$n"
  fi
}
