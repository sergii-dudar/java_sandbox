"""Variant: parametrized tests in all their forms."""

import pytest

from calculator import fizzbuzz, is_even


# Single argument, multiple cases.
@pytest.mark.parametrize("number", [2, 4, 100, 0, -8])
def test_is_even_true(number):
    assert is_even(number)


# Multiple arguments per case.
@pytest.mark.parametrize(
    "value, expected",
    [
        (1, "1"),
        (3, "Fizz"),
        (5, "Buzz"),
        (15, "FizzBuzz"),
    ],
)
def test_fizzbuzz(value, expected):
    assert fizzbuzz(value) == expected


# Custom human-readable ids for nicer test output.
@pytest.mark.parametrize(
    "value, expected",
    [(3, "Fizz"), (5, "Buzz")],
    ids=["multiple-of-three", "multiple-of-five"],
)
def test_fizzbuzz_with_ids(value, expected):
    assert fizzbuzz(value) == expected


# Stacked parametrize -> cartesian product (2 x 2 = 4 test cases).
@pytest.mark.parametrize("x", [1, 2])
@pytest.mark.parametrize("y", [10, 20])
def test_cartesian_product(x, y):
    assert (x + y) > 0


# Marking a single parametrized case (e.g. an expected failure).
@pytest.mark.parametrize(
    "value, expected",
    [
        (2, True),
        pytest.param(3, True, marks=pytest.mark.xfail(reason="3 is odd")),
    ],
)
def test_parametrized_with_marked_case(value, expected):
    assert is_even(value) == expected
