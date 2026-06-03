"""Variant: asserting that exceptions are raised with pytest.raises."""

import pytest

from calculator import BankAccount, divide


def test_raises_basic():
    with pytest.raises(ZeroDivisionError):
        divide(10, 0)


def test_raises_and_inspect_message():
    with pytest.raises(ValueError) as exc_info:
        BankAccount(balance=10).withdraw(50)
    assert "insufficient funds" in str(exc_info.value)


def test_raises_with_match():
    # `match` applies a regex to the exception message.
    with pytest.raises(ValueError, match=r"must be positive"):
        BankAccount().deposit(-5)


def test_no_exception_path():
    account = BankAccount(balance=20)
    account.withdraw(5)
    assert account.balance == 15
