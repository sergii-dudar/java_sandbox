"""Variant: plain assertions and float comparison with pytest.approx."""

import math

import pytest

from calculator import add, is_even


def test_plain_assertions():
    assert add(2, 3) == 5
    assert add(2, 3) != 6
    assert is_even(4) is True
    assert not is_even(5)


def test_membership_and_identity():
    fruits = ["apple", "banana", "cherry"]
    assert "banana" in fruits
    assert "mango" not in fruits
    assert fruits[0] is fruits[0]


def test_float_approx():
    # Floating point math is not exact -> use pytest.approx.
    assert 0.1 + 0.2 == pytest.approx(0.3)
    assert math.sqrt(2) == pytest.approx(1.41421356, rel=1e-6)


def test_collections_compared_richly():
    assert {"a": 1, "b": 2} == {"b": 2, "a": 1}
    assert sorted([3, 1, 2]) == [1, 2, 3]
