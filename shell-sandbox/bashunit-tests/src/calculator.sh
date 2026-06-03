#!/usr/bin/env bash

# A tiny library used as the "system under test" for the example tests.

function calc_add() {
  echo $(( $1 + $2 ))
}

function calc_sub() {
  echo $(( $1 - $2 ))
}

function calc_divide() {
  local dividend=$1
  local divisor=$2

  if [[ "$divisor" -eq 0 ]]; then
    echo "error: division by zero" >&2
    return 1
  fi

  echo $(( dividend / divisor ))
}

function is_even() {
  (( $1 % 2 == 0 ))
}
