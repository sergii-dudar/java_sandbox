#!/usr/bin/env bash

# Variant: all four lifecycle hooks.
#   set_up_before_script   -> once, before any test in the file
#   set_up                 -> before each test
#   tear_down              -> after each test
#   tear_down_after_script -> once, after all tests in the file

function set_up_before_script() {
    SHARED_LOG="$(bashunit::temp_file)"
    echo "script-start" >> "$SHARED_LOG"
}

function set_up() {
    CURRENT_VALUE="initialized"
}

function tear_down() {
    CURRENT_VALUE=""
}

function tear_down_after_script() {
    rm -f "$SHARED_LOG"
}

function test_set_up_ran() {
    assert_same "initialized" "$CURRENT_VALUE"
}

function test_shared_resource_available() {
    assert_file_contains "$SHARED_LOG" "script-start"
}

function test_custom_title() {
    bashunit::set_test_title "a friendly custom title for this test"
    assert_true "true"
}
