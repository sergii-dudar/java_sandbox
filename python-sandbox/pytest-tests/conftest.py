"""Project-wide fixtures and hooks.

`conftest.py` is automatically discovered by pytest; anything defined here is
available to every test module without an explicit import.
"""

from __future__ import annotations

import pytest

from calculator import BankAccount


@pytest.fixture
def account() -> BankAccount:
    """A fresh, function-scoped account for each test that requests it."""
    return BankAccount(balance=100.0)


@pytest.fixture(scope="session")
def session_marker() -> str:
    """Session-scoped fixture: created once for the whole test run."""
    return "shared-across-the-session"


@pytest.fixture
def numbers() -> list[int]:
    return [1, 2, 3, 4, 5]
