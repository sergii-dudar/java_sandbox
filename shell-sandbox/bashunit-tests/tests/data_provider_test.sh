#!/usr/bin/env bash

# Variant: data providers (parameterized tests).

function set_up() {
  source "$(dirname "${BASH_SOURCE[0]}")/../src/strings.sh"
}

# Single argument across multiple runs.
# @data_provider provider_even_numbers
function test_number_is_even() {
  local number=$1
  source "$(dirname "${BASH_SOURCE[0]}")/../src/calculator.sh"
  assert_true "eval is_even $number"
}

function provider_even_numbers() {
  bashunit::data_set 2
  bashunit::data_set 4
  bashunit::data_set 100
}

# Multiple arguments per run.
# @data_provider provider_fizzbuzz
function test_fizzbuzz() {
  local input=$1
  local expected=$2
  assert_same "$expected" "$(fizzbuzz "$input")"
}

function provider_fizzbuzz() {
  bashunit::data_set 1 "1"
  bashunit::data_set 3 "Fizz"
  bashunit::data_set 5 "Buzz"
  bashunit::data_set 15 "FizzBuzz"
}

# Data sets can contain spaces and empty values.
# @data_provider provider_slugs
function test_slugify() {
  local input=$1
  local expected=$2
  assert_same "$expected" "$(slugify "$input")"
}

function provider_slugs() {
  bashunit::data_set "Hello World" "hello-world"
  bashunit::data_set "ALL CAPS" "all-caps"
}
