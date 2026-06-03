"""Variant: custom assertion helpers shared via a base TestCase."""

import unittest

from calculator import add


class CustomAssertions(unittest.TestCase):
    """Reusable mixin: define domain-specific assertions once, reuse everywhere."""

    def assertIsPalindrome(self, value, msg=None):
        if value != value[::-1]:
            standard = self._formatMessage(msg, f"{value!r} is not a palindrome")
            raise self.failureException(standard)

    def assertHttpSuccess(self, status_code, msg=None):
        # Compose existing assertions.
        self.assertGreaterEqual(status_code, 200, msg)
        self.assertLess(status_code, 300, msg)


class TestCustomAssertions(CustomAssertions):
    def test_palindrome(self):
        self.assertIsPalindrome("level")
        self.assertIsPalindrome("racecar")

    def test_http_success(self):
        self.assertHttpSuccess(200)
        self.assertHttpSuccess(204)

    def test_type_equality_function(self):
        # addTypeEqualityFunc customizes how assertEqual compares a given type.
        self.addTypeEqualityFunc(int, self._ints_equal)
        self.assertEqual(add(2, 2), 4)

    def _ints_equal(self, first, second, msg=None):
        if first != second:
            raise self.failureException(msg or f"{first} != {second}")


if __name__ == "__main__":
    unittest.main()
