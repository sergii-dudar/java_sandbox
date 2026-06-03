#!/usr/bin/env bash

# Variant: string content / pattern assertions.

function set_up() {
  source "$(dirname "${BASH_SOURCE[0]}")/../src/strings.sh"
}

function test_contains() {
  assert_contains "world" "$(say_hi world)"
  assert_not_contains "bye" "$(say_hi world)"
  assert_contains_ignore_case "HI" "$(say_hi world)"
}

function test_starts_and_ends_with() {
  assert_string_starts_with "Hi," "$(say_hi Alice)"
  assert_string_ends_with "!" "$(say_hi Alice)"
  assert_string_not_starts_with "Bye" "$(say_hi Alice)"
  assert_string_not_ends_with "?" "$(say_hi Alice)"
}

function test_regex_matches() {
  assert_matches "^Hi, [A-Z][a-z]+!$" "$(say_hi Alice)"
  assert_not_matches "^[0-9]+$" "$(say_hi Alice)"
}

function test_format_matches() {
  # %s matches any string, %d any number (printf-style format tokens).
  assert_string_matches_format "Hi, %s!" "$(say_hi Bob)"
  assert_string_not_matches_format "%d" "$(say_hi Bob)"
}

function test_line_count() {
  assert_line_count 3 "$(printf 'a\nb\nc')"
}
