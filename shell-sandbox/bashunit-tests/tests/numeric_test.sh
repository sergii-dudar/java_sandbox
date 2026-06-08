#!/usr/bin/env bash

# Variant: numeric comparison assertions.

function set_up() {
    source "$(dirname "${BASH_SOURCE[0]}")/../src/calculator.sh"
}

function test_greater_than() {
    assert_greater_than 3 "$(calc_add 2 3)"
    assert_greater_or_equal_than 5 "$(calc_add 2 3)"
}

function test_less_than() {
    assert_less_than 10 "$(calc_add 2 3)"
    assert_less_or_equal_than 5 "$(calc_add 2 3)"
}
