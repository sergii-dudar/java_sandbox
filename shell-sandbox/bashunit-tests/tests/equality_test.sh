#!/usr/bin/env bash

# Variant: core equality, identity and truthiness assertions.

function set_up() {
  source "$(dirname "${BASH_SOURCE[0]}")/../src/calculator.sh"
}

function test_equals_and_not_equals() {
  assert_equals 5 "$(calc_add 2 3)"
  assert_not_equals 6 "$(calc_add 2 3)"
}

function test_same_and_not_same() {
  # assert_same is a strict string comparison (no type coercion).
  assert_same "hello world" "hello world"
  assert_not_same "Hello" "hello"
}

function test_true_and_false() {
  # assert_true/assert_false evaluate the given expression's exit code.
  # Prefix with `eval` when the expression has arguments.
  assert_true "eval is_even 4"
  assert_false "eval is_even 5"
}

function test_empty_and_not_empty() {
  assert_empty ""
  assert_not_empty "something"
}
