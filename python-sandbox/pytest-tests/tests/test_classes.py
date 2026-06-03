"""Variant: class-based tests with setup/teardown methods and fixtures."""

import pytest

from calculator import BankAccount


class TestBankAccount:
    """Tests grouped in a class. Method names must start with `test_`."""

    def setup_method(self, method):
        # Runs before each test method in this class.
        self.account = BankAccount(balance=100.0)

    def teardown_method(self, method):
        # Runs after each test method.
        self.account = None

    def test_deposit(self):
        self.account.deposit(50)
        assert self.account.balance == 150

    def test_withdraw(self):
        self.account.withdraw(40)
        assert self.account.balance == 60

    def test_overdraw_raises(self):
        with pytest.raises(ValueError):
            self.account.withdraw(1000)


class TestWithClassFixture:
    @pytest.fixture(autouse=True)
    def _provide_account(self, account):
        # Pull a conftest fixture into the class via an autouse fixture.
        self.account = account

    def test_uses_injected_fixture(self):
        assert self.account.balance == 100.0
