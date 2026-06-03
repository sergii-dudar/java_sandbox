#!/usr/bin/env bash

# Variant: exit-code / command-execution assertions.

function set_up() {
  source "$(dirname "${BASH_SOURCE[0]}")/../src/calculator.sh"
}

function test_successful_command() {
  calc_divide 10 2 >/dev/null
  assert_successful_code
}

function test_division_by_zero_fails() {
  calc_divide 10 0 2>/dev/null
  assert_general_error          # asserts exit code == 1
  calc_divide 10 0 2>/dev/null
  assert_exit_code 1            # asserts a specific exit code
}

function test_unsuccessful_code() {
  false
  assert_unsuccessful_code      # asserts any non-zero exit code
}

function test_command_not_found() {
  definitely_not_a_real_command_xyz 2>/dev/null
  assert_command_not_found      # asserts exit code == 127
}

function test_assert_exec_stdout() {
  # assert_exec runs a command (1st arg) and checks exit/stdout/stderr via flags.
  assert_exec "calc_add 2 3" --exit 0 --stdout "5"
}

function test_assert_exec_stderr() {
  assert_exec "calc_divide 10 0" --exit 1 --stderr-contains "division by zero"
}
