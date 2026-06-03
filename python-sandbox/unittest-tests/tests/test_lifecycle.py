"""Variant: all lifecycle hooks.

  setUpModule / tearDownModule     -> once per module
  setUpClass / tearDownClass       -> once per TestCase class (classmethods)
  setUp / tearDown                 -> before/after each test method
  addCleanup                       -> LIFO cleanup callbacks
"""

import unittest

from calculator import BankAccount

_EVENTS: list[str] = []


def setUpModule():
    _EVENTS.append("module-setup")


def tearDownModule():
    _EVENTS.append("module-teardown")


class TestLifecycle(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        _EVENTS.append("class-setup")
        cls.shared = "created once for the class"

    @classmethod
    def tearDownClass(cls):
        _EVENTS.append("class-teardown")

    def setUp(self):
        # Fresh state before each test.
        self.account = BankAccount(balance=100.0)
        # Cleanups run after the test even if it raises.
        self.addCleanup(_EVENTS.append, "cleanup")

    def tearDown(self):
        self.account = None

    def test_module_setup_ran(self):
        self.assertIn("module-setup", _EVENTS)

    def test_class_setup_ran(self):
        self.assertEqual(self.shared, "created once for the class")

    def test_per_test_setup(self):
        self.account.deposit(50)
        self.assertEqual(self.account.balance, 150)


if __name__ == "__main__":
    unittest.main()
