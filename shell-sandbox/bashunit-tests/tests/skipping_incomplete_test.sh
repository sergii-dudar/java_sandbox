#!/usr/bin/env bash

# Variant: skipping tests and marking them incomplete (todo).

function test_skipped_conditionally() {
  if [[ "$(uname -s)" != "GEOS" ]]; then
    bashunit::skip "Only runs under the (fictional) GEOS operating system" && return
  fi

  assert_empty "not reached"
}

function test_incomplete_feature() {
  bashunit::todo "Implement assertion once the parser is finished"
}

function test_that_actually_runs() {
  assert_true "true"
}
