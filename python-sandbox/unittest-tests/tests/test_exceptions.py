"""Variant: asserting exceptions with assertRaises / assertRaisesRegex."""

import unittest

from calculator import BankAccount, divide


class TestExceptions(unittest.TestCase):
    def test_assert_raises_callable(self):
        # Callable form: assertRaises(Exc, func, *args).
        self.assertRaises(ZeroDivisionError, divide, 10, 0)

    def test_assert_raises_context_manager(self):
        with self.assertRaises(ValueError) as ctx:
            BankAccount(balance=10).withdraw(50)
        self.assertIn("insufficient funds", str(ctx.exception))

    def test_assert_raises_regex(self):
        with self.assertRaisesRegex(ValueError, r"must be positive"):
            BankAccount().deposit(-5)

    def test_no_exception(self):
        account = BankAccount(balance=20)
        account.withdraw(5)
        self.assertEqual(account.balance, 15)


if __name__ == "__main__":
    unittest.main()
