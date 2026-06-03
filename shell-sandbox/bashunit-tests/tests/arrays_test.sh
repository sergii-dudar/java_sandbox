#!/usr/bin/env bash

# Variant: array assertions.

function test_array_contains() {
  local fruits=("apple" "banana" "cherry")

  assert_array_contains "banana" "${fruits[@]}"
  assert_array_not_contains "mango" "${fruits[@]}"
}

function test_arrays_equal() {
  local expected=("a" "b" "c")
  local actual=("a" "b" "c")

  # Expected and actual element lists are separated by a literal "--".
  assert_arrays_equal "${expected[@]}" -- "${actual[@]}"
}
