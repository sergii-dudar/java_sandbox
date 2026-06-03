#!/usr/bin/env bash

# Variant: test doubles -- mocks (override behavior) and spies (record calls).

function test_mock_with_args() {
  bashunit::mock date echo "2024-05-01"

  assert_same "2024-05-01" "$(date)"
}

function test_mock_with_heredoc_output() {
  bashunit::mock uname <<< "Linux"

  assert_same "Linux" "$(uname)"
}

function test_mock_conditional_on_args() {
  function fake_tool() {
    if [[ "$1" == "--version" ]]; then
      echo "1.2.3"
      return 0
    fi
    echo "tool: '$1' is not a valid command." >&2
    return 1
  }

  bashunit::mock tool fake_tool

  assert_same "1.2.3" "$(tool --version)"
  assert_successful_code
}

function test_spy_records_calls() {
  bashunit::spy git

  git status
  git commit -m "msg"

  assert_have_been_called git
  assert_have_been_called_times 2 git
}

function test_spy_call_arguments() {
  bashunit::spy curl

  curl https://example.com
  curl https://github.com

  assert_have_been_called_with curl "https://example.com" 1
  assert_have_been_called_nth_with 2 curl "https://github.com"
}

function test_spy_not_called() {
  bashunit::spy rm

  assert_not_called rm
}
