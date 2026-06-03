"""Variant: the rich family of TestCase assertion methods."""

import math
import unittest

from calculator import add, is_even


class TestAssertions(unittest.TestCase):
    def test_equality(self):
        self.assertEqual(add(2, 3), 5)
        self.assertNotEqual(add(2, 3), 6)

    def test_truthiness(self):
        self.assertTrue(is_even(4))
        self.assertFalse(is_even(5))
        self.assertIsNone(None)
        self.assertIsNotNone("x")

    def test_membership_and_identity(self):
        fruits = ["apple", "banana", "cherry"]
        self.assertIn("banana", fruits)
        self.assertNotIn("mango", fruits)
        self.assertIs(fruits, fruits)
        self.assertIsInstance(fruits, list)

    def test_numeric_comparisons(self):
        self.assertGreater(add(2, 3), 4)
        self.assertGreaterEqual(add(2, 3), 5)
        self.assertLess(add(2, 3), 10)
        self.assertLessEqual(add(2, 3), 5)

    def test_float_almost_equal(self):
        self.assertAlmostEqual(0.1 + 0.2, 0.3)
        self.assertAlmostEqual(math.sqrt(2), 1.41421356, places=6)

    def test_collections(self):
        self.assertListEqual([1, 2, 3], [1, 2, 3])
        self.assertDictEqual({"a": 1, "b": 2}, {"b": 2, "a": 1})
        self.assertCountEqual([3, 1, 2], [1, 2, 3])  # same items, any order

    def test_strings(self):
        self.assertRegex("Hi, Alice!", r"^Hi, [A-Z][a-z]+!$")
        self.assertNotRegex("Hi, Alice!", r"^[0-9]+$")


if __name__ == "__main__":
    unittest.main()
