"""Variant: parametrization via subTests and via test generation."""

import unittest

from calculator import fizzbuzz, is_even


class TestSubTests(unittest.TestCase):
    def test_is_even_with_subtests(self):
        # Each subTest is reported independently; one failure doesn't stop the rest.
        for number in (2, 4, 100, 0, -8):
            with self.subTest(number=number):
                self.assertTrue(is_even(number))

    def test_fizzbuzz_cases(self):
        cases = [
            (1, "1"),
            (3, "Fizz"),
            (5, "Buzz"),
            (15, "FizzBuzz"),
        ]
        for value, expected in cases:
            with self.subTest(value=value, expected=expected):
                self.assertEqual(fizzbuzz(value), expected)


def _make_even_test(number):
    def test(self):
        self.assertTrue(is_even(number))

    return test


class TestGeneratedMethods(unittest.TestCase):
    """Dynamically attach a separate test method per parameter."""


for _n in (2, 6, 42):
    setattr(TestGeneratedMethods, f"test_is_even_{_n}", _make_even_test(_n))


if __name__ == "__main__":
    unittest.main()
