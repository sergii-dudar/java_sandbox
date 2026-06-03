#!/usr/bin/env bash

# Variant: file and folder assertions, using lifecycle hooks for temp fixtures.

function set_up() {
  TEST_DIR="$(bashunit::temp_dir)"
  TEST_FILE="$TEST_DIR/data.txt"
  printf 'line one\nline two\n' > "$TEST_FILE"
}

function tear_down() {
  rm -rf "$TEST_DIR"
}

function test_file_existence() {
  assert_file_exists "$TEST_FILE"
  assert_file_not_exists "$TEST_DIR/missing.txt"
  assert_is_file "$TEST_FILE"
}

function test_file_contents() {
  assert_file_contains "$TEST_FILE" "line one"
  assert_file_not_contains "$TEST_FILE" "line three"
}

function test_directory_assertions() {
  assert_directory_exists "$TEST_DIR"
  assert_directory_not_exists "$TEST_DIR/nope"
  assert_is_directory "$TEST_DIR"
  assert_is_directory_not_empty "$TEST_DIR"
}

function test_empty_file() {
  local empty="$TEST_DIR/empty.txt"
  : > "$empty"
  assert_is_file_empty "$empty"
}
