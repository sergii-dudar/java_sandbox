#!/usr/bin/env bash

# Variant: date, duration and JSON assertions.
# (JSON assertions require `jq`; they are skipped automatically if it is absent.)

function test_date_comparisons() {
  assert_date_equals "2024-01-01" "2024-01-01 00:00:00"
  assert_date_before "2024-06-01" "2024-01-01"  # 2nd arg (subject) is before 1st
  assert_date_after "2024-01-01" "2024-06-01"   # 2nd arg (subject) is after 1st
}

function test_date_within_delta() {
  # actual is within 120 seconds of expected.
  assert_date_within_delta "2024-01-01 00:00:00" "2024-01-01 00:01:30" 120
}

function test_duration() {
  assert_duration_less_than "sleep 0.01" 1000
  assert_duration_greater_than "sleep 0.05" 10
}

function test_json() {
  if ! command -v jq >/dev/null 2>&1; then
    bashunit::skip "jq is not installed" && return
  fi

  local json='{"name":"bashunit","version":"0.37.0","tags":["bash","testing"]}'
  assert_json_key_exists ".name" "$json"
  assert_json_contains ".name" "bashunit" "$json"
}
