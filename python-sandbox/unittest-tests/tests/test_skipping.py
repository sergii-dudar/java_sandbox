"""Variant: skipping and expected failures."""

import sys
import unittest

from calculator import add


class TestSkipping(unittest.TestCase):
    @unittest.skip("demonstrates an unconditionally skipped test")
    def test_always_skipped(self):
        self.fail("never executed")

    @unittest.skipIf(sys.version_info < (3, 8), "requires Python 3.8+")
    def test_skip_if_old_python(self):
        self.assertEqual(add(1, 1), 2)

    @unittest.skipUnless(sys.platform.startswith("linux"), "only on Linux")
    def test_skip_unless_linux(self):
        self.assertEqual(add(2, 2), 4)

    def test_skip_imperatively(self):
        if not sys.platform.startswith("linux"):
            self.skipTest("only meaningful on Linux")
        self.assertEqual(add(3, 3), 6)

    @unittest.expectedFailure
    def test_known_bug(self):
        # Reported as "expected failure", not as an error.
        self.assertEqual(add(1, 1), 3)


@unittest.skip("the whole class can be skipped too")
class TestEntireClassSkipped(unittest.TestCase):
    def test_not_run(self):
        self.fail("never executed")


if __name__ == "__main__":
    unittest.main()
