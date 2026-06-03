#!/usr/bin/env bash

# Variant: snapshot testing.
# The first run creates snapshots/ files; subsequent runs compare against them.
# Keep snapshot input deterministic so the test is stable.

function test_match_snapshot() {
  local output
  output="$(printf 'id: 1\nname: bashunit\nstatus: active\n')"
  assert_match_snapshot "$output"
}

function test_match_snapshot_ignore_colors() {
  # ANSI color codes are stripped before comparison.
  assert_match_snapshot_ignore_colors "$(printf '\e[31mERROR\e[0m: something')"
}
