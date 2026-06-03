#!/usr/bin/env bash

# Variant: custom assertions built on top of the bashunit facade.

# A simple custom assertion using assertion_passed / assertion_failed.
function assert_is_palindrome() {
  local value="$1"
  local reversed
  reversed="$(echo "$value" | rev)"

  if [[ "$value" != "$reversed" ]]; then
    bashunit::assertion_failed "a palindrome" "$value"
    return
  fi

  bashunit::assertion_passed
}

# A custom assertion composed from existing built-in assertions.
function assert_http_success() {
  local status_code="$1"
  assert_greater_or_equal_than 200 "$status_code"
  assert_less_than 300 "$status_code"
}

function test_palindrome_passes() {
  assert_is_palindrome "level"
  assert_is_palindrome "racecar"
}

function test_http_success_helper() {
  assert_http_success 200
  assert_http_success 204
}
